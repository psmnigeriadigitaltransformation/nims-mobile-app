import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../../../core/domain/models/facility.dart';
import '../../../../../core/domain/models/movement_type.dart';
import '../../../../../core/domain/models/shipment_route.dart';
import '../../../../../core/ui/model/model/alert.dart';

part 'dashboard_screen_state.freezed.dart';

@freezed
class DashboardScreenState with _$DashboardScreenState {
  const factory DashboardScreenState({
    required String userFullName,
    required String userRole,
    required String userId,
    required String deviceSerialNo,
    required List<DomainMovementType> specimensMovementTypes,
    required List<DomainMovementType> resultsMovementTypes,
    @Default([]) List<DomainShipmentRoute> shipmentRoutes
  }) = _DashboardScreenStatee;

  // factory DashboardScreenState.initial() => const DashboardScreenState(
  //   userFullName: "",
  //   userRole: "",
  //   userId: "",
  //   deviceSerialNo: "",
  //   specimensMovementTypes: [],
  //   resultsMovementTypes: [],
  // );
}
