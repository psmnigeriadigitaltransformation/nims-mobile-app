import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/delete_sample_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/reject_sample_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/update_sample_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/sample_types_response.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class SamplesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;
  final ConnectivityService _connectivityService;

  SamplesRepository(
    this._apiService,
    this._localService,
    this._connectivityService,
  );

  Future<Result<List<DomainSampleType>>> getSampleTypes(bool refresh) async {
    try {
      final cachedSampleTypes = await _localService.getCachedSampleTypes();
      if (cachedSampleTypes.isNotEmpty && !refresh) {
        return Success(cachedSampleTypes);
      } else {
        final result = await _apiService.getSampleTypes();
        developer.log(
          "result: $result",
          name: "SamplesRepository:getSampleTypes",
        );
        switch (result) {
          case Success<SampleTypesResponse>(payload: final data):
            developer.log(
              "data: $data",
              name: "SamplesRepository:getSampleTypes",
            );
            final sampleTypes = result.payload.data;
            if (sampleTypes == null || sampleTypes.isEmpty) {
              return Error("No sample type available");
            }
            final domainSampleTypes = sampleTypes
                .map((sampleType) => sampleType.toDomain())
                .toList();
            await _localService.cacheSampleTypes(domainSampleTypes);
            return Success(domainSampleTypes);
          case Error<SampleTypesResponse>():
            developer.log(
              "error: ${result.message}",
              name: "SamplesRepository:getSampleTypes",
            );
            return Error(result.message);
        }
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "SamplesRepository:getSampleTypes",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Update a sample - server-first for synced records
  Future<Result<bool>> updateSample(DomainSample sample) async {
    try {
      final existing = await _localService.getSampleByCode(sample.sampleCode);

      if (existing == null) {
        return Error("Sample not found");
      }

      if (existing.syncStatus == 'synced') {
        // Server-first: must be online to update synced records
        final isConnected = await _connectivityService.isConnected;
        if (!isConnected) {
          return Error("Cannot update synced record while offline");
        }

        // Update on server first
        final result = await _apiService.updateSample(
          sample: UpdateSampleRequest(
            sampleCode: sample.sampleCode,
            patientCode: sample.patientCode,
            age: sample.age,
            gender: sample.gender,
          ),
        );

        if (result is Success) {
          // Update locally with synced status
          await _localService.updateSampleLocally(
            sample.copyWith(syncStatus: 'synced'),
          );
          return Success(true);
        } else {
          return Error("Failed to update on server: ${(result as Error).message}");
        }
      } else {
        // Local-only record: update directly
        await _localService.updateSampleLocally(sample);
        return Success(true);
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "SamplesRepository:updateSample",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Delete a sample - server-first for synced records
  Future<Result<bool>> deleteSample(String sampleCode, String manifestNo) async {
    try {
      final existing = await _localService.getSampleByCode(sampleCode);

      if (existing == null) {
        return Error("Sample not found");
      }

      if (existing.syncStatus == 'synced') {
        // Server-first: must be online to delete synced records
        final isConnected = await _connectivityService.isConnected;
        if (!isConnected) {
          return Error("Cannot delete synced record while offline");
        }

        // Delete on server first
        final result = await _apiService.deleteSample(
          sample: DeleteSampleRequest(manifestNo: sampleCode),
        );

        if (result is Success) {
          // Delete locally
          await _localService.deleteSampleLocally(sampleCode);

          // Update manifest sample count
          final samples = await _localService.getCachedSamplesByManifestNo(manifestNo);
          await _localService.updateManifestSampleCount(manifestNo, samples.length);

          return Success(true);
        } else {
          return Error("Failed to delete on server: ${(result as Error).message}");
        }
      } else {
        // Local-only record: delete directly
        await _localService.deleteSampleLocally(sampleCode);

        // Update manifest sample count
        final samples = await _localService.getCachedSamplesByManifestNo(manifestNo);
        await _localService.updateManifestSampleCount(manifestNo, samples.length);

        return Success(true);
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "SamplesRepository:deleteSample",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Reject a sample - requires online for synced samples
  Future<Result<bool>> rejectSample(
    String sampleCode,
    String reason,
    String manifestNo,
  ) async {
    try {
      final existing = await _localService.getSampleByCode(sampleCode);

      if (existing == null) {
        return Error("Sample not found");
      }

      if (existing.syncStatus == 'synced') {
        // Server-first: must be online to reject synced records
        final isConnected = await _connectivityService.isConnected;
        if (!isConnected) {
          return Error("Cannot reject synced sample while offline");
        }

        // Reject on server first
        final result = await _apiService.rejectSample(
          sample: RejectSampleRequest(
            sampleCode: sampleCode,
            reason: reason,
            rejectionDate: DateTime.now().toIso8601String(),
          ),
        );

        if (result is Success) {
          // Delete locally after rejection
          await _localService.deleteSampleLocally(sampleCode);

          // Update manifest sample count
          final samples = await _localService.getCachedSamplesByManifestNo(manifestNo);
          await _localService.updateManifestSampleCount(manifestNo, samples.length);

          return Success(true);
        } else {
          return Error("Failed to reject on server: ${(result as Error).message}");
        }
      } else {
        // Local-only record: just delete it (no need to call reject API)
        await _localService.deleteSampleLocally(sampleCode);

        // Update manifest sample count
        final samples = await _localService.getCachedSamplesByManifestNo(manifestNo);
        await _localService.updateManifestSampleCount(manifestNo, samples.length);

        return Success(true);
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "SamplesRepository:rejectSample",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get samples by manifest number
  Future<Result<List<DomainSample>>> getSamplesByManifestNo(String manifestNo) async {
    try {
      final samples = await _localService.getCachedSamplesByManifestNo(manifestNo);
      return Success(samples);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "SamplesRepository:getSamplesByManifestNo",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get a sample by its code
  Future<Result<DomainSample?>> getSampleByCode(String sampleCode) async {
    try {
      final sample = await _localService.getSampleByCode(sampleCode);
      return Success(sample);
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "SamplesRepository:getSampleByCode",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
