import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
import 'package:projects/features/facilities/data/providers.dart';
import 'package:projects/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../model/shipments_screen_state.dart';

class ShipmentsScreenStateNotifier
    extends AutoDisposeFamilyAsyncNotifier<ShipmentsScreenState, String> {
  Future<ShipmentsScreenState> _fetchData(String movement) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final locationsRepository = ref.read(locationsRepositoryProvider);
    final facilitiesResult = await facilitiesRepository.getFacilities(false);
    final locationsResult = await locationsRepository.getLocations(false);

    if (facilitiesResult is Success && locationsResult is Success) {
      return ShipmentsScreenState(
        facilities: (facilitiesResult as Success<List<DomainFacility>>).payload
            .where(
              (facility) =>
                  !(facility.type?.contains(
                        movement.split("→").first.toLowerCase().trim(),
                      ) ??
                      true),
            )
            .toList(),
        locations: (locationsResult as Success<List<DomainLocation>>).payload.where(
              (location) =>
          !(location.location?.toLowerCase().contains(
            movement.split("→").first.toLowerCase().trim(),
          ) ??
              true),
        )
            .toList(),
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

  @override
  FutureOr<ShipmentsScreenState> build(String arg) {
    return _fetchData(arg);
  }
}
