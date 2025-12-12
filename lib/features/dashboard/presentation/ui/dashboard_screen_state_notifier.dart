import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
import 'package:projects/core/domain/models/movement_category.dart';
import 'package:projects/features/auth/data/providers.dart';
import 'package:projects/features/dashboard/presentation/ui/model/dashboard_screen_state.dart';
import 'package:projects/features/facilities/data/model/facility_type.dart';
import 'package:projects/features/facilities/data/providers.dart';
import 'package:projects/features/facilities/presentation/ui/model/facilities_screen_state.dart';

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

    final movementTypesResult = await movementsRepository.getMovementTypes(
      false,
    );
    final user = await authRepository.getUser();

    switch (movementTypesResult) {
      case Success(payload: final payload):
        return DashboardScreenState(
          userFullName: "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
          userRole: user?.role ?? "",
          userId: user?.userId ?? "",
          deviceSerialNo: user?.deviceSerialNo ?? "",
          specimensMovementTypes: payload
              .where(
                (movementType) =>
                    movementType.category == MovementTypeCategory.specimen.name,
              )
              .toList(),
          resultsMovementTypes: payload
              .where(
                (movementType) =>
                    movementType.category == MovementTypeCategory.result.name,
              )
              .toList(),
        );

      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData());
  }
}
