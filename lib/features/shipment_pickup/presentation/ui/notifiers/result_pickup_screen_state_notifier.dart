import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';
import 'package:nims_mobile_app/core/services/etoken/etoken_service.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/alert.dart';
import 'package:nims_mobile_app/features/dashboard/facilities/providers.dart';
import '../models/result_pickup_screen_state.dart';
import '../../../../../core/utils/result.dart' as result_util;

class ResultPickUpScreenStateNotifier
    extends AutoDisposeFamilyAsyncNotifier<ResultPickUpScreenState, MovementType> {
  Future<ResultPickUpScreenState> _fetchData(MovementType movementType) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final facilitiesResult = await facilitiesRepository.getFacilities(false);

    switch (facilitiesResult) {
      case result_util.Success(payload: final payload):
        // Filter facilities based on movement type origin
        final filteredFacilities = payload
            .where(
              (facility) =>
                  movementType.origin?.toLowerCase().contains(
                        facility.type?.toLowerCase() ?? "",
                      ) ??
                  false,
            )
            .toList();

        return ResultPickUpScreenState(
          facilities: filteredFacilities,
          movementType: movementType,
        );

      case result_util.Error(message: final m):
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
  FutureOr<ResultPickUpScreenState> build(MovementType arg) {
    return _fetchData(arg);
  }

  /// Helper to group results by manifest number
  Map<String, List<LabResult>> _groupResultsByManifest(List<DomainResult> results) {
    final grouped = <String, List<LabResult>>{};
    for (final result in results) {
      grouped.putIfAbsent(result.manifestNo, () => []).add(result);
    }
    return grouped;
  }

  // Selection methods
  Future<void> onSelectFacility(Facility facility) async {
    final currentData = state.valueOrNull;
    if (currentData == null) return;

    // Update state with selected facility and loading indicator
    state = AsyncData(currentData.copyWith(
      selectedFacility: facility,
      isLoadingResults: true,
      resultsByManifest: {},
      selectedResultCodes: {},
    ));

    try {
      final resultPickupRepo = ref.read(resultPickupRepositoryProvider);
      final facilityId = facility.facilityId?.toString() ?? "";

      final result = await resultPickupRepo.fetchFacilityResults(facilityId);

      final updatedData = state.valueOrNull;
      if (updatedData == null) return;

      switch (result) {
        case result_util.Success(payload: final results):
          final grouped = _groupResultsByManifest(results);
          state = AsyncData(updatedData.copyWith(
            isLoadingResults: false,
            resultsByManifest: grouped,
          ));
          developer.log(
            "Loaded ${results.length} results for facility ${facility.facilityName}",
            name: "ResultPickUpScreenStateNotifier:onSelectFacility",
          );
        case result_util.Error(message: final m):
          state = AsyncData(updatedData.copyWith(
            isLoadingResults: false,
            alert: Alert(show: true, message: m),
          ));
      }
    } catch (e, s) {
      developer.log(
        "Error fetching results: $e",
        name: "ResultPickUpScreenStateNotifier:onSelectFacility",
        error: e,
        stackTrace: s,
      );
      final updatedData = state.valueOrNull;
      if (updatedData != null) {
        state = AsyncData(updatedData.copyWith(
          isLoadingResults: false,
          alert: Alert(show: true, message: e.toString()),
        ));
      }
    }
  }

  void onToggleResultSelection(String sampleCode) {
    state.whenData((data) {
      // Check if the result is rejected - cannot select rejected results
      for (final manifestResults in data.resultsByManifest.values) {
        final result = manifestResults.where((r) => r.sampleCode == sampleCode).firstOrNull;
        if (result != null && result.isRejected == 1) {
          // Cannot select rejected results
          return;
        }
      }

      final newSelection = Set<String>.from(data.selectedResultCodes);
      if (newSelection.contains(sampleCode)) {
        newSelection.remove(sampleCode);
      } else {
        newSelection.add(sampleCode);
      }
      state = AsyncData(data.copyWith(selectedResultCodes: newSelection));
    });
  }

  void onSelectAll() {
    state.whenData((data) {
      // Only select non-rejected results
      state = AsyncData(data.copyWith(selectedResultCodes: data.selectableSampleCodes));
    });
  }

  void onUnselectAll() {
    state.whenData((data) {
      state = AsyncData(data.copyWith(selectedResultCodes: {}));
    });
  }

  /// Reject a result
  Future<void> onRejectResult(String sampleCode, String reason) async {
    final currentData = state.valueOrNull;
    if (currentData == null) return;

    // Set loading state for this result
    state = AsyncData(currentData.copyWith(
      loadingResultCodes: {...currentData.loadingResultCodes, sampleCode},
    ));

    try {
      final resultPickupRepo = ref.read(resultPickupRepositoryProvider);
      final result = await resultPickupRepo.rejectResult(sampleCode, reason);

      switch (result) {
        case result_util.Success():
          // Refresh results to reflect the change
          final selectedFacility = currentData.selectedFacility;
          if (selectedFacility != null) {
            final facilityId = selectedFacility.facilityId?.toString() ?? "";
            final refreshResult = await resultPickupRepo.fetchFacilityResults(facilityId);

            final updatedData = state.valueOrNull;
            if (updatedData == null) return;

            switch (refreshResult) {
              case result_util.Success(payload: final results):
                final grouped = _groupResultsByManifest(results);
                // Remove the rejected result from selection and clear loading state
                final newSelection = Set<String>.from(updatedData.selectedResultCodes);
                newSelection.remove(sampleCode);
                final newLoadingCodes = Set<String>.from(updatedData.loadingResultCodes);
                newLoadingCodes.remove(sampleCode);
                state = AsyncData(updatedData.copyWith(
                  resultsByManifest: grouped,
                  selectedResultCodes: newSelection,
                  loadingResultCodes: newLoadingCodes,
                ));
              case result_util.Error():
                // Just update the local state to mark as rejected
                _updateResultLocally(sampleCode, isRejected: true, rejectionSyncStatus: 'pending');
                _clearLoadingState(sampleCode);
            }
          } else {
            _clearLoadingState(sampleCode);
          }
        case result_util.Error(message: final m):
          _clearLoadingState(sampleCode);
          final latestData = state.valueOrNull;
          if (latestData != null) {
            state = AsyncData(latestData.copyWith(
              alert: Alert(show: true, message: m),
            ));
          }
      }
    } catch (e, s) {
      developer.log(
        "Error rejecting result: $e",
        name: "ResultPickUpScreenStateNotifier:onRejectResult",
        error: e,
        stackTrace: s,
      );
      _clearLoadingState(sampleCode);
      final latestData = state.valueOrNull;
      if (latestData != null) {
        state = AsyncData(latestData.copyWith(
          alert: Alert(show: true, message: e.toString()),
        ));
      }
    }
  }

  /// Accept a result (undo pending rejection)
  Future<void> onAcceptResult(String sampleCode) async {
    final currentData = state.valueOrNull;
    if (currentData == null) return;

    // Set loading state for this result
    state = AsyncData(currentData.copyWith(
      loadingResultCodes: {...currentData.loadingResultCodes, sampleCode},
    ));

    try {
      final resultPickupRepo = ref.read(resultPickupRepositoryProvider);
      final result = await resultPickupRepo.acceptResult(sampleCode);

      switch (result) {
        case result_util.Success():
          // Refresh results to reflect the change
          final selectedFacility = currentData.selectedFacility;
          if (selectedFacility != null) {
            final facilityId = selectedFacility.facilityId?.toString() ?? "";
            final refreshResult = await resultPickupRepo.fetchFacilityResults(facilityId);

            final updatedData = state.valueOrNull;
            if (updatedData == null) return;

            switch (refreshResult) {
              case result_util.Success(payload: final results):
                final grouped = _groupResultsByManifest(results);
                final newLoadingCodes = Set<String>.from(updatedData.loadingResultCodes);
                newLoadingCodes.remove(sampleCode);
                state = AsyncData(updatedData.copyWith(
                  resultsByManifest: grouped,
                  loadingResultCodes: newLoadingCodes,
                ));
              case result_util.Error():
                // Just update the local state to mark as not rejected
                _updateResultLocally(sampleCode, isRejected: false, rejectionSyncStatus: null);
                _clearLoadingState(sampleCode);
            }
          } else {
            _clearLoadingState(sampleCode);
          }
        case result_util.Error(message: final m):
          _clearLoadingState(sampleCode);
          final latestData = state.valueOrNull;
          if (latestData != null) {
            state = AsyncData(latestData.copyWith(
              alert: Alert(show: true, message: m),
            ));
          }
      }
    } catch (e, s) {
      developer.log(
        "Error accepting result: $e",
        name: "ResultPickUpScreenStateNotifier:onAcceptResult",
        error: e,
        stackTrace: s,
      );
      _clearLoadingState(sampleCode);
      final latestData = state.valueOrNull;
      if (latestData != null) {
        state = AsyncData(latestData.copyWith(
          alert: Alert(show: true, message: e.toString()),
        ));
      }
    }
  }

  /// Helper to clear loading state for a result
  void _clearLoadingState(String sampleCode) {
    state.whenData((data) {
      final newLoadingCodes = Set<String>.from(data.loadingResultCodes);
      newLoadingCodes.remove(sampleCode);
      state = AsyncData(data.copyWith(loadingResultCodes: newLoadingCodes));
    });
  }

  /// Helper to update a result's state locally in the UI
  void _updateResultLocally(String sampleCode, {required bool isRejected, String? rejectionSyncStatus}) {
    state.whenData((data) {
      final updatedGroups = <String, List<DomainResult>>{};
      for (final entry in data.resultsByManifest.entries) {
        updatedGroups[entry.key] = entry.value.map((r) {
          if (r.sampleCode == sampleCode) {
            return r.copyWith(
              isRejected: isRejected ? 1 : 0,
              rejectionSyncStatus: rejectionSyncStatus,
            );
          }
          return r;
        }).toList();
      }

      // Remove from selection if rejected
      var newSelection = data.selectedResultCodes;
      if (isRejected) {
        newSelection = Set<String>.from(data.selectedResultCodes)..remove(sampleCode);
      }

      state = AsyncData(data.copyWith(
        resultsByManifest: updatedGroups,
        selectedResultCodes: newSelection,
      ));
    });
  }

  // Input update methods
  void onUpdateTemperature(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(temperature: value));
    });
  }

  void onUpdateFullName(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(fullName: value));
    });
  }

  void onUpdatePhoneNumber(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(phoneNumber: value));
    });
  }

  void onUpdateDesignation(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(designation: value));
    });
  }

  void onUpdateSignature(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(signature: value));
    });
  }

  void onDismissAlertDialog() {
    state.whenData((data) {
      state = AsyncData(data.copyWith(alert: Alert(show: false, message: "")));
    });
  }
}
