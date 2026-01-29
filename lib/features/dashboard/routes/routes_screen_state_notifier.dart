import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/features/dashboard/routes/routes_screen_state.dart';

import '../../../core/domain/models/shipment_route.dart';

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
      final localService = ref.read(nimsLocalServiceProvider);

      // Fetch shipments for each route
      final routesWithShipments = <RouteWithShipments>[];
      for (final route in result.payload) {
        final shipments = await localService.getCachedShipmentsByRouteNo(route.routeNo);
        routesWithShipments.add(RouteWithShipments(
          route: route,
          shipments: shipments,
        ));
      }

      return RoutesScreenState(
        routes: routesWithShipments,
        filteredRoutes: routesWithShipments,
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
      final filtered = currentState.routes.where((routeWithShipments) {
        return routeWithShipments.routeNo.toLowerCase().contains(lowerQuery) ||
            routeWithShipments.originFacilityName.toLowerCase().contains(lowerQuery) ||
            routeWithShipments.destinationFacilityName.toLowerCase().contains(lowerQuery) ||
            routeWithShipments.lspCode.toLowerCase().contains(lowerQuery) ||
            (routeWithShipments.payloadType?.toLowerCase().contains(lowerQuery) ?? false);
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
