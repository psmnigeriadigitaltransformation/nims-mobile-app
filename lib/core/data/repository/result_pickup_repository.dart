import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/local/nims_local_service.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/reject_sample_request_body.dart';
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

  Future<Result<List<DomainResult>>> fetchFacilityResults(String facilityId) async {
    try {
      final isConnected = await _connectivityService.isConnected;

      if (isConnected) {
        // Try to fetch from API
        developer.log(
          "Fetching available results from API for facility $facilityId",
          name: "ResultPickupRepository:fetchAndCacheAvailableResults",
        );

        final apiResult = await _apiService.getFacilityResults(facilityId: facilityId);

        switch (apiResult) {
          case Success(payload: final response):
            final remoteResults = response.data ?? [];
            // Convert to domain models
            final domainResults = remoteResults.map((item) => DomainResult(
              sampleCode: item.sampleCode ?? "",
              manifestNo: item.manifestNo ?? "",
              patientCode: item.patientCode ?? "",
              age: item.age ?? "",
              gender: item.gender ?? "",
              facilityId: facilityId,
            )).toList();

            // Cache the results
            await _localService.cacheResultsForFacility(facilityId, domainResults);

            developer.log(
              "Cached ${domainResults.length} results for facility $facilityId",
              name: "ResultPickupRepository:fetchAndCacheAvailableResults",
            );

            // Return cached results (includes any locally modified results)
            final cachedResults = await _localService.getCachedResultsForFacility(facilityId);
            return Success(cachedResults);

          case Error(message: final m):
            developer.log(
              "Failed to fetch from API: $m, returning cached results",
              name: "ResultPickupRepository:fetchAndCacheAvailableResults",
            );
            // Fall through to return cached results
        }
      }

      // Return cached results (offline or API failed)
      final cachedResults = await _localService.getCachedResultsForFacility(facilityId);
      developer.log(
        "Returning ${cachedResults.length} cached results for facility $facilityId",
        name: "ResultPickupRepository:fetchAndCacheAvailableResults",
      );
      return Success(cachedResults);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ResultPickupRepository:fetchAndCacheAvailableResults",
      );
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  /// Reject a result - updates locally and attempts API sync
  Future<Result<bool>> rejectResult(String sampleCode, String reason) async {
    try {
      final rejectionDate = DateTime.now().toIso8601String();

      // Update locally first with pending status
      await _localService.updateResultRejection(
        sampleCode,
        true,
        reason,
        rejectionDate,
        'pending',
      );

      developer.log(
        "Result $sampleCode marked as rejected locally",
        name: "ResultPickupRepository:rejectResult",
      );

      // Attempt immediate sync if online
      final isConnected = await _connectivityService.isConnected;
      if (isConnected) {
        developer.log(
          "Online, attempting immediate rejection sync",
          name: "ResultPickupRepository:rejectResult",
        );

        final apiResult = await _apiService.rejectSample(
          sample: RejectSampleRequest(
            sampleCode: sampleCode,
            reason: reason,
            rejectionDate: rejectionDate,
          ),
        );

        switch (apiResult) {
          case Success():
            // Rejection synced - delete result from local cache
            await _localService.deleteResult(sampleCode);
            developer.log(
              "Rejection synced and result $sampleCode deleted from cache",
              name: "ResultPickupRepository:rejectResult",
            );
            return Success(true);

          case Error(message: final m):
            // Sync failed - mark as failed for retry
            await _localService.updateResultRejection(
              sampleCode,
              true,
              reason,
              rejectionDate,
              'failed',
            );
            developer.log(
              "Rejection sync failed: $m, marked as failed",
              name: "ResultPickupRepository:rejectResult",
            );
        }
      }

      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ResultPickupRepository:rejectResult",
      );
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  /// Accept a result (undo pending rejection)
  Future<Result<bool>> acceptResult(String sampleCode) async {
    try {
      // Get the current result
      final result = await _localService.getResultBySampleCode(sampleCode);
      if (result == null) {
        return Error("Result not found");
      }

      // Can only accept if rejection hasn't been synced yet
      if (result.rejectionSyncStatus == 'synced') {
        return Error("Cannot undo rejection that has already been synced");
      }

      // Clear rejection data
      await _localService.updateResultRejection(
        sampleCode,
        false,
        null,
        null,
        null,
      );

      developer.log(
        "Result $sampleCode accepted (rejection undone)",
        name: "ResultPickupRepository:acceptResult",
      );

      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ResultPickupRepository:acceptResult",
      );
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  /// Mark results as picked for a route
  Future<Result<bool>> markResultsAsPickedForRoute(List<String> sampleCodes, String routeNo) async {
    try {
      await _localService.markResultsAsPickedForRoute(sampleCodes, routeNo);
      developer.log(
        "Marked ${sampleCodes.length} results as picked for route $routeNo",
        name: "ResultPickupRepository:markResultsAsPickedForRoute",
      );
      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ResultPickupRepository:markResultsAsPickedForRoute",
      );
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  /// Get sample codes for a route (for sync)
  Future<List<String>> getSampleCodesForRoute(String routeNo) async {
    final results = await _localService.getPickedResultsForRoute(routeNo);
    return results.map((r) => r.sampleCode).toList();
  }

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
