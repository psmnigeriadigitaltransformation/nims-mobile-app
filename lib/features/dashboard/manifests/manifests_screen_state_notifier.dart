import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/alert.dart';
import 'package:nims_mobile_app/features/dashboard/manifests/manifests_screen_state.dart';

import '../../../core/utils/result.dart';

class ManifestsScreenStateNotifier
    extends AutoDisposeAsyncNotifier<ManifestsScreenState> {
  @override
  Future<ManifestsScreenState> build() async {
    return _fetchData("");
  }

  Future<ManifestsScreenState> _fetchData(String searchQuery) async {
    final result = await ref
        .read(manifestRepositoryProvider)
        .searchManifests(searchQuery);

    // Fetch shipped manifest statuses
    final shippedStatuses = await ref
        .read(nimsLocalServiceProvider)
        .getShippedManifestStatuses();

    switch (result) {
      case Success(payload: final payload):
        return ManifestsScreenState(
          manifests: payload,
          searchQuery: searchQuery,
          shippedManifestStatuses: shippedStatuses,
        );
      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshManifests() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData(""));
  }

  Future<void> filterManifests(String query) async {
    state = await AsyncValue.guard<ManifestsScreenState>(
      () => _fetchData(query),
    );
  }

  Future<void> deleteManifest(String manifestNo) async {
    // Set deleting state
    state = state.whenData(
      (data) => data.copyWith(isDeleting: true),
    );

    final result = await ref
        .read(manifestRepositoryProvider)
        .deleteManifest(manifestNo);

    switch (result) {
      case Success():
        // Refresh the list after deletion
        final currentQuery = state.valueOrNull?.searchQuery ?? "";
        state = await AsyncValue.guard(() => _fetchData(currentQuery));
      case Error(message: final m):
        // Show error alert instead of throwing
        state = state.whenData(
          (data) => data.copyWith(
            isDeleting: false,
            alert: Alert(show: true, message: m),
          ),
        );
    }
  }

  void dismissAlert() {
    state = state.whenData(
      (data) => data.copyWith(alert: null),
    );
  }
}
