import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/sync/sync_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class ShipmentRoutesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;
  final SyncService _syncService;

  ShipmentRoutesRepository(
    this._apiService,
    this._localService,
    this._connectivityService,
    this._syncService,
  );

  /// Save a shipment route locally and attempt immediate sync if online
  /// Note: All related manifests must be synced first before the route can be synced
  Future<Result<bool>> saveShipmentRoute(
    DomainShipmentRoute shipmentRoute,
    List<DomainShipment> shipments,
    DomainApproval approval,
  ) async {
    try {
      // 1. Save locally with pending sync status (default)
      await _localService.cacheShipmentRoute(shipmentRoute, shipments, approval);

      // 2. If online, try to sync immediately
      final isConnected = await _connectivityService.isConnected;
      if (isConnected) {
        final synced = await _syncService.syncRouteNow(
          shipmentRoute,
          shipments,
          approval,
        );
        if (synced) {
          developer.log(
            "Route ${shipmentRoute.routeNo} synced immediately",
            name: "ShipmentRoutesRepository:saveShipmentRoute",
          );
        } else {
          developer.log(
            "Route ${shipmentRoute.routeNo} saved locally, sync failed (manifests may not be synced yet)",
            name: "ShipmentRoutesRepository:saveShipmentRoute",
          );
        }
      } else {
        developer.log(
          "Route ${shipmentRoute.routeNo} saved locally (offline)",
          name: "ShipmentRoutesRepository:saveShipmentRoute",
        );
      }

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

  Future<Result<List<DomainShipmentRoute>>> searchShipmentRoutes(String query) async {
    try {
      final routes = await _localService.getCachedShipmentRoutesBySearchQuery(query);
      return Success(routes);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentRoutesRepository:searchShipmentRoutes",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get all shipment routes
  Future<Result<List<DomainShipmentRoute>>> getAllRoutes() async {
    try {
      final routes = await _localService.getAllCachedRoutes();
      return Success(routes);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentRoutesRepository:getAllRoutes",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get a route by its route number
  Future<Result<DomainShipmentRoute?>> getRouteByNo(String routeNo) async {
    try {
      final route = await _localService.getCachedRouteByRouteNo(routeNo);
      return Success(route);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentRoutesRepository:getRouteByNo",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get shipments by route number
  Future<Result<List<DomainShipment>>> getShipmentsByRouteNo(String routeNo) async {
    try {
      final shipments = await _localService.getCachedShipmentsByRouteNo(routeNo);
      return Success(shipments);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentRoutesRepository:getShipmentsByRouteNo",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get approvals by route number
  Future<Result<List<DomainApproval>>> getApprovalsByRouteNo(String routeNo) async {
    try {
      final approvals = await _localService.getCachedApprovalsByRouteNo(routeNo);
      return Success(approvals);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ShipmentRoutesRepository:getApprovalsByRouteNo",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
