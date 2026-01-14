import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';

import '../../../../../core/utils/result.dart';

class ResultPickUpScreenStateNotifier
    extends AutoDisposeFamilyAsyncNotifier<ResultPickUpScreenState, DomainMovementType> {
  Future<ResultPickUpScreenState> _fetchData(DomainMovementType movementType) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final facilitiesResult = await facilitiesRepository.getFacilities(false);

    switch (facilitiesResult) {
      case Success(payload: final payload):
        return ResultPickUpScreenState(
          facilities: payload
              .where(
                (facility) =>
            movementType.origin?.toLowerCase().contains(
              facility.type?.toLowerCase() ?? "",
            ) ??
                false,
          )
              .toList(),
          movementType: movementType,
        );

      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchData(arg),
    );
  }

  @override
  FutureOr<ResultPickUpScreenState> build(DomainMovementType arg) {
    return _fetchData(arg);
  }
}
