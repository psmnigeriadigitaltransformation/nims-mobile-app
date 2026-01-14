import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/models/movement_category.dart';
import 'package:nims_mobile_app/features/auth/data/providers.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/dashboard_screen_state.dart';
import 'package:nims_mobile_app/features/facilities/data/model/facility_type.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';
import 'package:nims_mobile_app/features/facilities/presentation/ui/model/facilities_screen_state.dart';

import '../../../../core/domain/mappers/typedefs.dart';
import '../../../../core/utils/result.dart';

class DashboardScreenStateNotifier
    extends AutoDisposeAsyncNotifier<DashboardScreenState> {
  @override
  Future<DashboardScreenState> build() async {
    return _fetchData();
  }

  Future<DashboardScreenState> _fetchData() async {
    final movementsRepository = ref.read(movementTypesRepositoryProvider);
    final authRepository = ref.read(authRepositoryProvider);

    final shipmentRoutes = await ref
        .read(shipmentRouteRepositoryProvider)
        .searchShipmentRoutes("");

    final movementTypesResult = await movementsRepository.getMovementTypes(
      false,
    );
    final user = await authRepository.getUser();

    developer.log("user: $user", name: "DashboardScreenStateNotifier:build");
    developer.log("movementTypesResult: $movementTypesResult", name: "DashboardScreenStateNotifier:build");
    developer.log("shipmentRoutes: $shipmentRoutes", name: "DashboardScreenStateNotifier:build");

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
      );
    } else {
      throw Exception("Something went wrong or an error occurred!");
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData());
  }
}
