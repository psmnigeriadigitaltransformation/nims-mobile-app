import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';
import 'package:projects/core/services/remote/models/locations_response.dart';
import 'package:projects/core/utils/result.dart';
import 'package:projects/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class LocationsRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  LocationsRepository(this._apiService, this._localService);

  Future<Result<LocationResponse>> getLocations() async {
    try {
      final user = await _localService.getCachedUser();
      if (user != null) {
        developer.log("user: $user", name: "LocationsRepository:getLocations");
        final result = await _apiService.getLocations();
        developer.log(
          "result: $result",
          name: "LocationsRepository:getLocations",
        );
        switch (result) {
          case Success<LocationResponse>(payload: final data):
            developer.log(
              "data: $data",
              name: "LocationsRepository:getLocations",
            );
            final locations = result.payload.data;
            if (locations != null) {
              await _localService.updateCachedLocations(
                locations.map((location) => location.toDomain()).toList(),
              );
            }
            break;
          case Error<LocationResponse>():
            break;
        }
        return result;
      } else {
        return Error<LocationResponse>("Fetch failed! please try again");
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "LocationsRepository:getLocations",
      );
      return Error<LocationResponse>(
        e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
