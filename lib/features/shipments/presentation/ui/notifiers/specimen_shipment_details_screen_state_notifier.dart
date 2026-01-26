import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/models/shipment_details_screen_state.dart';

import '../../../../../core/services/providers.dart';

class ShipmentDetailsScreenStateNotifier
    extends FamilyAsyncNotifier<ShipmentDetailsScreenState, Shipment> {
  @override
  Future<ShipmentDetailsScreenState> build(Shipment arg) async {
    return _fetchDetails(arg);
  }

  Future<ShipmentDetailsScreenState> _fetchDetails(Shipment shipment) async {
    final localService = ref.read(nimsLocalServiceProvider);

    // Fetch samples by manifestNo
    final samples = await localService.getCachedSamplesByManifestNo(
      shipment.manifestNo,
    );

    // Fetch route by routeNo
    final route = await localService.getCachedRouteByRouteNo(shipment.routeNo);

    // Fetch approvals by routeNo
    final approvals = await localService.getCachedApprovalsByRouteNo(
      shipment.routeNo,
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

    return ShipmentDetailsScreenState(
      shipment: shipment,
      samples: samples,
      route: route,
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
