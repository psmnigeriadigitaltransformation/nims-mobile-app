import 'dart:async';
import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/local/database/tables.dart';
import 'package:nims_mobile_app/core/services/local/nims_local_service.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/create_manifest_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/create_specimen_shipment_route_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/reject_sample_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/result_delivery_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/create_result_shipment_route_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/specimen_delivery_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/nims_api_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

/// Sync status enum for tracking sync state
/// Note: Using SyncServiceStatus to avoid conflict with local SyncStatus constants
enum SyncServiceStatus { idle, syncing, success, error }

/// Service for managing offline-first sync operations.
/// Handles syncing manifest, samples, and specimen routes to the server.
class SyncService {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;

  StreamSubscription<bool>? _connectivitySubscription;
  final _syncStatusController = StreamController<SyncServiceStatus>.broadcast();

  bool _isSyncing = false;

  SyncService(this._apiService, this._localService, this._connectivityService);

  /// Stream of sync status changes
  Stream<SyncServiceStatus> get syncStatusStream =>
      _syncStatusController.stream;

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

  /// Convert approval_type for server API
  /// Database values: specimen_pickup, specimen_delivery, result_pickup, result_delivery
  /// Server values: pickup, delivery
  String _formatApprovalTypeForServer(String approvalType) {
    final lower = approvalType.toLowerCase();
    if (lower.contains('pickup')) {
      return 'pickup';
    } else if (lower.contains('delivery')) {
      return 'delivery';
    }
    return approvalType;
  }

  /// Replace empty or null values with "N/A" for API requests
  String _valueOrNA(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'N/A';
    }
    return value;
  }

  /// Start listening for connectivity changes and trigger sync when online
  void startAutoSync() {
    _connectivitySubscription = _connectivityService.connectivityStream.listen((
      isConnected,
    ) {
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
  /// Order: Manifests first, then Routes (because routes depend on manifest)
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
      throw Exception(
        "No network connection. Please check your internet and try again.",
      );
    }

    _isSyncing = true;
    _syncStatusController.add(SyncServiceStatus.syncing);

    try {
      developer.log("Starting sync all", name: "SyncService:syncAll");

      // Step 1: Sync pending manifest first
      await syncPendingManifests();

      // Step 2: Sync pending specimen shipment routes (after manifest)
      await syncPendingSpecimenShipmentRoutes();

      // Step 3: Sync pending rejections (can be done anytime)
      await syncPendingRejections();

      // Step 4: Sync pending specimen deliveries (after routes)
      await syncPendingSpecimenShipmentDeliveries();

      // Step 5: Sync pending result shipment routes
      await syncPendingResultShipmentRoutes();

      // Step 6: Sync pending result shipment deliveries (after result shipment routes)
      await syncPendingResultShipmentDeliveries();

      // Check if there are still failed records after sync attempt
      final failedCount = await _localService.getFailedSyncCount();
      if (failedCount > 0) {
        _syncStatusController.add(SyncServiceStatus.error);
        throw Exception(
          "$failedCount record(s) failed to sync. Check your connection and try again.",
        );
      }

      _syncStatusController.add(SyncServiceStatus.success);
      developer.log("Sync completed successfully", name: "SyncService:syncAll");
    } catch (e, s) {
      developer.log(
        "Sync failed: $e",
        name: "SyncService:syncAll",
        error: e,
        stackTrace: s,
      );
      _syncStatusController.add(SyncServiceStatus.error);
      rethrow; // Rethrow so the caller can handle the error
    } finally {
      _isSyncing = false;
    }
  }

  /// Sync all pending manifest to server
  Future<void> syncPendingManifests() async {
    developer.log(
      "Syncing pending manifest",
      name: "SyncService:syncPendingManifests",
    );

    final pendingManifests = await _localService.getPendingManifests();

    if (pendingManifests.isEmpty) {
      developer.log(
        "No pending manifest to sync",
        name: "SyncService:syncPendingManifests",
      );
      return;
    }

    developer.log(
      "Found ${pendingManifests.length} pending manifest",
      name: "SyncService:syncPendingManifests",
    );

    // Group manifest with their samples for batch upload
    final manifestRequests = <ManifestRequestItem>[];

    for (final manifest in pendingManifests) {
      final samples = await _localService.getCachedSamplesByManifestNo(
        manifest.manifestNo,
      );

      manifestRequests.add(
        ManifestRequestItem(
          manifestNo: manifest.manifestNo,
          originId: manifest.originId,
          destinationId: manifest.destinationId,
          sampleType: manifest.sampleType,
          sampleCount: manifest.sampleCount,
          phlebotomyNo: manifest.phlebotomyNo,
          lspCode: manifest.lspCode,
          temperature: manifest.temperature ?? "",
          userId: manifest.userId,
          samples: samples
              .map(
                (s) => ManifestSampleRequest(
                  sampleCode: s.sampleCode,
                  patientCode: s.patientCode,
                  age: _formatAgeForServer(s.age),
                  gender: _formatGenderForServer(s.gender),
                ),
              )
              .toList(),
        ),
      );
    }

    // Call API to create manifest
    final result = await _apiService.createManifests(
      manifests: manifestRequests,
    );

    if (result is Success) {
      developer.log(
        "Manifests synced successfully",
        name: "SyncService:syncPendingManifests",
      );

      // Mark all manifest and their samples as synced
      for (final manifest in pendingManifests) {
        await _localService.updateSyncStatus(
          Tables.manifests,
          Columns.manifestNo,
          manifest.manifestNo,
          SyncStatus.synced,
        );

        final samples = await _localService.getCachedSamplesByManifestNo(
          manifest.manifestNo,
        );
        for (final sample in samples) {
          await _localService.updateSyncStatus(
            Tables.samples,
            Columns.sampleCode,
            sample.sampleCode,
            SyncStatus.synced,
          );
        }
      }
    } else {
      developer.log(
        "Failed to sync manifest: ${(result as Error).message}",
        name: "SyncService:syncPendingManifests",
      );

      // Mark as failed for retry
      for (final manifest in pendingManifests) {
        await _localService.updateSyncStatus(
          Tables.manifests,
          Columns.manifestNo,
          manifest.manifestNo,
          SyncStatus.failed,
        );
      }
    }
  }

  /// Sync all pending routes to server
  Future<void> syncPendingSpecimenShipmentRoutes() async {
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
      // First, ensure all related manifest are synced
      final shipments = await _localService.getCachedShipmentsByRouteNo(
        route.routeNo,
      );
      bool allManifestsSynced = true;

      for (final shipment in shipments) {
        final manifest = await _localService.getManifestByNo(
          shipment.manifestNo,
        );
        if (manifest != null && manifest.syncStatus != SyncStatus.synced) {
          developer.log(
            "Manifest ${shipment.manifestNo} not synced yet, attempting sync",
            name: "SyncService:syncPendingRoutes",
          );

          // Try to sync the manifest first
          await _syncSingleManifest(manifest);

          // Check again
          final updatedManifest = await _localService.getManifestByNo(
            shipment.manifestNo,
          );
          if (updatedManifest?.syncStatus != SyncStatus.synced) {
            allManifestsSynced = false;
            break;
          }
        }
      }

      if (!allManifestsSynced) {
        developer.log(
          "Cannot sync route ${route.routeNo} - some manifest not synced",
          name: "SyncService:syncPendingRoutes",
        );
        continue;
      }

      // Get approval for this route
      final approvals = await _localService.getCachedApprovalsByRouteNo(
        route.routeNo,
      );
      final approval = approvals.isNotEmpty ? approvals.first : null;

      if (approval == null) {
        developer.log(
          "No approval found for route ${route.routeNo}, skipping",
          name: "SyncService:syncPendingRoutes",
        );
        continue;
      }

      // Build the request
      final routeRequest = CreateSpecimenShipmentRouteRequest(
        routeNo: route.routeNo,
        originFacilityId: route.originFacilityId,
        destinationFacilityId: route.destinationFacilityId,
        lspCode: route.lspCode,
        riderUserId: route.riderUserId,
        latitude: route.latitude?.toString() ?? "0.0",
        longitude: route.longitude?.toString() ?? "0.0",
        shipment: shipments
            .map(
              (s) => Shipment(
                shipmentNo: s.shipmentNo,
                manifestNo: s.manifestNo,
                originType: s.originType,
                destinationType: s.destinationLocationType,
                pickupLatitude: s.pickupLatitude.toString(),
                pickupLongitude: s.pickupLongitude.toString(),
                sampleType: s.sampleType,
                sampleCount: s.sampleCount,
                pickupDate: s.pickupDate ?? DateTime.now().toIso8601String(),
              ),
            )
            .toList(),
        approval: Approval(
          approvalNo: approval.approvalNo,
          approvalType: _formatApprovalTypeForServer(approval.approvalType),
          fullname: _valueOrNA(approval.fullname),
          phone: _valueOrNA(approval.phone),
          designation: _valueOrNA(approval.designation),
          signature: _valueOrNA(approval.signature),
          approvalDate:
              approval.approvalDate ?? DateTime.now().toIso8601String(),
        ),
      );

      // Call API
      final result = await _apiService.createSpecimenShipmentRoute(
        shipmentRoute: routeRequest,
      );

      if (result is Success) {
        developer.log(
          "Route ${route.routeNo} synced successfully",
          name: "SyncService:syncPendingRoutes",
        );

        // Mark route, shipments, and approval as synced
        await _localService.updateSyncStatus(
          Tables.routes,
          Columns.routeNo,
          route.routeNo,
          SyncStatus.synced,
        );
        // Update route stage to In-Transit
        await _localService.updateRouteStageToInTransit(route.routeNo);
        for (final shipment in shipments) {
          await _localService.updateSyncStatus(
            Tables.shipments,
            Columns.shipmentNo,
            shipment.shipmentNo,
            SyncStatus.synced,
          );
          // Transition shipment stage to Stage.inTransit
          await _localService.updateShipmentStage(
            shipment.shipmentNo,
            Stage.inTransit,
          );
          // Update shipment, manifest, and samples stage to In-Transit
          await _localService.updateShipmentStageToInTransit(
            shipment.shipmentNo,
            shipment.manifestNo,
          );
        }
        await _localService.updateSyncStatus(
          Tables.approvals,
          Columns.approvalNo,
          approval.approvalNo,
          SyncStatus.synced,
        );
      } else {
        developer.log(
          "Failed to sync route ${route.routeNo}: ${(result as Error).message}",
          name: "SyncService:syncPendingRoutes",
        );
        await _localService.updateSyncStatus(
          Tables.routes,
          Columns.routeNo,
          route.routeNo,
          SyncStatus.failed,
        );
      }
    }
  }

  /// Sync all pending rejections to server
  Future<void> syncPendingRejections() async {
    developer.log(
      "Syncing pending rejections",
      name: "SyncService:syncPendingRejections",
    );

    final pendingRejections = await _localService.getPendingRejections();

    if (pendingRejections.isEmpty) {
      developer.log(
        "No pending rejections to sync",
        name: "SyncService:syncPendingRejections",
      );
      return;
    }

    developer.log(
      "Found ${pendingRejections.length} pending rejections",
      name: "SyncService:syncPendingRejections",
    );

    for (final result in pendingRejections) {
      final apiResult = await _apiService.rejectSample(
        sample: RejectSampleRequest(
          sampleCode: result.sampleCode,
          reason: result.rejectionReason ?? "No reason provided",
          rejectionDate:
              result.rejectionDate ?? DateTime.now().toIso8601String(),
        ),
      );

      if (apiResult is Success) {
        developer.log(
          "Rejection for ${result.sampleCode} synced successfully, deleting from cache",
          name: "SyncService:syncPendingRejections",
        );
        // Delete the result from cache after successful sync
        await _localService.deleteResult(result.sampleCode);
      } else {
        developer.log(
          "Failed to sync rejection for ${result.sampleCode}: ${(apiResult as Error).message}",
          name: "SyncService:syncPendingRejections",
        );
        // Mark as failed for retry
        await _localService.updateResultRejection(
          result.sampleCode,
          true,
          result.rejectionReason,
          result.rejectionDate,
          SyncStatus.failed,
        );
      }
    }
  }

  /// Sync a single manifest to the server
  Future<bool> _syncSingleManifest(DomainManifest manifest) async {
    final samples = await _localService.getCachedSamplesByManifestNo(
      manifest.manifestNo,
    );

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
      samples: samples
          .map(
            (s) => ManifestSampleRequest(
              sampleCode: s.sampleCode,
              patientCode: s.patientCode,
              age: _formatAgeForServer(s.age),
              gender: _formatGenderForServer(s.gender),
            ),
          )
          .toList(),
    );

    final result = await _apiService.createManifests(
      manifests: [manifestRequest],
    );

    if (result is Success) {
      await _localService.updateSyncStatus(
        Tables.manifests,
        Columns.manifestNo,
        manifest.manifestNo,
        SyncStatus.synced,
      );
      for (final sample in samples) {
        await _localService.updateSyncStatus(
          Tables.samples,
          Columns.sampleCode,
          sample.sampleCode,
          SyncStatus.synced,
        );
      }
      return true;
    }

    return false;
  }

  /// Sync a single manifest immediately (called after creation)
  Future<bool> syncManifestNow(
    DomainManifest manifest,
    List<DomainSample> samples,
  ) async {
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

    // Ensure all manifest are synced first
    for (final shipment in shipments) {
      final manifest = await _localService.getManifestByNo(shipment.manifestNo);
      if (manifest != null && manifest.syncStatus != SyncStatus.synced) {
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
    final specimenShipmentRoute = CreateSpecimenShipmentRouteRequest(
      routeNo: route.routeNo,
      originFacilityId: route.originFacilityId,
      destinationFacilityId: route.destinationFacilityId,
      lspCode: route.lspCode,
      riderUserId: route.riderUserId,
      latitude: route.latitude?.toString() ?? "0.0",
      longitude: route.longitude?.toString() ?? "0.0",
      shipment: shipments
          .map(
            (s) => Shipment(
              shipmentNo: s.shipmentNo,
              manifestNo: s.manifestNo,
              originType: s.originType,
              destinationType: s.destinationLocationType,
              pickupLatitude: s.pickupLatitude.toString(),
              pickupLongitude: s.pickupLongitude.toString(),
              sampleType: s.sampleType,
              sampleCount: s.sampleCount,
              pickupDate: s.pickupDate ?? DateTime.now().toIso8601String(),
            ),
          )
          .toList(),
      approval: Approval(
        approvalNo: approval.approvalNo,
        approvalType: _formatApprovalTypeForServer(approval.approvalType),
        fullname: _valueOrNA(approval.fullname),
        phone: _valueOrNA(approval.phone),
        designation: _valueOrNA(approval.designation),
        signature: _valueOrNA(approval.signature),
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    final result = await _apiService.createSpecimenShipmentRoute(
      shipmentRoute: specimenShipmentRoute,
    );

    if (result is Success) {
      // Mark as synced
      await _localService.updateSyncStatus(
        Tables.routes,
        Columns.routeNo,
        route.routeNo,
        SyncStatus.synced,
      );
      // Update route stage to In-Transit
      await _localService.updateRouteStageToInTransit(route.routeNo);
      for (final shipment in shipments) {
        await _localService.updateSyncStatus(
          Tables.shipments,
          Columns.shipmentNo,
          shipment.shipmentNo,
          SyncStatus.synced,
        );
        // Transition shipment stage to Stage.inTransit
        await _localService.updateShipmentStage(
          shipment.shipmentNo,
          Stage.inTransit,
        );
        // Update shipment, manifest, and samples stage to In-Transit
        await _localService.updateShipmentStageToInTransit(
          shipment.shipmentNo,
          shipment.manifestNo,
        );
      }
      await _localService.updateSyncStatus(
        Tables.approvals,
        Columns.approvalNo,
        approval.approvalNo,
        SyncStatus.synced,
      );
      return true;
    }

    return false;
  }

  /// Sync all pending specimen deliveries to server
  Future<void> syncPendingSpecimenShipmentDeliveries() async {
    developer.log(
      "Syncing pending specimen deliveries",
      name: "SyncService:syncPendingSpecimenDeliveries",
    );

    final pendingDeliveries = await _localService
        .getPendingSpecimenDeliveries();

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
      final shipments = await _localService.getCachedShipmentsByRouteNo(
        approval.routeNo,
      );

      // Step 1: Ensure all manifest are synced first
      bool allManifestsSynced = true;
      for (final shipment in shipments) {
        final manifest = await _localService.getManifestByNo(
          shipment.manifestNo,
        );
        if (manifest != null && manifest.syncStatus != SyncStatus.synced) {
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
      if (route.syncStatus != SyncStatus.synced) {
        developer.log(
          "Route ${route.routeNo} not synced, attempting sync first",
          name: "SyncService:syncPendingSpecimenDeliveries",
        );

        // Get the pickup approval for this route
        final pickupApprovals = await _localService
            .getCachedPickupApprovalsByRouteNo(approval.routeNo);
        final pickupApproval = pickupApprovals.isNotEmpty
            ? pickupApprovals.first
            : null;

        if (pickupApproval == null) {
          developer.log(
            "No pickup approval found for route ${route.routeNo}, skipping delivery",
            name: "SyncService:syncPendingSpecimenDeliveries",
          );
          continue;
        }

        // Sync the route
        final routeSynced = await _syncSingleRoute(
          route,
          shipments,
          pickupApproval,
        );
        if (!routeSynced) {
          developer.log(
            "Failed to sync route ${route.routeNo}, skipping delivery",
            name: "SyncService:syncPendingSpecimenDeliveries",
          );
          continue;
        }

        // Refresh route to get updated sync status
        route = await _localService.getCachedRouteByRouteNo(approval.routeNo);
        if (route == null || route.syncStatus != SyncStatus.synced) {
          continue;
        }
      }

      // Step 3: Now we can add the delivery request
      // Get delivered shipments for this route
      final deliveredShipments = await _localService
          .getDeliveredShipmentsByRouteNo(approval.routeNo);

      for (final shipment in deliveredShipments) {
        deliveryRequests.add(
          SpecimenDeliveryRequest(
            routeNo: route.routeNo,
            shipmentNo: shipment.shipmentNo,
            manifestNo: shipment.manifestNo,
            latitude: route.latitude?.toString() ?? "0.0",
            longitude: route.longitude?.toString() ?? "0.0",
            deliveryDate:
                shipment.deliveryDate ?? DateTime.now().toIso8601String(),
            destinationType: shipment.destinationLocationType,
            approval: SpecimenDeliveryApproval(
              approvalNo: approval.approvalNo,
              approvalType: _formatApprovalTypeForServer(approval.approvalType),
              fullname: _valueOrNA(approval.fullname),
              phone: _valueOrNA(approval.phone),
              designation: _valueOrNA(approval.designation),
              signature: _valueOrNA(approval.signature),
              approvalDate:
                  approval.approvalDate ?? DateTime.now().toIso8601String(),
            ),
          ),
        );
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
    final result = await _apiService.deliverSpecimenShipments(
      deliveries: deliveryRequests,
    );

    if (result is Success) {
      developer.log(
        "Specimen deliveries synced successfully",
        name: "SyncService:syncPendingSpecimenDeliveries",
      );

      // Mark all successful delivery approvals as synced
      for (final approval in successfulApprovals) {
        await _localService.updateSyncStatus(
          Tables.approvals,
          Columns.approvalNo,
          approval.approvalNo,
          SyncStatus.synced,
        );
      }
    } else {
      developer.log(
        "Failed to sync specimen deliveries: ${(result as Error).message}",
        name: "SyncService:syncPendingSpecimenDeliveries",
      );

      // Mark as failed for retry
      for (final approval in successfulApprovals) {
        await _localService.updateSyncStatus(
          Tables.approvals,
          Columns.approvalNo,
          approval.approvalNo,
          SyncStatus.failed,
        );
      }
    }
  }

  /// Sync a single route to the server
  Future<bool> _syncSingleRoute(
    DomainShipmentRoute route,
    List<DomainShipment> shipments,
    DomainApproval approval,
  ) async {
    final routeRequest = CreateSpecimenShipmentRouteRequest(
      routeNo: route.routeNo,
      originFacilityId: route.originFacilityId,
      destinationFacilityId: route.destinationFacilityId,
      lspCode: route.lspCode,
      riderUserId: route.riderUserId,
      latitude: route.latitude?.toString() ?? "0.0",
      longitude: route.longitude?.toString() ?? "0.0",
      shipment: shipments
          .map(
            (s) => Shipment(
              shipmentNo: s.shipmentNo,
              manifestNo: s.manifestNo,
              originType: s.originType,
              destinationType: s.destinationLocationType,
              pickupLatitude: s.pickupLatitude.toString(),
              pickupLongitude: s.pickupLongitude.toString(),
              sampleType: s.sampleType,
              sampleCount: s.sampleCount,
              pickupDate: s.pickupDate ?? DateTime.now().toIso8601String(),
            ),
          )
          .toList(),
      approval: Approval(
        approvalNo: approval.approvalNo,
        approvalType: _formatApprovalTypeForServer(approval.approvalType),
        fullname: _valueOrNA(approval.fullname),
        phone: _valueOrNA(approval.phone),
        designation: _valueOrNA(approval.designation),
        signature: _valueOrNA(approval.signature),
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    final result = await _apiService.createSpecimenShipmentRoute(
      shipmentRoute: routeRequest,
    );

    if (result is Success) {
      await _localService.updateSyncStatus(
        Tables.routes,
        Columns.routeNo,
        route.routeNo,
        SyncStatus.synced,
      );
      // Update route stage to In-Transit
      await _localService.updateRouteStageToInTransit(route.routeNo);
      for (final shipment in shipments) {
        await _localService.updateSyncStatus(
          Tables.shipments,
          Columns.shipmentNo,
          shipment.shipmentNo,
          SyncStatus.synced,
        );
        // Transition shipment stage to Stage.inTransit
        await _localService.updateShipmentStage(
          shipment.shipmentNo,
          Stage.inTransit,
        );
        // Update shipment, manifest, and samples stage to In-Transit
        await _localService.updateShipmentStageToInTransit(
          shipment.shipmentNo,
          shipment.manifestNo,
        );
      }
      await _localService.updateSyncStatus(
        Tables.approvals,
        Columns.approvalNo,
        approval.approvalNo,
        SyncStatus.synced,
      );
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

    // Step 1: Ensure all manifest are synced first
    for (final shipment in shipments) {
      final manifest = await _localService.getManifestByNo(shipment.manifestNo);
      if (manifest != null && manifest.syncStatus != SyncStatus.synced) {
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
    if (currentRoute.syncStatus != SyncStatus.synced) {
      developer.log(
        "Route ${currentRoute.routeNo} not synced, attempting sync first",
        name: "SyncService:syncSpecimenDeliveryNow",
      );

      // Get the pickup approval for this route
      final pickupApprovals = await _localService
          .getCachedPickupApprovalsByRouteNo(currentRoute.routeNo);
      final pickupApproval = pickupApprovals.isNotEmpty
          ? pickupApprovals.first
          : null;

      if (pickupApproval == null) {
        developer.log(
          "No pickup approval found for route ${currentRoute.routeNo}, delivery sync deferred",
          name: "SyncService:syncSpecimenDeliveryNow",
        );
        return false;
      }

      final routeSynced = await _syncSingleRoute(
        currentRoute,
        shipments,
        pickupApproval,
      );
      if (!routeSynced) {
        developer.log(
          "Failed to sync route ${currentRoute.routeNo}, delivery sync deferred",
          name: "SyncService:syncSpecimenDeliveryNow",
        );
        return false;
      }

      // Refresh route
      final refreshedRoute = await _localService.getCachedRouteByRouteNo(
        currentRoute.routeNo,
      );
      if (refreshedRoute == null ||
          refreshedRoute.syncStatus != SyncStatus.synced) {
        return false;
      }
      currentRoute = refreshedRoute;
    }

    // Step 3: Now sync the delivery
    final deliveryRequests = shipments
        .map<SpecimenDeliveryRequest>(
          (shipment) => SpecimenDeliveryRequest(
            routeNo: currentRoute.routeNo,
            shipmentNo: shipment.shipmentNo,
            manifestNo: shipment.manifestNo,
            latitude: currentRoute.latitude?.toString() ?? "0.0",
            longitude: currentRoute.longitude?.toString() ?? "0.0",
            deliveryDate:
                shipment.deliveryDate ?? DateTime.now().toIso8601String(),
            destinationType: shipment.destinationLocationType,
            approval: SpecimenDeliveryApproval(
              approvalNo: deliveryApproval.approvalNo,
              approvalType: _formatApprovalTypeForServer(
                deliveryApproval.approvalType,
              ),
              fullname: _valueOrNA(deliveryApproval.fullname),
              phone: _valueOrNA(deliveryApproval.phone),
              designation: _valueOrNA(deliveryApproval.designation),
              signature: _valueOrNA(deliveryApproval.signature),
              approvalDate:
                  deliveryApproval.approvalDate ??
                  DateTime.now().toIso8601String(),
            ),
          ),
        )
        .toList();

    final result = await _apiService.deliverSpecimenShipments(
      deliveries: deliveryRequests,
    );

    if (result is Success) {
      await _localService.updateSyncStatus(
        Tables.approvals,
        Columns.approvalNo,
        deliveryApproval.approvalNo,
        SyncStatus.synced,
      );
      return true;
    }

    return false;
  }

  /// Sync all pending result shipment routes to server
  Future<void> syncPendingResultShipmentRoutes() async {
    developer.log(
      "Syncing pending result shipment routes",
      name: "SyncService:syncPendingResultShipmentRoutes",
    );

    final approvals = await _localService
        .getPendingResultShipmentRouteApprovals();

    if (approvals.isEmpty) {
      developer.log(
        "No pending result shipment routes to sync",
        name: "SyncService:syncPendingResultShipmentRoutes",
      );
      return;
    }

    developer.log(
      "Found ${approvals.length} pending result shipment routes",
      name: "SyncService:syncPendingResultShipmentRoutes",
    );

    for (final approval in approvals) {
      // Get the route for this approval
      final route = await _localService.getCachedRouteByRouteNo(
        approval.routeNo,
      );
      if (route == null) {
        developer.log(
          "Route not found for approval ${approval.approvalNo}, skipping",
          name: "SyncService:syncPendingResultShipmentRoutes",
        );
        continue;
      }

      // Get sample codes from results table
      final pickedResults = await _localService.getPickedResultsForRoute(
        route.routeNo,
      );
      final sampleCodes = pickedResults.map((r) => r.sampleCode).toList();

      // Get shipments for this route
      final shipments = await _localService.getCachedShipmentsByRouteNo(
        approval.routeNo,
      );

      if (shipments.isEmpty) {
        developer.log(
          "No shipments found for route ${route.routeNo}, skipping",
          name: "SyncService:syncPendingResultShipmentRoutes",
        );
        continue;
      }

      for (final shipment in shipments) {
        // Build the request
        final routeRequest = CreateResultShipmentRouteRequest(
          routeNo: route.routeNo,
          originFacilityId: route.originFacilityId,
          destinationFacilityId: route.destinationFacilityId,
          lspCode: route.lspCode,
          riderUserId: route.riderUserId,
          temperature: "0",
          latitude: route.latitude?.toString() ?? "0.0",
          longitude: route.longitude?.toString() ?? "0.0",
          shipment: ResultShipment(
            shipmentNo: shipment.shipmentNo,
            originType: shipment.originType,
            destinationType: shipment.destinationLocationType,
            sampleType: shipment.sampleType,
            // to be removed once API is updated
            sampleCount: shipment.sampleCount,
            pickupDate: shipment.pickupDate ?? DateTime.now().toIso8601String(),
          ),
          samples: sampleCodes,
          approval: ResultShipmentApproval(
            approvalNo: approval.approvalNo,
            approvalType: _formatApprovalTypeForServer(approval.approvalType),
            fullname: _valueOrNA(approval.fullname),
            phone: _valueOrNA(approval.phone),
            designation: _valueOrNA(approval.designation),
            signature: _valueOrNA(approval.signature),
            approvalDate:
                approval.approvalDate ?? DateTime.now().toIso8601String(),
          ),
        );

        developer.log(
          "api syncPendingResultShipmentRoutes routeRequest: $routeRequest",
          name: "SyncService:syncPendingResultShipmentRoutes",
        );

        // Call API
        final result = await _apiService.createResultShipmentRoute(
          routes: [routeRequest],
        );

        if (result is Success) {
          developer.log(
            "Result pickup ${approval.approvalNo} synced successfully",
            name: "SyncService:syncPendingResultShipmentRoutes",
          );

          // Mark as synced
          await _localService.updateSyncStatus(
            Tables.approvals,
            Columns.approvalNo,
            approval.approvalNo,
            SyncStatus.synced,
          );
          await _localService.updateSyncStatus(
            Tables.routes,
            Columns.routeNo,
            route.routeNo,
            SyncStatus.synced,
          );
          // Update route stage to In-Transit
          await _localService.updateRouteStageToInTransit(route.routeNo);
          await _localService.updateSyncStatus(
            Tables.shipments,
            Columns.shipmentNo,
            shipment.shipmentNo,
            SyncStatus.synced,
          );
          // Transition shipment stage to Stage.inTransit
          await _localService.updateShipmentStage(
            shipment.shipmentNo,
            Stage.inTransit,
          );
          // Update shipment stage to In-Transit (for result pickups, manifest is not local so we just update shipment)
          await _localService.updateStage(
            Tables.shipments,
            Columns.shipmentNo,
            shipment.shipmentNo,
            Stage.inTransit,
          );
          // Note: Results are kept until delivery sync completes
        } else {
          developer.log(
            "Failed to sync result pickup ${approval.approvalNo}: ${(result as Error).message}",
            name: "SyncService:syncPendingResultShipmentRoutes",
          );
          await _localService.updateSyncStatus(
            Tables.approvals,
            Columns.approvalNo,
            approval.approvalNo,
            SyncStatus.failed,
          );
        }
      }
    }
  }

  /// Sync a result pickup immediately (called after creation)
  Future<bool> syncResultPickupNow(
    DomainShipmentRoute route,
    DomainShipment shipment,
    DomainApproval approval,
    List<String> sampleCodes,
  ) async {
    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      return false;
    }

    final routeRequest = CreateResultShipmentRouteRequest(
      routeNo: route.routeNo,
      originFacilityId: route.originFacilityId,
      destinationFacilityId: route.destinationFacilityId,
      lspCode: route.lspCode,
      riderUserId: route.riderUserId,
      temperature: "0",
      // to be removed once API is updated
      latitude: route.latitude?.toString() ?? "0.0",
      longitude: route.longitude?.toString() ?? "0.0",
      shipment: ResultShipment(
        shipmentNo: shipment.shipmentNo,
        originType: shipment.originType,
        destinationType: shipment.destinationLocationType,
        sampleType: shipment.sampleType,
        sampleCount: shipment.sampleCount,
        pickupDate: shipment.pickupDate ?? DateTime.now().toIso8601String(),
      ),
      samples: sampleCodes,
      approval: ResultShipmentApproval(
        approvalNo: approval.approvalNo,
        approvalType: _formatApprovalTypeForServer(approval.approvalType),
        fullname: _valueOrNA(approval.fullname),
        phone: _valueOrNA(approval.phone),
        designation: _valueOrNA(approval.designation),
        signature: _valueOrNA(approval.signature),
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    developer.log(
      "api syncResultPickupNow routeRequest: $routeRequest",
      name: "SyncService:syncResultPickupNow",
    );

    final result = await _apiService.createResultShipmentRoute(
      routes: [routeRequest],
    );

    if (result is Success) {
      await _localService.updateSyncStatus(
        Tables.approvals,
        Columns.approvalNo,
        approval.approvalNo,
        SyncStatus.synced,
      );
      await _localService.updateSyncStatus(
        Tables.routes,
        Columns.routeNo,
        route.routeNo,
        SyncStatus.synced,
      );
      // Update route stage to In-Transit
      await _localService.updateRouteStageToInTransit(route.routeNo);
      await _localService.updateSyncStatus(
        Tables.shipments,
        Columns.shipmentNo,
        shipment.shipmentNo,
        SyncStatus.synced,
      );
      // Transition shipment stage to Stage.inTransit
      await _localService.updateShipmentStage(
        shipment.shipmentNo,
        Stage.inTransit,
      );
      // Update shipment stage to In-Transit (for result pickups, manifest is not local so we just update shipment)
      await _localService.updateStage(
        Tables.shipments,
        Columns.shipmentNo,
        shipment.shipmentNo,
        Stage.inTransit,
      );
      // Note: Results are kept until delivery sync completes
      return true;
    }

    return false;
  }

  /// Sync all pending result deliveries to server
  Future<void> syncPendingResultShipmentDeliveries() async {
    developer.log(
      "Syncing pending result deliveries",
      name: "SyncService:syncPendingResultDeliveries",
    );

    final approvals = await _localService.getPendingResultDeliveryApprovals();

    if (approvals.isEmpty) {
      developer.log(
        "No pending result deliveries to sync",
        name: "SyncService:syncPendingResultDeliveries",
      );
      return;
    }

    developer.log(
      "Found ${approvals.length} pending result deliveries",
      name: "SyncService:syncPendingResultDeliveries",
    );

    for (final approval in approvals) {
      // Get the route for this approval
      final route = await _localService.getCachedRouteByRouteNo(
        approval.routeNo,
      );
      if (route == null) {
        developer.log(
          "Route not found for approval ${approval.approvalNo}, skipping",
          name: "SyncService:syncPendingResultDeliveries",
        );
        continue;
      }

      // Fetch results for this route to get sample codes
      final results = await _localService.getPickedResultsForRoute(
        route.routeNo,
      );
      final sampleCodes = results.map((r) => r.sampleCode).toList();

      developer.log(
        "Found ${sampleCodes.length} sample codes for route ${route.routeNo}",
        name: "SyncService:syncPendingResultDeliveries",
      );

      // Get delivered shipments for this route
      final shipments = await _localService.getDeliveredShipmentsByRouteNo(
        approval.routeNo,
      );
      if (shipments.isEmpty) {
        developer.log(
          "No delivered shipments found for route ${route.routeNo}, skipping",
          name: "SyncService:syncPendingResultDeliveries",
        );
        continue;
      }

      for (final shipment in shipments) {
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
            deliveryDate:
                shipment.deliveryDate ?? DateTime.now().toIso8601String(),
          ),
          samples: sampleCodes,
          approval: ResultDeliveryApproval(
            approvalNo: approval.approvalNo,
            approvalType: _formatApprovalTypeForServer(approval.approvalType),
            fullname: _valueOrNA(approval.fullname),
            phone: _valueOrNA(approval.phone),
            designation: _valueOrNA(approval.designation),
            signature: _valueOrNA(approval.signature),
            approvalDate:
                approval.approvalDate ?? DateTime.now().toIso8601String(),
          ),
        );

        // Call API
        final result = await _apiService.deliverResultShipments(
          deliveries: [deliveryRequest],
        );

        if (result is Success) {
          developer.log(
            "Result delivery ${approval.approvalNo} synced successfully",
            name: "SyncService:syncPendingResultDeliveries",
          );
          await _localService.updateSyncStatus(
            Tables.approvals,
            Columns.approvalNo,
            approval.approvalNo,
            SyncStatus.synced,
          );
          // Note: Picked results are kept in cache and filtered out on the results screen
        } else {
          developer.log(
            "Failed to sync result delivery ${approval.approvalNo}: ${(result as Error).message}",
            name: "SyncService:syncPendingResultDeliveries",
          );
          await _localService.updateSyncStatus(
            Tables.approvals,
            Columns.approvalNo,
            approval.approvalNo,
            SyncStatus.failed,
          );
        }
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
        approvalType: _formatApprovalTypeForServer(approval.approvalType),
        fullname: _valueOrNA(approval.fullname),
        phone: _valueOrNA(approval.phone),
        designation: _valueOrNA(approval.designation),
        signature: _valueOrNA(approval.signature),
        approvalDate: approval.approvalDate ?? DateTime.now().toIso8601String(),
      ),
    );

    final result = await _apiService.deliverResultShipments(
      deliveries: [deliveryRequest],
    );

    if (result is Success) {
      await _localService.updateSyncStatus(
        Tables.approvals,
        Columns.approvalNo,
        approval.approvalNo,
        SyncStatus.synced,
      );
      // Note: Picked results are kept in cache and filtered out on the results screen
      return true;
    }

    return false;
  }
}
