import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/routes_screen_state.dart';

import '../../../../core/domain/models/shipment_route.dart';

class RoutesScreenStateNotifier extends AutoDisposeAsyncNotifier<RoutesScreenState> {
  @override
  Future<RoutesScreenState> build() async {
    return _loadRoutes();
  }

  Future<RoutesScreenState> _loadRoutes() async {
    final result = await ref
        .read(shipmentRouteRepositoryProvider)
        .searchShipmentRoutes("");

    if (result is Success<List<ShipmentRoute>>) {
      return RoutesScreenState(
        routes: result.payload,
        filteredRoutes: result.payload,
        isLoading: false,
      );
    } else {
      throw Exception("Failed to load routes");
    }
  }

  void search(String query) {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    if (query.isEmpty) {
      state = AsyncData(currentState.copyWith(
        filteredRoutes: currentState.routes,
        searchQuery: query,
      ));
    } else {
      final lowerQuery = query.toLowerCase();
      final filtered = currentState.routes.where((route) {
        return route.routeNo.toLowerCase().contains(lowerQuery) ||
            route.originFacilityName.toLowerCase().contains(lowerQuery) ||
            route.destinationFacilityName.toLowerCase().contains(lowerQuery) ||
            route.lspCode.toLowerCase().contains(lowerQuery);
      }).toList();

      state = AsyncData(currentState.copyWith(
        filteredRoutes: filtered,
        searchQuery: query,
      ));
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadRoutes());
  }
}
