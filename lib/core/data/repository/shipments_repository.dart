import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/sample_types_response.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class ShipmentsRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  ShipmentsRepository(this._apiService, this._localService);

  Future<Result<List<DomainShipment>>> searchShipments(String query) async {
    try {
      final shipments = await _localService.getCachedShipmentsBySearchQuery(query);
      return Success(shipments);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentsRepository:searchShipments",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
