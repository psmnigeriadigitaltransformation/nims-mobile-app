import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
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

  Future<Result<SampleTypesResponse>> getSampleTypes() async {
    try {
      final user = await _localService.getCachedUser();
      if (user != null) {
        developer.log("user: $user", name: "SamplesRepository:getSampleTypes");
        final result = await _apiService.getSampleTypes(riderId: user.userId!);
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
            if (sampleTypes != null) {
              await _localService.updateCachedSampleTypes(
                sampleTypes.map((sampleType) => sampleType.toDomain()).toList(),
              );
            }
            break;
          case Error<SampleTypesResponse>():
            break;
        }
        return result;
      } else {
        return Error<SampleTypesResponse>("Fetch failed! please try again");
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "SamplesRepository:getSampleTypes",
      );
      return Error<SampleTypesResponse>(
        e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
