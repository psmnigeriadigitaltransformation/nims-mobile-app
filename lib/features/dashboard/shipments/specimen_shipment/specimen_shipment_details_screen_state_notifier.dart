import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/specimen_shipment/specimen_shipment_details_screen_state.dart';

import '../../../../core/services/providers.dart';

class ShipmentDetailsScreenStateNotifier
    extends FamilyAsyncNotifier<SpecimenShipmentDetailsScreenState, Shipment> {
  @override
  Future<SpecimenShipmentDetailsScreenState> build(Shipment arg) async {
    return _fetchDetails(arg);
  }

  Future<SpecimenShipmentDetailsScreenState> _fetchDetails(Shipment shipment) async {
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

    // Separate shipment_pickup and shipment_delivery approvals
    Approval? pickupApproval;
    Approval? deliveryApproval;

    for (final approval in approvals) {
      if (approval.approvalType.toLowerCase().contains('specimen_pickup')) {
        pickupApproval = approval;
      } else if (approval.approvalType.toLowerCase().contains('specimen_delivery')) {
        deliveryApproval = approval;
      }
    }

    return SpecimenShipmentDetailsScreenState(
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
