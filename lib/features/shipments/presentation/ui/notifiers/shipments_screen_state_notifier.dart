import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/models/shipments_screen_state.dart';

import '../../../../../core/utils/result.dart';

class ShipmentsScreenStateNotifier extends AutoDisposeAsyncNotifier<ShipmentsScreenState> {
  @override
  Future<ShipmentsScreenState> build() async {
    return _fetchData("");
  }

  Future<ShipmentsScreenState> _fetchData(String searchQuery) async {
    final result = await ref
        .read(shipmentsRepositoryProvider)
        .searchShipments(searchQuery);
    switch (result) {
      case Success(payload: final payload):
        return ShipmentsScreenState(shipments: payload);
      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshShipments() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData(""));
  }

  Future<void> filterShipments(String query) async {
    state = await AsyncValue.guard<ShipmentsScreenState>(
      () => _fetchData(query),
    );
  }
}
