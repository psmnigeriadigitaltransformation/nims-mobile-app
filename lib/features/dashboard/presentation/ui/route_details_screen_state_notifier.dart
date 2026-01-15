import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/route_details_screen_state.dart';

import '../../../../core/services/providers.dart';

class RouteDetailsScreenStateNotifier
    extends FamilyAsyncNotifier<RouteDetailsScreenState, ShipmentRoute> {
  @override
  Future<RouteDetailsScreenState> build(ShipmentRoute arg) async {
    return _fetchDetails(arg);
  }

  Future<RouteDetailsScreenState> _fetchDetails(ShipmentRoute route) async {
    final localService = ref.read(nimsLocalServiceProvider);

    // Fetch shipments by routeNo
    final shipments = await localService.getCachedShipmentsByRouteNo(
      route.routeNo,
    );

    // Fetch approvals by routeNo
    final approvals = await localService.getCachedApprovalsByRouteNo(
      route.routeNo,
    );

    // Separate pickup and delivery approvals
    Approval? pickupApproval;
    Approval? deliveryApproval;

    for (final approval in approvals) {
      if (approval.approvalType.toLowerCase() == 'pickup') {
        pickupApproval = approval;
      } else if (approval.approvalType.toLowerCase() == 'delivery') {
        deliveryApproval = approval;
      }
    }

    return RouteDetailsScreenState(
      route: route,
      shipments: shipments,
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
