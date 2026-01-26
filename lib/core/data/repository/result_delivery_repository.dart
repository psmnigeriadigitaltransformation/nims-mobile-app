import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/local/nims_local_service.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/remote/nims_api_service.dart';
import 'package:nims_mobile_app/core/services/sync/sync_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

class ResultDeliveryRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;
  final SyncService _syncService;

  ResultDeliveryRepository(
    this._apiService,
    this._localService,
    this._connectivityService,
    this._syncService,
  );

  /// Save result delivery approval locally and attempt immediate sync if online
  Future<Result<bool>> saveResultDelivery({
    required String routeNo,
    required DomainShipment shipment,
    required DomainApproval approval,
    required List<String> sampleCodes,
  }) async {
    try {
      // Save locally first
      await _localService.saveResultDeliveryApproval(routeNo, shipment.shipmentNo, approval);

      developer.log(
        "Result delivery saved locally: route=$routeNo",
        name: "ResultDeliveryRepository:saveResultDelivery",
      );

      // Attempt immediate sync if online
      final isConnected = await _connectivityService.isConnected;
      if (isConnected) {
        developer.log(
          "Online, attempting immediate sync of result delivery",
          name: "ResultDeliveryRepository:saveResultDelivery",
        );

        // Get the route for this delivery
        final route = await _localService.getCachedRouteByRouteNo(routeNo);
        if (route != null) {
          final synced = await _syncService.syncResultDeliveryNow(
            route,
            shipment,
            approval,
            sampleCodes,
          );

          developer.log(
            "Immediate sync result: $synced",
            name: "ResultDeliveryRepository:saveResultDelivery",
          );
        }
      }

      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ResultDeliveryRepository:saveResultDelivery",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
