import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/utils/list_extensions.dart';
import 'package:nims_mobile_app/features/dashboard/facilities/providers.dart';
import '../../../../core/ui/model/alert.dart';
import '../../../../core/utils/result.dart';
import 'select_manifests_screen_state.dart';

class SelectManifestsScreenStateNotifier
    extends
        AutoDisposeFamilyAsyncNotifier<
          SelectManifestsScreenState,
          ({DomainMovementType movementType})
        > {
  @override
  FutureOr<SelectManifestsScreenState> build(
    ({DomainMovementType movementType}) param,
  ) {
    return _loadData(param);
  }

  Future<SelectManifestsScreenState> _loadData(
    ({DomainMovementType movementType}) param,
  ) async {
    final facilitiesResult = await ref
        .read(facilitiesRepositoryProvider)
        .getFacilities(false);

    // Fetch shipped manifest statuses
    final shippedStatusesResult = await ref
        .read(manifestRepositoryProvider)
        .getShippedManifestStatuses();

    // Fetch current user
    final currentUser = await ref.read(authRepositoryProvider).getUser();

    Map<String, String> shippedStatuses = {};
    if (shippedStatusesResult is Success<Map<String, String>>) {
      shippedStatuses = shippedStatusesResult.payload;
    }

    switch (facilitiesResult) {
      case Success(payload: final payload):
        final originLower = param.movementType.origin?.toLowerCase() ?? "";
        developer.log(
          "Movement type origin: '${param.movementType.origin}' (lowercase: '$originLower')",
          name: "ManifestsScreenStateNotifier:_loadData",
        );
        developer.log(
          "All facilities count: ${payload.length}, types: ${payload.map((f) => f.type).toSet()}",
          name: "ManifestsScreenStateNotifier:_loadData",
        );
        final filteredFacilities = payload.where((facility) {
          final typeLower = facility.type?.toLowerCase() ?? "";
          // Check if origin contains type OR type contains origin
          // This handles cases like origin="Hub" matching type="hub"
          final matches =
              originLower == typeLower ||
              originLower.contains(typeLower) ||
              typeLower.contains(originLower);
          return matches;
        }).toList();
        developer.log(
          "Filtered facilities for origin '$originLower': ${filteredFacilities.length}",
          name: "ManifestsScreenStateNotifier:_loadData",
        );
        return SelectManifestsScreenState(
          facilities: filteredFacilities.distinctBy(
            (facility) => facility.facilityId,
          ),
          movementType: param.movementType,
          manifests: [],
          shippedManifestStatuses: shippedStatuses,
          currentUserId: currentUser?.userId,
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
      (data) => data.copyWith(
        selectedPickUpFacility: facility,
        selectedManifestIndices: [],
      ),
    );
    getFacilityManifests(facility);
  }

  getFacilityManifests(DomainFacility facility) async {
    try {
      state = state.whenData(
        (data) => data.copyWith(isFetchingManifests: true),
      );
      final manifestsRepository = ref.read(manifestRepositoryProvider);

      // Check if movement type origin is "Hub" to fetch from server
      final currentState = state.valueOrNull;
      final movementTypeOrigin = currentState?.movementType?.origin?.toLowerCase() ?? '';
      final isHubOrigin = movementTypeOrigin == 'hub';

      developer.log(
        "getFacilityManifests: origin='$movementTypeOrigin', isHub=$isHubOrigin",
        name: "SelectManifestsScreenStateNotifier:getFacilityManifests",
      );

      Result<List<DomainManifest>> manifestsResult;
      if (isHubOrigin) {
        // Fetch from server for Hub origin
        manifestsResult = await manifestsRepository.getHubManifestsAndSamples(
          facility.facilityId.toString(),
        );
      } else {
        // Fetch from local DB for non-Hub origin
        manifestsResult = await manifestsRepository.getFacilityManifests(
          facility,
        );
      }

      switch (manifestsResult) {
        case Success<List<DomainManifest>>(payload: final payload):
          // Filter manifests based on origin type
          // - Non-Hub origin: Only show manifests with non-empty userId
          // - Hub origin: Show all manifests (including hub-created ones with empty userId)
          final availableManifests = isHubOrigin
              ? payload
              : payload.where((manifest) => manifest.userId.isNotEmpty).toList();

          state = state.whenData(
            (data) => data.copyWith(
              manifests: availableManifests,
              isFetchingManifests: false,
            ),
          );
        case Error<List<DomainManifest>>(message: final m):
          state = state.whenData(
            (data) => data.copyWith(
              alert: Alert(show: true, message: m),
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

  Future<void> deleteManifest(String manifestNo, String originId) async {
    final result = await ref
        .read(manifestRepositoryProvider)
        .deleteManifest(manifestNo, originId);
    switch (result) {
      case Success():
        // Refresh the manifest list after deletion
        final facility = state.valueOrNull?.selectedPickUpFacility;
        if (facility != null) {
          getFacilityManifests(facility);
        }
      case Error(message: final m):
        state = state.whenData(
          (data) => data.copyWith(alert: Alert(show: true, message: m)),
        );
    }
  }
}
