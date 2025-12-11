import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';
import 'package:projects/core/services/remote/models/movement_types_response.dart';
import 'package:projects/core/utils/result.dart';
import 'package:projects/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class MovementTypesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  MovementTypesRepository(this._apiService, this._localService);

  Future<Result<MovementTypesResponse>> getMovementTypes() async {
    try {
      final user = await _localService.getCachedUser();
      if (user != null) {
        developer.log(
          "user: $user",
          name: "MovementTypesRepository:getMovementTypes",
        );
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
            if (movementTypes != null) {
              await _localService.updateCachedMovementTypes(
                movementTypes
                    .map((movementType) => movementType.toDomain())
                    .toList(),
              );
            }
            break;
          case Error<MovementTypesResponse>():
            break;
        }
        return result;
      } else {
        return Error<MovementTypesResponse>("Fetch failed! please try again");
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "MovementTypesRepository:getMovementTypes",
      );
      return Error<MovementTypesResponse>(
        e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
