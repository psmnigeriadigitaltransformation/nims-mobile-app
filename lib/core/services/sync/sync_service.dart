import 'dart:async';
import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/local/nims_local_service.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/create_manifest_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/create_shipment_route_request_body.dart'
    as request;
import 'package:nims_mobile_app/core/services/remote/models/request/result_delivery_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/result_pickup_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/specimen_delivery_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/nims_api_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

/// Sync status enum for tracking sync state
enum SyncStatus { idle, syncing, success, error }

/// Service for managing offline-first sync operations.
/// Handles syncing manifests, samples, and shipment routes to the server.
class SyncService {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;

  StreamSubscription<bool>? _connectivitySubscription;
  final _syncStatusController = StreamController<SyncStatus>.broadcast();

  bool _isSyncing = false;

  SyncService(this._apiService, this._localService, this._connectivityService);

  /// Stream of sync status changes
  Stream<SyncStatus> get syncStatusStream => _syncStatusController.stream;

  /// Convert age format from "25 Y" to "25 Years" or "6 M" to "6 Months"
  String _formatAgeForServer(String age) {
    if (age.isEmpty) return age;

    // Split by space: "25 Y" -> ["25", "Y"]
    final parts = age.trim().split(' ');
    if (parts.length != 2) return age;

    final number = parts[0];
    final unit = parts[1].toUpperCase();

    switch (unit) {
      case 'Y':
        return '$number Years';
      case 'M':
        return '$number Months';
      case 'D':
        return '$number Days';
      case 'W':
        return '$number Weeks';
      default:
        return age;
    }
  }

  /// Convert gender format from "M" to "Male" or "F" to "Female"
  String _formatGenderForServer(String gender) {
    if (gender.isEmpty) return gender;

    switch (gender.toUpperCase()) {
      case 'M':
        return 'Male';
      case 'F':
        return 'Female';
      default:
        return gender;
    }
  }

  /// Start listening for connectivity changes and trigger sync when online
  void startAutoSync() {
    _connectivitySubscription = _connectivityService.connectivityStream.listen((isConnected) {
      if (isConnected && !_isSyncing) {
        developer.log(
          "Network available, triggering auto-sync",
          name: "SyncService:startAutoSync",
        );
        syncAll();
      }
    });
  }

  /// Stop auto-sync listener
  void stopAutoSync() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }

  /// Dispose resources
  void dispose() {
    stopAutoSync();
    _syncStatusController.close();
  }

  /// Sync all pending data to server
  /// Order: Manifests first, then Routes (because routes depend on manifests)
  /// Throws an exception if sync fails so the caller can show an error dialog
  Future<void> syncAll() async {
    if (_isSyncing) {
      developer.log(
        "Sync already in progress, skipping",
        name: "SyncService:syncAll",
      );
      return;
    }

    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      developer.log(
        "No network connection, skipping sync",
        name: "SyncService:syncAll",
      );
      throw Exception("No network connection. Please check your internet and try again.");
    }

    _isSyncing = true;
    _syncStatusController.add(SyncStatus.syncing);

    try {
      developer.log("Starting sync all", name: "SyncService:syncAll");

      // Step 1: Sync pending manifests first
      await syncPendingManifests();

      // Step 2: Sync pending routes (after manifests)
      await syncPendingRoutes();

      // Step 3: Sync pending specimen deliveries (after routes)
      await syncPendingSpecimenDeliveries();

      // Step 4: Sync pending result pickups (after routes)
      await syncPendingResultPickups();

      // Step 5: Sync pending result deliveries (after result pickups)
      await syncPendingResultDeliveries();

      // Check if there are still failed records after sync attempt
      final failedCount = await _localService.getFailedSyncCount();
      if (failedCount > 0) {
        _syncStatusController.add(SyncStatus.error);
        throw Exception("$failedCount record(s) failed to sync. Check your connection and try again.");
      }

      _syncStatusController.add(SyncStatus.success);
      developer.log("Sync completed successfully", name: "SyncService:syncAll");
    } catch (e, s) {
      developer.log("Sync failed: $e", name: "SyncService:syncAll", error: e, stackTrace: s);
      _syncStatusController.add(SyncStatus.error);
      rethrow; // Rethrow so the caller can handle the error
    } finally {
      _isSyncing = false;
    }
  }

  /// Sync all pending manifests to server
  Future<void> syncPendingManifests() async {
    developer.log(
      "Syncing pending manifests",
      name: "SyncService:syncPendingManifests",
    );

    final pendingManifests = await _localService.getPendingManifests();

    if (pendingManifests.isEmpty) {
      developer.log(
        "No pending manifests to sync",
        name: "SyncService:syncPendingManifests",
      );
      return;
    }

    developer.log(
      "Found ${pendingManifests.length} pending manifests",
      name: "SyncService:syncPendingManifests",
    );

    // Group manifests with their samples for batch upload
    final manifestRequests = <ManifestRequestItem>[];

    for (final manifest in pendingManifests) {
      final samples = await _localService.getCachedSamplesByManifestNo(manifest.manifestNo);

      manifestRequests.add(ManifestRequestItem(
        manifestNo: manifest.manifestNo,
        originId: manifest.originId,
        destinationId: manifest.destinationId,
        sampleType: manifest.sampleType,
        sampleCount: manifest.sampleCount,
        phlebotomyNo: manifest.phlebotomyNo,
        lspCode: manifest.lspCode,
        temperature: manifest.temperature ?? "",
        userId: manifest.userId,
        samples: samples.map((s) => ManifestSampleRequest(
          sampleCode: s.sampleCode,
          patientCode: s.patientCode,
          age: _formatAgeForServer(s.age),
          gender: _formatGenderForServer(s.gender),
        )).toList(),
      ));
    }

    // Call API to create manifests
    final result = await _apiService.createManifests(manifests: manifestRequests);

    if (result is Success) {
      developer.log(
        "Manifests synced successfully",
        name: "SyncService:syncPendingManifests",
      );

      // Mark all manifests and their samples as synced
      for (final manifest in pendingManifests) {
        await _localService.updateSyncStatus('manifests', 'manifest_no', manifest.manifestNo, 'synced');

        final samples = await _localService.getCachedSamplesByManifestNo(manifest.manifestNo);
        for (final sample in samples) {
          await _localService.updateSyncStatus('samples', 'sample_code', sample.sampleCode, 'synced');
        }
      }
    } else {
      developer.log(
        "Failed to sync manifests: ${(result as Error).message}",
        name: "SyncService:syncPendingManifests",
      );

      // Mark as failed for retry
      for (final manifest in pendingManifests) {
        await _localService.updateSyncStatus('manifests', 'manifest_no', manifest.manifestNo, 'failed');
      }
    }
  }

  /// Sync all pending routes to server
  Future<void> syncPendingRoutes() async {
    developer.log(
      "Syncing pending routes",
      name: "SyncService:syncPendingRoutes",
    );

    final pendingRoutes = await _localService.getPendingRoutes();

    if (pendingRoutes.isEmpty) {
      developer.log(
        "No pending routes to sync",
        name: "SyncService:syncPendingRoutes",
      );
      return;
    }

    developer.log(
      "Found ${pendingRoutes.length} pending routes",
      name: "SyncService:syncPendingRoutes",
    );

    for (final route in pendingRoutes) {
      // First, ensure all related manifests are synced
      final shipments = await _localService.getCachedShipmentsByRouteNo(route.routeNo);
      bool allManifestsSynced = true;

      for (final shipment in shipments) {
        final manifest = await _localService.getManifestByNo(shipment.manifestNo);
        if (manifest != null && manifest.syncStatus != 'synced') {
          developer.log(
            "Manifest ${shipment.manifestNo} not synced yet, attempting sync",
            name: "SyncService:syncPendingRoutes",
          );

          // Try to sync the manifest first
          await _syncSingleManifest(manifest);

          // Check again
          final updatedManifest = await _localService.getManifestByNo(shipment.manifestNo);
          if (updatedManifest?.syncStatus != 'synced') {
            allManifestsSynced = false;
            break;
          }
        }
      }

      if (!allManifestsSynced) {
        developer.log(
          "Cannot sync route ${route.routeNo} - some manifests not synced",
          name: "SyncService:syncPendingRoutes",
        );
        continue;
      }

      // Get approval for this route
      final approvals = await _localService.getCachedApprovalsByRouteNo(route.routeNo);
      final approval = approvals.isNotEmpty ? approvals.first : null;

      if (approval == null) {
        developer.log(
          "No approval found for route ${route.routeNo}, skipping",
          name: "SyncService:syncPendingRoutes",
        );
        continue;
      }

      // Build the request
      final routeRequest = request.CreateShipmentRouteRequest(
        routeNo: route.routeNo,
        originFacilityId: route.originFacilityId,
        destinationFacilityId: route.destinationFacilityId,
        lspCode: route.lspCode,
        riderUserId: route.riderUserId,
        latitude: route.latitude?.toString() ?? "0.0",
        longitude: route.longitude?.toString() ?? "0.0",
        shipment: shipments.map((s) => request.Shipment(
          shipmentNo: s.shipmentNo,
          manifestNo: s.manifestNo,
          originType: s.originType,
          destinationType: s.destinationLocationType,
          pickupLatitude: s.pickupLatitude.toString(),
          pickupLongitude: s.pickupLongitude.toString(),
          sampleType: s.sampleType,
          sampleCount: s.sampleCount,
          pickupDate: s.pickupDate ?? DateTime.now().toIso8601String(),
        )).toList(),
        approval: request.Approval(
          approvalNo: approval.approvalNo,
          approvalType: approval.approvalType,
          fullname: approval.fullname,
          phone: approval.phone,
          designation: approval.designation,
          signature: approval.signature,
          approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
        ),
      );

      // Call API
      final result = await _apiService.createShipmentRoute(shipmentRoute: routeRequest);

      if (result is Success) {
        developer.log(
          "Route ${route.routeNo} synced successfully",
          name: "SyncService:syncPendingRoutes",
        );

        // Mark route, shipments, and approval as synced
        await _localService.updateSyncStatus('routes', 'route_no', route.routeNo, 'synced');
        for (final shipment in shipments) {
          await _localService.updateSyncStatus('shipments', 'shipment_no', shipment.shipmentNo, 'synced');
          // Transition shipment status from 'pending' to 'in-transit'
          await _localService.updateShipmentStatus(shipment.shipmentNo, 'in-transit');
        }
        await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
      } else {
        developer.log(
          "Failed to sync route ${route.routeNo}: ${(result as Error).message}",
          name: "SyncService:syncPendingRoutes",
        );
        await _localService.updateSyncStatus('routes', 'route_no', route.routeNo, 'failed');
      }
    }
  }

  /// Sync a single manifest to the server
  Future<bool> _syncSingleManifest(DomainManifest manifest) async {
    final samples = await _localService.getCachedSamplesByManifestNo(manifest.manifestNo);

    final manifestRequest = ManifestRequestItem(
      manifestNo: manifest.manifestNo,
      originId: manifest.originId,
      destinationId: manifest.destinationId,
      sampleType: manifest.sampleType,
      sampleCount: manifest.sampleCount,
      phlebotomyNo: manifest.phlebotomyNo,
      lspCode: manifest.lspCode,
      temperature: manifest.temperature ?? "",
      userId: manifest.userId,
      samples: samples.map((s) => ManifestSampleRequest(
        sampleCode: s.sampleCode,
        patientCode: s.patientCode,
        age: _formatAgeForServer(s.age),
        gender: _formatGenderForServer(s.gender),
      )).toList(),
    );

    final result = await _apiService.createManifests(manifests: [manifestRequest]);

    if (result is Success) {
      await _localService.updateSyncStatus('manifests', 'manifest_no', manifest.manifestNo, 'synced');
      for (final sample in samples) {
        await _localService.updateSyncStatus('samples', 'sample_code', sample.sampleCode, 'synced');
      }
      return true;
    }

    return false;
  }

  /// Sync a single manifest immediately (called after creation)
  Future<bool> syncManifestNow(DomainManifest manifest, List<DomainSample> samples) async {
    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      return false;
    }

    return await _syncSingleManifest(manifest);
  }

  /// Sync a route immediately (called after creation)
  Future<bool> syncRouteNow(
    DomainShipmentRoute route,
    List<DomainShipment> shipments,
    DomainApproval approval,
  ) async {
    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      return false;
    }

    // Ensure all manifests are synced first
    for (final shipment in shipments) {
      final manifest = await _localService.getManifestByNo(shipment.manifestNo);
      if (manifest != null && manifest.syncStatus != 'synced') {
        final synced = await _syncSingleManifest(manifest);
        if (!synced) {
          developer.log(
            "Cannot sync route - manifest ${shipment.manifestNo} failed to sync",
            name: "SyncService:syncRouteNow",
          );
          return false;
        }
      }
    }

    // Build the request
    final routeRequest = request.CreateShipmentRouteRequest(
      routeNo: route.routeNo,
      originFacilityId: route.originFacilityId,
      destinationFacilityId: route.destinationFacilityId,
      lspCode: route.lspCode,
      riderUserId: route.riderUserId,
      latitude: route.latitude?.toString() ?? "0.0",
      longitude: route.longitude?.toString() ?? "0.0",
      shipment: shipments.map((s) => request.Shipment(
        shipmentNo: s.shipmentNo,
        manifestNo: s.manifestNo,
        originType: s.originType,
        destinationType: s.destinationLocationType,
        pickupLatitude: s.pickupLatitude.toString(),
        pickupLongitude: s.pickupLongitude.toString(),
        sampleType: s.sampleType,
        sampleCount: s.sampleCount,
        pickupDate: s.pickupDate ?? DateTime.now().toIso8601String(),
      )).toList(),
      approval: request.Approval(
        approvalNo: approval.approvalNo,
        approvalType: approval.approvalType,
        fullname: approval.fullname,
        phone: approval.phone,
        designation: approval.designation,
        signature: approval.signature,
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    final result = await _apiService.createShipmentRoute(shipmentRoute: routeRequest);

    if (result is Success) {
      // Mark as synced
      await _localService.updateSyncStatus('routes', 'route_no', route.routeNo, 'synced');
      for (final shipment in shipments) {
        await _localService.updateSyncStatus('shipments', 'shipment_no', shipment.shipmentNo, 'synced');
        // Transition shipment status from 'pending' to 'in-transit'
        await _localService.updateShipmentStatus(shipment.shipmentNo, 'in-transit');
      }
      await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
      return true;
    }

    return false;
  }

  /// Sync all pending specimen deliveries to server
  Future<void> syncPendingSpecimenDeliveries() async {
    developer.log(
      "Syncing pending specimen deliveries",
      name: "SyncService:syncPendingSpecimenDeliveries",
    );

    final pendingDeliveries = await _localService.getPendingSpecimenDeliveries();

    if (pendingDeliveries.isEmpty) {
      developer.log(
        "No pending specimen deliveries to sync",
        name: "SyncService:syncPendingSpecimenDeliveries",
      );
      return;
    }

    developer.log(
      "Found ${pendingDeliveries.length} pending specimen deliveries",
      name: "SyncService:syncPendingSpecimenDeliveries",
    );

    // Group deliveries by route_no and process each
    final deliveryRequests = <SpecimenDeliveryRequest>[];
    final successfulApprovals = <DomainApproval>[];

    for (final approval in pendingDeliveries) {
      // Get the route for this approval
      var route = await _localService.getCachedRouteByRouteNo(approval.routeNo);
      if (route == null) {
        developer.log(
          "Route not found for approval ${approval.approvalNo}, skipping",
          name: "SyncService:syncPendingSpecimenDeliveries",
        );
        continue;
      }

      // Get shipments for this route
      final shipments = await _localService.getCachedShipmentsByRouteNo(approval.routeNo);

      // Step 1: Ensure all manifests are synced first
      bool allManifestsSynced = true;
      for (final shipment in shipments) {
        final manifest = await _localService.getManifestByNo(shipment.manifestNo);
        if (manifest != null && manifest.syncStatus != 'synced') {
          developer.log(
            "Manifest ${shipment.manifestNo} not synced, attempting sync first",
            name: "SyncService:syncPendingSpecimenDeliveries",
          );
          final synced = await _syncSingleManifest(manifest);
          if (!synced) {
            allManifestsSynced = false;
            developer.log(
              "Failed to sync manifest ${shipment.manifestNo}, skipping delivery",
              name: "SyncService:syncPendingSpecimenDeliveries",
            );
            break;
          }
        }
      }

      if (!allManifestsSynced) {
        continue;
      }

      // Step 2: Ensure the route is synced
      if (route.syncStatus != 'synced') {
        developer.log(
          "Route ${route.routeNo} not synced, attempting sync first",
          name: "SyncService:syncPendingSpecimenDeliveries",
        );

        // Get the pickup approval for this route
        final pickupApprovals = await _localService.getCachedPickupApprovalsByRouteNo(approval.routeNo);
        final pickupApproval = pickupApprovals.isNotEmpty ? pickupApprovals.first : null;

        if (pickupApproval == null) {
          developer.log(
            "No pickup approval found for route ${route.routeNo}, skipping delivery",
            name: "SyncService:syncPendingSpecimenDeliveries",
          );
          continue;
        }

        // Sync the route
        final routeSynced = await _syncSingleRoute(route, shipments, pickupApproval);
        if (!routeSynced) {
          developer.log(
            "Failed to sync route ${route.routeNo}, skipping delivery",
            name: "SyncService:syncPendingSpecimenDeliveries",
          );
          continue;
        }

        // Refresh route to get updated sync status
        route = await _localService.getCachedRouteByRouteNo(approval.routeNo);
        if (route == null || route.syncStatus != 'synced') {
          continue;
        }
      }

      // Step 3: Now we can add the delivery request
      // Get delivered shipments for this route
      final deliveredShipments = await _localService.getDeliveredShipmentsByRouteNo(approval.routeNo);

      for (final shipment in deliveredShipments) {
        deliveryRequests.add(SpecimenDeliveryRequest(
          routeNo: route.routeNo,
          shipmentNo: shipment.shipmentNo,
          manifestNo: shipment.manifestNo,
          latitude: route.latitude?.toString() ?? "0.0",
          longitude: route.longitude?.toString() ?? "0.0",
          deliveryDate: shipment.deliveryDate ?? DateTime.now().toIso8601String(),
          destinationType: shipment.destinationLocationType,
          approval: SpecimenDeliveryApproval(
            approvalNo: approval.approvalNo,
            approvalType: approval.approvalType,
            fullname: approval.fullname,
            phone: approval.phone,
            designation: approval.designation,
            signature: approval.signature,
            approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
          ),
        ));
      }
      successfulApprovals.add(approval);
    }

    if (deliveryRequests.isEmpty) {
      developer.log(
        "No valid delivery requests to sync",
        name: "SyncService:syncPendingSpecimenDeliveries",
      );
      return;
    }

    // Call API
    final result = await _apiService.deliverSpecimenShipments(deliveries: deliveryRequests);

    if (result is Success) {
      developer.log(
        "Specimen deliveries synced successfully",
        name: "SyncService:syncPendingSpecimenDeliveries",
      );

      // Mark all successful delivery approvals as synced
      for (final approval in successfulApprovals) {
        await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
      }
    } else {
      developer.log(
        "Failed to sync specimen deliveries: ${(result as Error).message}",
        name: "SyncService:syncPendingSpecimenDeliveries",
      );

      // Mark as failed for retry
      for (final approval in successfulApprovals) {
        await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'failed');
      }
    }
  }

  /// Sync a single route to the server
  Future<bool> _syncSingleRoute(
    DomainShipmentRoute route,
    List<DomainShipment> shipments,
    DomainApproval approval,
  ) async {
    final routeRequest = request.CreateShipmentRouteRequest(
      routeNo: route.routeNo,
      originFacilityId: route.originFacilityId,
      destinationFacilityId: route.destinationFacilityId,
      lspCode: route.lspCode,
      riderUserId: route.riderUserId,
      latitude: route.latitude?.toString() ?? "0.0",
      longitude: route.longitude?.toString() ?? "0.0",
      shipment: shipments.map((s) => request.Shipment(
        shipmentNo: s.shipmentNo,
        manifestNo: s.manifestNo,
        originType: s.originType,
        destinationType: s.destinationLocationType,
        pickupLatitude: s.pickupLatitude.toString(),
        pickupLongitude: s.pickupLongitude.toString(),
        sampleType: s.sampleType,
        sampleCount: s.sampleCount,
        pickupDate: s.pickupDate ?? DateTime.now().toIso8601String(),
      )).toList(),
      approval: request.Approval(
        approvalNo: approval.approvalNo,
        approvalType: approval.approvalType,
        fullname: approval.fullname,
        phone: approval.phone,
        designation: approval.designation,
        signature: approval.signature,
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    final result = await _apiService.createShipmentRoute(shipmentRoute: routeRequest);

    if (result is Success) {
      await _localService.updateSyncStatus('routes', 'route_no', route.routeNo, 'synced');
      for (final shipment in shipments) {
        await _localService.updateSyncStatus('shipments', 'shipment_no', shipment.shipmentNo, 'synced');
        // Transition shipment status from 'pending' to 'in-transit'
        await _localService.updateShipmentStatus(shipment.shipmentNo, 'in-transit');
      }
      await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
      return true;
    }

    return false;
  }

  /// Sync a specimen delivery immediately (called after approval)
  Future<bool> syncSpecimenDeliveryNow(
    DomainShipmentRoute route,
    List<DomainShipment> shipments,
    DomainApproval deliveryApproval,
  ) async {
    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      return false;
    }

    var currentRoute = route;

    // Step 1: Ensure all manifests are synced first
    for (final shipment in shipments) {
      final manifest = await _localService.getManifestByNo(shipment.manifestNo);
      if (manifest != null && manifest.syncStatus != 'synced') {
        developer.log(
          "Manifest ${shipment.manifestNo} not synced, attempting sync first",
          name: "SyncService:syncSpecimenDeliveryNow",
        );
        final synced = await _syncSingleManifest(manifest);
        if (!synced) {
          developer.log(
            "Failed to sync manifest ${shipment.manifestNo}, delivery sync deferred",
            name: "SyncService:syncSpecimenDeliveryNow",
          );
          return false;
        }
      }
    }

    // Step 2: Ensure the route is synced
    if (currentRoute.syncStatus != 'synced') {
      developer.log(
        "Route ${currentRoute.routeNo} not synced, attempting sync first",
        name: "SyncService:syncSpecimenDeliveryNow",
      );

      // Get the pickup approval for this route
      final pickupApprovals = await _localService.getCachedPickupApprovalsByRouteNo(currentRoute.routeNo);
      final pickupApproval = pickupApprovals.isNotEmpty ? pickupApprovals.first : null;

      if (pickupApproval == null) {
        developer.log(
          "No pickup approval found for route ${currentRoute.routeNo}, delivery sync deferred",
          name: "SyncService:syncSpecimenDeliveryNow",
        );
        return false;
      }

      final routeSynced = await _syncSingleRoute(currentRoute, shipments, pickupApproval);
      if (!routeSynced) {
        developer.log(
          "Failed to sync route ${currentRoute.routeNo}, delivery sync deferred",
          name: "SyncService:syncSpecimenDeliveryNow",
        );
        return false;
      }

      // Refresh route
      final refreshedRoute = await _localService.getCachedRouteByRouteNo(currentRoute.routeNo);
      if (refreshedRoute == null || refreshedRoute.syncStatus != 'synced') {
        return false;
      }
      currentRoute = refreshedRoute;
    }

    // Step 3: Now sync the delivery
    final deliveryRequests = shipments.map((shipment) => SpecimenDeliveryRequest(
      routeNo: currentRoute.routeNo,
      shipmentNo: shipment.shipmentNo,
      manifestNo: shipment.manifestNo,
      latitude: currentRoute.latitude?.toString() ?? "0.0",
      longitude: currentRoute.longitude?.toString() ?? "0.0",
      deliveryDate: shipment.deliveryDate ?? DateTime.now().toIso8601String(),
      destinationType: shipment.destinationLocationType,
      approval: SpecimenDeliveryApproval(
        approvalNo: deliveryApproval.approvalNo,
        approvalType: deliveryApproval.approvalType,
        fullname: deliveryApproval.fullname,
        phone: deliveryApproval.phone,
        designation: deliveryApproval.designation,
        signature: deliveryApproval.signature,
        approvalDate: deliveryApproval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    )).toList();

    final result = await _apiService.deliverSpecimenShipments(deliveries: deliveryRequests);

    if (result is Success) {
      await _localService.updateSyncStatus('approvals', 'approval_no', deliveryApproval.approvalNo, 'synced');
      return true;
    }

    return false;
  }

  /// Sync all pending result pickups to server
  Future<void> syncPendingResultPickups() async {
    developer.log(
      "Syncing pending result pickups",
      name: "SyncService:syncPendingResultPickups",
    );

    final pendingPickups = await _localService.getPendingResultPickups();

    if (pendingPickups.isEmpty) {
      developer.log(
        "No pending result pickups to sync",
        name: "SyncService:syncPendingResultPickups",
      );
      return;
    }

    developer.log(
      "Found ${pendingPickups.length} pending result pickups",
      name: "SyncService:syncPendingResultPickups",
    );

    for (final approval in pendingPickups) {
      // Get the route for this approval
      final route = await _localService.getCachedRouteByRouteNo(approval.routeNo);
      if (route == null) {
        developer.log(
          "Route not found for approval ${approval.approvalNo}, skipping",
          name: "SyncService:syncPendingResultPickups",
        );
        continue;
      }

      // Get shipment for this route
      final shipments = await _localService.getCachedShipmentsByRouteNo(approval.routeNo);
      if (shipments.isEmpty) {
        developer.log(
          "No shipments found for route ${route.routeNo}, skipping",
          name: "SyncService:syncPendingResultPickups",
        );
        continue;
      }

      final shipment = shipments.first;

      // Build the request
      final pickupRequest = ResultPickupRequest(
        routeNo: route.routeNo,
        originFacilityId: route.originFacilityId,
        destinationFacilityId: route.destinationFacilityId,
        lspCode: route.lspCode,
        riderUserId: route.riderUserId,
        temperature: "0", // Temperature would need to be stored somewhere
        latitude: route.latitude?.toString() ?? "0.0",
        longitude: route.longitude?.toString() ?? "0.0",
        shipment: ResultPickupShipment(
          shipmentNo: shipment.shipmentNo,
          originType: shipment.originType,
          destinationType: shipment.destinationLocationType,
          sampleType: shipment.sampleType,
          sampleCount: shipment.sampleCount,
          pickupDate: shipment.pickupDate ?? DateTime.now().toIso8601String(),
        ),
        samples: [], // Sample codes would need to be stored
        approval: ResultPickupApproval(
          approvalNo: approval.approvalNo,
          approvalType: approval.approvalType,
          fullname: approval.fullname,
          phone: approval.phone,
          designation: approval.designation,
          signature: approval.signature,
          approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
        ),
      );

      // Call API
      final result = await _apiService.pickupResults(pickups: [pickupRequest]);

      if (result is Success) {
        developer.log(
          "Result pickup ${approval.approvalNo} synced successfully",
          name: "SyncService:syncPendingResultPickups",
        );

        // Mark as synced
        await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
        await _localService.updateSyncStatus('routes', 'route_no', route.routeNo, 'synced');
        await _localService.updateSyncStatus('shipments', 'shipment_no', shipment.shipmentNo, 'synced');
        // Transition shipment status from 'pending' to 'in-transit'
        await _localService.updateShipmentStatus(shipment.shipmentNo, 'in-transit');
      } else {
        developer.log(
          "Failed to sync result pickup ${approval.approvalNo}: ${(result as Error).message}",
          name: "SyncService:syncPendingResultPickups",
        );
        await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'failed');
      }
    }
  }

  /// Sync a result pickup immediately (called after creation)
  Future<bool> syncResultPickupNow(
    DomainShipmentRoute route,
    DomainShipment shipment,
    DomainApproval approval,
    List<String> sampleCodes,
    String temperature,
  ) async {
    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      return false;
    }

    final pickupRequest = ResultPickupRequest(
      routeNo: route.routeNo,
      originFacilityId: route.originFacilityId,
      destinationFacilityId: route.destinationFacilityId,
      lspCode: route.lspCode,
      riderUserId: route.riderUserId,
      temperature: temperature,
      latitude: route.latitude?.toString() ?? "0.0",
      longitude: route.longitude?.toString() ?? "0.0",
      shipment: ResultPickupShipment(
        shipmentNo: shipment.shipmentNo,
        originType: shipment.originType,
        destinationType: shipment.destinationLocationType,
        sampleType: shipment.sampleType,
        sampleCount: shipment.sampleCount,
        pickupDate: shipment.pickupDate ?? DateTime.now().toIso8601String(),
      ),
      samples: sampleCodes,
      approval: ResultPickupApproval(
        approvalNo: approval.approvalNo,
        approvalType: approval.approvalType,
        fullname: approval.fullname,
        phone: approval.phone,
        designation: approval.designation,
        signature: approval.signature,
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    final result = await _apiService.pickupResults(pickups: [pickupRequest]);

    if (result is Success) {
      await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
      await _localService.updateSyncStatus('routes', 'route_no', route.routeNo, 'synced');
      await _localService.updateSyncStatus('shipments', 'shipment_no', shipment.shipmentNo, 'synced');
      // Transition shipment status from 'pending' to 'in-transit'
      await _localService.updateShipmentStatus(shipment.shipmentNo, 'in-transit');
      return true;
    }

    return false;
  }

  /// Sync all pending result deliveries to server
  Future<void> syncPendingResultDeliveries() async {
    developer.log(
      "Syncing pending result deliveries",
      name: "SyncService:syncPendingResultDeliveries",
    );

    final pendingDeliveries = await _localService.getPendingResultDeliveries();

    if (pendingDeliveries.isEmpty) {
      developer.log(
        "No pending result deliveries to sync",
        name: "SyncService:syncPendingResultDeliveries",
      );
      return;
    }

    developer.log(
      "Found ${pendingDeliveries.length} pending result deliveries",
      name: "SyncService:syncPendingResultDeliveries",
    );

    for (final approval in pendingDeliveries) {
      // Get the route for this approval
      final route = await _localService.getCachedRouteByRouteNo(approval.routeNo);
      if (route == null) {
        developer.log(
          "Route not found for approval ${approval.approvalNo}, skipping",
          name: "SyncService:syncPendingResultDeliveries",
        );
        continue;
      }

      // Get delivered shipments for this route
      final shipments = await _localService.getDeliveredShipmentsByRouteNo(approval.routeNo);
      if (shipments.isEmpty) {
        developer.log(
          "No delivered shipments found for route ${route.routeNo}, skipping",
          name: "SyncService:syncPendingResultDeliveries",
        );
        continue;
      }

      final shipment = shipments.first;

      // Build the request
      final deliveryRequest = ResultDeliveryRequest(
        routeNo: route.routeNo,
        latitude: route.latitude?.toString() ?? "0.0",
        longitude: route.longitude?.toString() ?? "0.0",
        shipment: ResultDeliveryShipment(
          shipmentNo: shipment.shipmentNo,
          originType: shipment.originType,
          destinationType: shipment.destinationLocationType,
          sampleType: shipment.sampleType,
          sampleCount: shipment.sampleCount,
          deliveryDate: shipment.deliveryDate ?? DateTime.now().toIso8601String(),
        ),
        samples: [], // Sample codes would need to be stored
        approval: ResultDeliveryApproval(
          approvalNo: approval.approvalNo,
          approvalType: approval.approvalType,
          fullname: approval.fullname,
          phone: approval.phone,
          designation: approval.designation,
          signature: approval.signature,
          approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
        ),
      );

      // Call API
      final result = await _apiService.deliverResults(deliveries: [deliveryRequest]);

      if (result is Success) {
        developer.log(
          "Result delivery ${approval.approvalNo} synced successfully",
          name: "SyncService:syncPendingResultDeliveries",
        );
        await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
      } else {
        developer.log(
          "Failed to sync result delivery ${approval.approvalNo}: ${(result as Error).message}",
          name: "SyncService:syncPendingResultDeliveries",
        );
        await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'failed');
      }
    }
  }

  /// Sync a result delivery immediately (called after approval)
  Future<bool> syncResultDeliveryNow(
    DomainShipmentRoute route,
    DomainShipment shipment,
    DomainApproval approval,
    List<String> sampleCodes,
  ) async {
    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      return false;
    }

    final deliveryRequest = ResultDeliveryRequest(
      routeNo: route.routeNo,
      latitude: route.latitude?.toString() ?? "0.0",
      longitude: route.longitude?.toString() ?? "0.0",
      shipment: ResultDeliveryShipment(
        shipmentNo: shipment.shipmentNo,
        originType: shipment.originType,
        destinationType: shipment.destinationLocationType,
        sampleType: shipment.sampleType,
        sampleCount: shipment.sampleCount,
        deliveryDate: shipment.deliveryDate ?? DateTime.now().toIso8601String(),
      ),
      samples: sampleCodes,
      approval: ResultDeliveryApproval(
        approvalNo: approval.approvalNo,
        approvalType: approval.approvalType,
        fullname: approval.fullname,
        phone: approval.phone,
        designation: approval.designation,
        signature: approval.signature,
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    final result = await _apiService.deliverResults(deliveries: [deliveryRequest]);

    if (result is Success) {
      await _localService.updateSyncStatus('approvals', 'approval_no', approval.approvalNo, 'synced');
      return true;
    }

    return false;
  }
}
