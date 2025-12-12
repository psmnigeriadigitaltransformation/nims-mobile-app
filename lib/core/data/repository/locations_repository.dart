import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/locations_response.dart';
import 'package:projects/core/utils/result.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class LocationsRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  LocationsRepository(this._apiService, this._localService);

  Future<Result<List<DomainLocation>>> getLocations(bool refresh) async {
    try {
      final cachedLocations = await _localService.getCachedLocations();
      if (cachedLocations.isNotEmpty && !refresh) {
        return Success(cachedLocations);
      } else {
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
            if (locations == null || locations.isEmpty) {
              return Error("No location available");
            }
            final domainLocations = locations
                .map((location) => location.toDomain())
                .toList();
            await _localService.updateCachedLocations(domainLocations);
            return Success(domainLocations);
          case Error<LocationResponse>():
            developer.log(
              "error: ${result.message}",
              name: "LocationsRepository:getLocations",
            );
            return Error(result.message);
        }
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "LocationsRepository:getLocations",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
