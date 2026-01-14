import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/facilities/data/model/facility_type.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';
import 'package:nims_mobile_app/features/facilities/presentation/ui/model/facilities_screen_state.dart';

import '../../../../core/utils/result.dart';

class FacilitiesScreenStateNotifier
    extends AutoDisposeAsyncNotifier<FacilitiesScreenState> {
  @override
  Future<FacilitiesScreenState> build() async {
    return _fetchData("");
  }

  Future<FacilitiesScreenState> _fetchData(String searchQuery) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final result = await facilitiesRepository.getFacilities(false);
    switch (result) {
      case Success(payload: final payload):
        return FacilitiesScreenState(
          geneXpertFacilities: payload
              .where(
                (facility) =>
                    facility.type == FacilityType.genexpert.name &&
                    facility.facilityName!.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ),
              )
              .toList(),
          hubFacilities: payload
              .where(
                (facility) =>
                    facility.type == FacilityType.hub.name &&
                    facility.facilityName!.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ),
              )
              .toList(),
          pcrFacilities: payload
              .where(
                (facility) =>
                    facility.type == FacilityType.pcr.name &&
                    facility.facilityName!.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ),
              )
              .toList(),
          spokeFacilities: payload
              .where(
                (facility) =>
                    facility.type == FacilityType.spoke.name &&
                    facility.facilityName!.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ),
              )
              .toList(),
        );

      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshFacilities() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData(""));
  }

  Future<void> filterFacilities(String query) async {
    state = await AsyncValue.guard<FacilitiesScreenState>(
      () => _fetchData(query),
    );
  }
}
