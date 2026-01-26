import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/manifest.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/manifest_details_screen_state.dart';

import '../../../../../core/services/providers.dart';

class ManifestDetailsScreenStateNotifier
    extends FamilyAsyncNotifier<ManifestDetailsScreenState, Manifest> {
  @override
  Future<ManifestDetailsScreenState> build(Manifest arg) async {
    return _fetchDetails(arg);
  }

  Future<ManifestDetailsScreenState> _fetchDetails(Manifest manifest) async {
    final localService = ref.read(nimsLocalServiceProvider);

    // Fetch samples by manifestNo
    final samples = await localService.getCachedSamplesByManifestNo(
      manifest.manifestNo,
    );

    return ManifestDetailsScreenState(
      manifest: manifest,
      samples: samples,
      isLoading: false,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchDetails(arg));
  }
}
