import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';
import '../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/utils/result.dart';
import '../model/manifests_screen_state.dart';

class ManifestsScreenStateNotifier
    extends
        AutoDisposeFamilyAsyncNotifier<
          ManifestsScreenState,
          ({DomainMovementType movementType})
        > {
  @override
  FutureOr<ManifestsScreenState> build(
    ({DomainMovementType movementType}) param,
  ) {
    return _loadData(param);
  }

  Future<ManifestsScreenState> _loadData(
    ({DomainMovementType movementType}) param,
  ) async {
    final facilitiesResult = await ref
        .read(facilitiesRepositoryProvider)
        .getFacilities(false);

    // Fetch shipped manifest statuses
    final shippedStatusesResult = await ref
        .read(manifestRepositoryProvider)
        .getShippedManifestStatuses();

    Map<String, String> shippedStatuses = {};
    if (shippedStatusesResult is Success<Map<String, String>>) {
      shippedStatuses = shippedStatusesResult.payload;
    }

    switch (facilitiesResult) {
      case Success(payload: final payload):
        return ManifestsScreenState(
          facilities: payload
              .where(
                (facility) =>
                    param.movementType.origin?.toLowerCase().contains(
                      facility.type?.toLowerCase() ?? "",
                    ) ??
                    false,
              )
              .toList(),
          movementType: param.movementType,
          manifests: [],
          shippedManifestStatuses: shippedStatuses,
        );

      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadData(arg));
  }

  Future<void> onSelectPickUpFacility(DomainFacility facility) async {
    state = state.whenData(
      (data) => data.copyWith(selectedPickUpFacility: facility, selectedManifestIndices: []),
    );
    getFacilityManifests(facility);
  }

  getFacilityManifests(DomainFacility facility) async {
    try {
      state = state.whenData(
        (data) => data.copyWith(isFetchingManifests: true),
      );
      final manifestsRepository = ref.read(manifestRepositoryProvider);
      final manifestsResult = await manifestsRepository.getFacilityManifests(
        facility,
      );

      switch (manifestsResult) {
        case Success<List<DomainManifest>>(payload: final payload):
          state = state.whenData(
            (data) =>
                data.copyWith(manifests: payload, isFetchingManifests: false),
          );
        case Error<List<DomainManifest>>():
          state = state.whenData(
            (data) => data.copyWith(
              alert: Alert(show: true, message: manifestsResult.message),
              isFetchingManifests: false,
            ),
          );
      }
    } catch (e) {
      state = state.whenData(
        (data) => data.copyWith(
          alert: Alert(show: true, message: e.toString()),
          isFetchingManifests: false,
        ),
      );
    }
  }

  void onToggleManifest(int index, bool isSelected) {
    state = state.whenData((data) {
      final updatedList = List<int>.from(data.selectedManifestIndices);

      if (isSelected) {
        updatedList.remove(index);
      } else {
        updatedList.add(index);
      }
      return data.copyWith(selectedManifestIndices: updatedList);
    });
  }

  void onSaveManifest() {
    final facility = state.valueOrNull?.selectedPickUpFacility;
    if (facility != null) {
      getFacilityManifests(facility);
    }
  }

  Future<void> deleteManifest(String manifestNo) async {
    final result = await ref
        .read(manifestRepositoryProvider)
        .deleteManifest(manifestNo);
    switch (result) {
      case Success():
        // Refresh the manifests list after deletion
        final facility = state.valueOrNull?.selectedPickUpFacility;
        if (facility != null) {
          getFacilityManifests(facility);
        }
      case Error(message: final m):
        state = state.whenData(
          (data) => data.copyWith(
            alert: Alert(show: true, message: m),
          ),
        );
    }
  }
}
