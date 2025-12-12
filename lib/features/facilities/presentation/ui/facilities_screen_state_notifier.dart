import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/features/facilities/data/model/facility_type.dart';
import 'package:projects/features/facilities/data/providers.dart';
import 'package:projects/features/facilities/presentation/ui/model/facilities_screen_state.dart';

import '../../../../core/utils/result.dart';

class FacilitiesScreenStateNotifier
    extends AutoDisposeAsyncNotifier<FacilitiesScreenState> {
  @override
  Future<FacilitiesScreenState> build() async {
    return _fetchData();
  }

  Future<FacilitiesScreenState> _fetchData() async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final result = await facilitiesRepository.getFacilities(false);
    switch (result) {
      case Success(payload: final payload):
        return FacilitiesScreenState(
          geneXpertFacilities: payload.where((facility) => facility.type == FacilityType.genexpert.name).toList(),
          hubFacilities: payload.where((facility) => facility.type == FacilityType.hub.name).toList(),
          pcrFacilities: payload.where((facility) => facility.type == FacilityType.pcr.name).toList(),
          spokeFacilities: payload.where((facility) => facility.type == FacilityType.spoke.name).toList(),
        );

      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshFacilities() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData());
  }
}
