import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/features/facilities/data/providers.dart';

import '../../../../../core/utils/result.dart';
import '../model/manifests_screen_state.dart';

// part 'result_pickup_screen_state_provider.g.dart';

class ManifestsScreenStateNotifier
    extends AutoDisposeFamilyAsyncNotifier<ManifestsScreenState, String> {
  @override
  FutureOr<ManifestsScreenState> build(String arg) {
    return _fetchData(arg);
  }

  Future<ManifestsScreenState> _fetchData(String movement) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final facilitiesResult = await facilitiesRepository.getFacilities(false);

    switch (facilitiesResult) {
      case Success(payload: final payload):
        return ManifestsScreenState(
          facilities: payload
              .where(
                (facility) =>
                    facility.type?.toLowerCase().contains(
                      movement.split("→").first.toLowerCase().trim(),
                    ) ??
                    false,
              )
              .toList(),
          movement: movement,
        );

      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData(arg));
  }
}
