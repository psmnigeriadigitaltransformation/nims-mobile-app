import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/movement_types_response.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';
import '../../domain/models/movement_category.dart';

class MovementTypesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  MovementTypesRepository(this._apiService, this._localService);

  Future<Result<List<DomainMovementType>>> getMovementTypes(
    bool refresh,
  ) async {
    try {
      final cachedMovementTypes = await _localService.getCachedMovementTypes();
      if (cachedMovementTypes.isNotEmpty && !refresh) {
        return Success(cachedMovementTypes);
      } else {
        final result = await _apiService.getMovementTypes();
        developer.log(
          "result: $result",
          name: "MovementTypesRepository:getMovementTypes",
        );
        switch (result) {
          case Success<MovementTypesResponse>(payload: final data):
            developer.log(
              "data: $data",
              name: "MovementTypesRepository:getMovementTypes",
            );
            final movementTypes = result.payload.data;
            if (movementTypes == null || movementTypes.isEmpty) {
              return Error("No movement type available");
            }
            final domainMovementTypes = movementTypes.map((movementType) {
              final category = movementType.movement == null
                  ? null
                  : movementType.movement!.contains("GeneXpert → Spoke")
                  ? MovementTypeCategory.result
                  : MovementTypeCategory.specimen;
              return movementType.toDomain(category);
            }).toList();
            await _localService.cacheMovementTypes(domainMovementTypes);
            return Success(domainMovementTypes);
          case Error<MovementTypesResponse>():
            developer.log(
              "error: ${result.message}",
              name: "MovementTypesRepository:getMovementTypes",
            );
            return Error(result.message);
        }
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "MovementTypesRepository:getMovementTypes",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
