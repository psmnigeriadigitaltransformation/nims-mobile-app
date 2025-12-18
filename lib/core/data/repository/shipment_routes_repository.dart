import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';
import 'package:projects/core/services/remote/models/sample_types_response.dart';
import 'package:projects/core/utils/result.dart';
import 'package:projects/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class ShipmentRoutesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  ShipmentRoutesRepository(this._apiService, this._localService);

  Future<Result<bool>> saveShipmentRoute(DomainShipmentRoute shipmentRoute, List<DomainShipment> shipments, DomainApproval approval) async {
    try {
      _localService.cacheShipmentRoute(shipmentRoute, shipments, approval);
      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentRoutesRepository:saveShipmentRoute",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
