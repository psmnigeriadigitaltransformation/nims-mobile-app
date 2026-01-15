import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/features/manifests/presentation/ui/model/manifests_screen_state.dart';

import '../../../../core/utils/result.dart';

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
    switch (result) {
      case Success(payload: final payload):
        return ManifestsScreenState(manifests: payload);
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
    final result = await ref
        .read(manifestRepositoryProvider)
        .deleteManifest(manifestNo);
    switch (result) {
      case Success():
        // Refresh the list after deletion
        state = await AsyncValue.guard(() => _fetchData(""));
      case Error(message: final m):
        throw Exception(m);
    }
  }
}
