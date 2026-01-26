import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/result_shipment_route_details_screen_state.dart';

import '../../../../core/services/providers.dart';

class ResultShipmentRouteDetailsScreenStateNotifier
    extends FamilyAsyncNotifier<ResultShipmentRouteDetailsScreenState, ShipmentRoute> {
  @override
  Future<ResultShipmentRouteDetailsScreenState> build(ShipmentRoute arg) async {
    return _fetchDetails(arg);
  }

  Future<ResultShipmentRouteDetailsScreenState> _fetchDetails(ShipmentRoute route) async {
    final localService = ref.read(nimsLocalServiceProvider);

    // Fetch shipment by routeNo
    final shipment = await localService.getCachedShipmentByRouteNo(
      route.routeNo,
    );

    if (shipment == null) {
      throw Exception('No shipment found for route ${route.routeNo}');
    }

    // Fetch approvals by routeNo
    final approvals = await localService.getCachedApprovalsByRouteNo(
      route.routeNo,
    );

    // Separate pickup and delivery approvals
    Approval? pickupApproval;
    Approval? deliveryApproval;

    for (final approval in approvals) {
      if (approval.approvalType.toLowerCase().contains('pickup')) {
        pickupApproval = approval;
      } else if (approval.approvalType.toLowerCase().contains('delivery')) {
        deliveryApproval = approval;
      }
    }

    return ResultShipmentRouteDetailsScreenState(
      route: route,
      shipment: shipment,
      pickupApproval: pickupApproval,
      deliveryApproval: deliveryApproval,
      isLoading: false,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchDetails(arg));
  }
}
