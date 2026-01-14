import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/sample_types_response.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class ManifestRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  ManifestRepository(this._apiService, this._localService);

  Future<Result<bool>> saveManifest(
    DomainManifest manifest,
    List<DomainSample> samples,
  ) async {
    try {
      await _localService.cacheManifest(manifest, samples);
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
}
