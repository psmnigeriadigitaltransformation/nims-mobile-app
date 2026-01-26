import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/sync/sync_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class ShipmentsRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;
  final SyncService _syncService;

  ShipmentsRepository(
    this._apiService,
    this._localService,
    this._connectivityService,
    this._syncService,
  );

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

  /// Save delivery approval and update specimen status to delivered
  Future<Result<bool>> saveDeliveryApproval(
    List<DomainShipment> shipments,
    DomainApproval deliveryApproval,
    String routeNo,
  ) async {
    try {
      final shipmentNos = shipments.map((s) => s.shipmentNo).toList();
      await _localService.saveSpecimenDeliveryApproval(shipmentNos, deliveryApproval);

      developer.log(
        "Delivery approval saved for ${shipmentNos.length} shipments",
        name: "ShipmentsRepository:saveDeliveryApproval",
      );

      // Attempt immediate sync if online
      final isConnected = await _connectivityService.isConnected;
      if (isConnected) {
        developer.log(
          "Online, attempting immediate sync of specimen delivery",
          name: "ShipmentsRepository:saveDeliveryApproval",
        );

        // Get the route for this delivery
        final route = await _localService.getCachedRouteByRouteNo(routeNo);
        if (route != null) {
          final synced = await _syncService.syncSpecimenDeliveryNow(
            route,
            shipments,
            deliveryApproval,
          );

          developer.log(
            "Immediate sync result: $synced",
            name: "ShipmentsRepository:saveDeliveryApproval",
          );
        }
      }

      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentsRepository:saveDeliveryApproval",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
