import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/features/facilities/data/providers.dart';

import '../../../../../core/utils/result.dart';
import '../model/add_new_manifest_screen_state.dart';
import '../model/manifests_screen_state.dart';

// part 'result_pickup_screen_state_provider.g.dart';

class AddNewManifestScreenStateNotifier
    extends AutoDisposeFamilyAsyncNotifier<AddNewManifestScreenState, String> {
  @override
  FutureOr<AddNewManifestScreenState> build(String arg) {
    return _fetchData(arg);
  }

  Future<AddNewManifestScreenState> _fetchData(String movement) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final sampleTypesRepository = ref.read(samplesRepositoryProvider);

    final facilitiesResult = await facilitiesRepository.getFacilities(false);
    final sampleTypesResult = await sampleTypesRepository.getSampleTypes(false);

    if (facilitiesResult is Success && sampleTypesResult is Success) {
      return AddNewManifestScreenState(
        facilities: (facilitiesResult as Success<List<DomainFacility>>).payload
            .where(
              (facility) =>
                  // clarification needed: should all facilities be shown or only
                  // facilities matching the movement type destination?
              movement.split("→").last.toLowerCase().contains(facility.type?.toLowerCase() ?? "")
              // true
            )
            .toList(),
        sampleTypes:
            (sampleTypesResult as Success<List<DomainSampleType>>).payload,
        movement: movement,
      );
    } else {
      throw Exception("Something went wrong or an error occurred");
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData(arg));
  }
}
