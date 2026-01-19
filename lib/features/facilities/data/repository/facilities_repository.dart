import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/core/services/remote/models/login_response.dart';
import 'package:nims_mobile_app/features/facilities/data/model/facility_type.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class FacilitiesRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  FacilitiesRepository(this._apiService, this._localService);

  Future<Result<List<DomainFacility>>> searchFacilities(String query) async {
    final facilities = await _localService.getCachedFacilitiesBySearchQuery(query);
    return Success(facilities);
  }

  Future<Result<List<DomainFacility>>> getFacilities(bool refresh) async {
    try {
      final cachedFacilities = await _localService.getCachedFacilities();
      if (cachedFacilities.isNotEmpty && !refresh) {
        return Success(cachedFacilities);
      } else {
        final user = await _localService.getCachedUser();
        if (user == null) {
          return Error<List<DomainFacility>>(
            "Request could not be completed! user not found",
          );
        }

        final result = await _apiService.getFacilities(riderId: user!.userId!);
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

            final facilityData = result.payload.data;
            if (facilityData == null) {
              return Error<List<DomainFacility>>("No facility available");
            }

            final domainSpokeFacilities = facilityData.spokeList
                ?.map((e) => e.toDomain(FacilityType.spoke.name))
                .toList();
            final domainPcrFacilities = facilityData.pcrList
                ?.map((e) => e.toDomain(FacilityType.pcr.name))
                .toList();
            final domainHubFacilities = facilityData.hubList
                ?.map((e) => e.toDomain(FacilityType.hub.name))
                .toList();
            final domainGeneXpertFacilities = facilityData.genexpertList
                ?.map((e) => e.toDomain(FacilityType.genexpert.name))
                .toList();

            final allFacilities = [
              ...?domainSpokeFacilities,
              ...?domainPcrFacilities,
              ...?domainHubFacilities,
              ...?domainGeneXpertFacilities,
            ];

            // Deduplicate facilities by facilityId
            final seenIds = <int>{};
            final combinedDomainFacilities = allFacilities.where((facility) {
              final id = facility.facilityId;
              if (id == null || seenIds.contains(id)) {
                return false;
              }
              seenIds.add(id);
              return true;
            }).toList();
            await _localService.cacheFacilities(combinedDomainFacilities);
            if (combinedDomainFacilities.isEmpty) {
              Error<List<DomainFacility>>("No facility available");
            }
            return Success(combinedDomainFacilities);
          case Error<FacilitiesResponse>():
            developer.log(
              "error: ${result.message}",
              name: "FacilitiesRepository:getFacilities",
            );
            return Error(result.message);
        }
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "FacilitiesRepository:getFacilities",
      );
      return Error<List<DomainFacility>>(
        e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
