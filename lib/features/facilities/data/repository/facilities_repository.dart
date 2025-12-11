import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';
import 'package:projects/core/utils/result.dart';
import 'package:projects/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class FacilitiesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  FacilitiesRepository(this._apiService, this._localService);

  Future<Result<FacilitiesResponse>> getFacilities() async {
    try {
      final user = await _localService.getCachedUser();
      if (user != null) {
        developer.log(
          "user: $user",
          name: "FacilitiesRepository:getFacilities",
        );
        final result = await _apiService.getFacilities(riderId: user.userId!);
        developer.log(
          "result: $result",
          name: "FacilitiesRepository:getFacilities",
        );
        switch (result) {
          case Success<FacilitiesResponse>(payload: final data):
            developer.log(
              "data: $data",
              name: "FacilitiesRepository:getFacilities",
            );
            final facilities = result.payload.data;
            if (facilities != null) {
              final domainSpokeFacilities = facilities.spokeList
                  ?.map((e) => e.toDomain("spoke"))
                  .toList();
              final domainPcrFacilities = facilities.pcrList
                  ?.map((e) => e.toDomain("pcr"))
                  .toList();
              final domainHubFacilities = facilities.hubList
                  ?.map((e) => e.toDomain("hub"))
                  .toList();
              final domainGeneXpertFacilities = facilities.hubList
                  ?.map((e) => e.toDomain("genexpert"))
                  .toList();

              await _localService.updateCachedFacilities([
                ...?domainSpokeFacilities,
                ...?domainPcrFacilities,
                ...?domainHubFacilities,
                ...?domainGeneXpertFacilities,
              ]);
            }
            break;
          case Error<FacilitiesResponse>():
            break;
        }
        return result;
      } else {
        return Error<FacilitiesResponse>("Fetch failed! please try again");
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "FacilitiesRepository:getFacilities",
      );
      return Error<FacilitiesResponse>(
        e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
