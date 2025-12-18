import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';
import 'package:projects/core/services/remote/models/sample_types_response.dart';
import 'package:projects/core/utils/result.dart';
import 'package:projects/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class SamplesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  SamplesRepository(this._apiService, this._localService);

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
}
