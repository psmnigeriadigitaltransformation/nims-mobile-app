import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/models/movement_category.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/alert.dart';
import 'package:nims_mobile_app/features/dashboard/dashboard_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/facilities/providers.dart';

import '../../core/domain/mappers/typedefs.dart';
import '../../core/utils/result.dart';

class DashboardScreenStateNotifier
    extends AutoDisposeAsyncNotifier<DashboardScreenState> {
  @override
  Future<DashboardScreenState> build() async {
    return _fetchData();
  }

  Future<DashboardScreenState> _fetchData() async {
    final movementsRepository = ref.read(movementTypesRepositoryProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final localService = ref.read(nimsLocalServiceProvider);

    final shipmentRoutes = await ref
        .read(shipmentRouteRepositoryProvider)
        .searchShipmentRoutes("");

    final movementTypesResult = await movementsRepository.getMovementTypes(
      false,
    );
    final user = await authRepository.getUser();
    final pendingCount = await localService.getTotalPendingCount();

    developer.log("user: $user", name: "DashboardScreenStateNotifier:build");
    developer.log("movementTypesResult: $movementTypesResult", name: "DashboardScreenStateNotifier:build");
    developer.log("shipmentRoutes: $shipmentRoutes", name: "DashboardScreenStateNotifier:build");
    developer.log("pendingCount: $pendingCount", name: "DashboardScreenStateNotifier:build");

    if (user != null &&
        movementTypesResult is Success<List<DomainMovementType>> &&
        shipmentRoutes is Success<List<DomainShipmentRoute>>) {
      return DashboardScreenState(
        userFullName: "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
        userRole: user?.role ?? "",
        userId: user?.userId ?? "",
        deviceSerialNo: user?.deviceSerialNo ?? "",
        specimensMovementTypes: movementTypesResult.payload
            .where(
              (movementType) =>
                  movementType.category == MovementTypeCategory.specimen.name,
            )
            .toList(),
        resultsMovementTypes: movementTypesResult.payload
            .where(
              (movementType) =>
                  movementType.category == MovementTypeCategory.result.name,
            )
            .toList(),
        shipmentRoutes: shipmentRoutes.payload,
        pendingSyncCount: pendingCount,
      );
    } else {
      throw Exception("Something went wrong or an error occurred!");
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData());
  }

  Future<void> search(String query) async {
    final currentState = state.value;
    if (currentState == null) return;

    if (query.isEmpty) {
      // Clear search results, show normal dashboard
      state = AsyncData(currentState.copyWith(
        isSearching: false,
        searchQuery: '',
        searchedFacilities: [],
        searchedManifests: [],
        searchedShipments: [],
        searchedRoutes: [],
      ));
      return;
    }

    // Run searches in parallel
    final results = await Future.wait([
      ref.read(facilitiesRepositoryProvider).searchFacilities(query),
      ref.read(manifestRepositoryProvider).searchManifests(query),
      ref.read(shipmentsRepositoryProvider).searchShipments(query),
      ref.read(shipmentRouteRepositoryProvider).searchShipmentRoutes(query),
    ]);

    final facilitiesResult = results[0] as Result<List<DomainFacility>>;
    final manifestsResult = results[1] as Result<List<DomainManifest>>;
    final shipmentsResult = results[2] as Result<List<DomainShipment>>;
    final routesResult = results[3] as Result<List<DomainShipmentRoute>>;

    state = AsyncData(currentState.copyWith(
      isSearching: true,
      searchQuery: query,
      searchedFacilities: facilitiesResult is Success<List<DomainFacility>>
          ? facilitiesResult.payload
          : [],
      searchedManifests: manifestsResult is Success<List<DomainManifest>>
          ? manifestsResult.payload
          : [],
      searchedShipments: shipmentsResult is Success<List<DomainShipment>>
          ? shipmentsResult.payload
          : [],
      searchedRoutes: routesResult is Success<List<DomainShipmentRoute>>
          ? routesResult.payload
          : [],
    ));
  }

  /// Trigger sync of pending records to the server
  Future<void> syncPendingRecords() async {
    final currentState = state.value;
    if (currentState == null) return;

    // Set syncing state
    state = AsyncData(currentState.copyWith(isSyncing: true));

    try {
      final syncService = ref.read(syncServiceProvider);
      await syncService.syncAll();

      // After sync, update pending count and last sync time
      final localService = ref.read(nimsLocalServiceProvider);
      final newPendingCount = await localService.getTotalPendingCount();

      final updatedState = state.value;
      if (updatedState != null) {
        state = AsyncData(updatedState.copyWith(
          isSyncing: false,
          pendingSyncCount: newPendingCount,
          lastSyncTime: DateTime.now(),
        ));
      }
    } catch (e, s) {
      developer.log(
        "Sync failed: $e",
        name: "DashboardScreenStateNotifier:syncPendingRecords",
        error: e,
        stackTrace: s,
      );
      final updatedState = state.value;
      if (updatedState != null) {
        state = AsyncData(updatedState.copyWith(
          isSyncing: false,
          syncAlert: Alert(
            show: true,
            message: "Sync failed: ${e.toString()}",
          ),
        ));
      }
    }
  }

  /// Dismiss the sync error alert
  void dismissSyncAlert() {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(currentState.copyWith(
      syncAlert: const Alert(show: false, message: ''),
    ));
  }

  /// Update only the pending count (useful when coming back to dashboard)
  Future<void> updatePendingCount() async {
    final currentState = state.value;
    if (currentState == null) return;

    final localService = ref.read(nimsLocalServiceProvider);
    final pendingCount = await localService.getTotalPendingCount();

    state = AsyncData(currentState.copyWith(pendingSyncCount: pendingCount));
  }
}
