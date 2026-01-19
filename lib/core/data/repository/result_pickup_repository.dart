import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/local/nims_local_service.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/remote/nims_api_service.dart';
import 'package:nims_mobile_app/core/services/sync/sync_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

class ResultPickupRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;
  final SyncService _syncService;

  ResultPickupRepository(
    this._apiService,
    this._localService,
    this._connectivityService,
    this._syncService,
  );

  /// Save result pickup locally and attempt immediate sync if online
  Future<Result<bool>> saveResultPickup({
    required DomainShipmentRoute route,
    required DomainShipment shipment,
    required DomainApproval approval,
    required List<String> sampleCodes,
    required String temperature,
  }) async {
    try {
      // Save locally first
      await _localService.cacheResultPickup(route, shipment, approval);

      developer.log(
        "Result pickup saved locally: route=${route.routeNo}",
        name: "ResultPickupRepository:saveResultPickup",
      );

      // Attempt immediate sync if online
      final isConnected = await _connectivityService.isConnected;
      if (isConnected) {
        developer.log(
          "Online, attempting immediate sync of result pickup",
          name: "ResultPickupRepository:saveResultPickup",
        );

        final synced = await _syncService.syncResultPickupNow(
          route,
          shipment,
          approval,
          sampleCodes,
          temperature,
        );

        developer.log(
          "Immediate sync result: $synced",
          name: "ResultPickupRepository:saveResultPickup",
        );
      }

      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ResultPickupRepository:saveResultPickup",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
