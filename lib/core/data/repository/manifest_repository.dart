import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/delete_manifest_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/update_manifest_request_body.dart';
import 'package:nims_mobile_app/core/services/sync/sync_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class ManifestRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;
  final SyncService _syncService;

  ManifestRepository(
    this._apiService,
    this._localService,
    this._connectivityService,
    this._syncService,
  );

  /// Save a manifest locally and attempt immediate sync if online
  Future<Result<bool>> saveManifest(
    DomainManifest manifest,
    List<DomainSample> samples,
  ) async {
    try {
      // 1. Save locally with pending sync status (default)
      await _localService.cacheManifest(manifest, samples);

      // 2. If online, try to sync immediately
      final isConnected = await _connectivityService.isConnected;
      if (isConnected) {
        final synced = await _syncService.syncManifestNow(manifest, samples);
        if (synced) {
          developer.log(
            "Manifest ${manifest.manifestNo} synced immediately",
            name: "ManifestRepository:saveManifest",
          );
        } else {
          developer.log(
            "Manifest ${manifest.manifestNo} saved locally, sync failed",
            name: "ManifestRepository:saveManifest",
          );
        }
      } else {
        developer.log(
          "Manifest ${manifest.manifestNo} saved locally (offline)",
          name: "ManifestRepository:saveManifest",
        );
      }

      return Success(true);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:saveManifest",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Update a manifest - server-first for synced records
  Future<Result<bool>> updateManifest(DomainManifest manifest) async {
    try {
      final existing = await _localService.getManifestByNo(manifest.manifestNo);

      if (existing == null) {
        return Error("Manifest not found");
      }

      if (existing.syncStatus == 'synced') {
        // Server-first: must be online to update synced records
        final isConnected = await _connectivityService.isConnected;
        if (!isConnected) {
          return Error("Cannot update synced record while offline");
        }

        // Update on server first
        final result = await _apiService.updateManifest(
          manifest: UpdateManifestRequest(
            manifestNo: manifest.manifestNo,
            originFacilityId: manifest.originId,
            destinationFacilityId: manifest.destinationId,
            sampleType: manifest.sampleType,
            phlebotomyNo: manifest.phlebotomyNo,
            temperature: manifest.temperature ?? "",
          ),
        );

        if (result is Success) {
          // Update locally with synced status
          await _localService.updateManifestLocally(
            manifest.copyWith(syncStatus: 'synced'),
          );
          return Success(true);
        } else {
          return Error("Failed to update on server: ${(result as Error).message}");
        }
      } else {
        // Local-only record: update directly
        await _localService.updateManifestLocally(manifest);
        return Success(true);
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:updateManifest",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Delete a manifest - server-first for synced records
  Future<Result<bool>> deleteManifest(String manifestNo, String originId) async {
    try {
      final existing = await _localService.getManifestByCompositeKey(manifestNo, originId);

      if (existing == null) {
        return Error("Manifest not found");
      }

      if (existing.syncStatus == 'synced') {
        // Server-first: must be online to delete synced records
        final isConnected = await _connectivityService.isConnected;
        if (!isConnected) {
          return Error("Cannot delete synced record while offline");
        }

        // Delete on server first
        final result = await _apiService.deleteManifest(
          manifest: DeleteManifestRequest(manifestNo: manifestNo),
        );

        if (result is Success) {
          // Delete locally
          await _localService.deleteManifestLocally(manifestNo, originId);
          return Success(true);
        } else {
          return Error("Failed to delete on server: ${(result as Error).message}");
        }
      } else {
        // Local-only record: delete directly
        await _localService.deleteManifestLocally(manifestNo, originId);
        return Success(true);
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:deleteManifest",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<List<DomainManifest>>> getFacilityManifests(
    DomainFacility facility,
  ) async {
    try {
      final manifests = await _localService.getCacheManifestsByOriginId(
        facility.facilityId.toString(),
      );
      return Success(manifests);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:getFacilityManifests",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<List<DomainManifest>>> searchManifests(String query) async {
    try {
      final manifests = await _localService.getCachedManifestsBySearchQuery(query);
      return Success(manifests);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:searchManifests",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<Map<String, String>>> getShippedManifestStatuses() async {
    try {
      final statuses = await _localService.getShippedManifestStatuses();
      return Success(statuses);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:getShippedManifestStatuses",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get a manifest by its manifest number
  Future<Result<DomainManifest?>> getManifestByNo(String manifestNo) async {
    try {
      final manifest = await _localService.getManifestByNo(manifestNo);
      return Success(manifest);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:getManifestByNo",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get all manifest
  Future<Result<List<DomainManifest>>> getAllManifests() async {
    try {
      final manifests = await _localService.getAllCachedManifests();
      return Success(manifests);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ManifestRepository:getAllManifests",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
