import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
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
    final fRepository = ref.read(facilitiesRepositoryProvider);
    final sRepository = ref.read(samplesRepositoryProvider);
    final lRepository = ref.read(locationsRepositoryProvider);
    final mRepository = ref.read(movementTypesRepositoryProvider);

    final result = await fRepository.getFacilities();
    await sRepository.getSampleTypes();
    await lRepository.getLocations();
    await mRepository.getMovementTypes();

    // Debugging
    // final samplesRepo = ref.read(samplesRepositoryProvider);
    // await samplesRepo.getSampleTypes();
    //
    // final locationsRepo = ref.read(locationsRepositoryProvider);
    // await locationsRepo.getLocations();
    //
    // final movementsRepo = ref.read(movementTypesRepositoryProvider);
    // await movementsRepo.getMovementTypes();

    switch (result) {
      case Success(payload: final p):
        return FacilitiesScreenState(
          geneXpertFacilities: p.data?.genexpertList ?? [],
          hubFacilities: p.data?.hubList ?? [],
          pcrFacilities: p.data?.pcrList ?? [],
          spokeFacilities: p.data?.spokeList ?? [],
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
