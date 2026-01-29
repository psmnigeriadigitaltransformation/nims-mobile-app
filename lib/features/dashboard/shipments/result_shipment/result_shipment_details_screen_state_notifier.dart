import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/result_shipment/result_shipment_details_screen_state.dart';

import '../../../../core/services/providers.dart';

class ResultShipmentDetailsScreenStateNotifier
    extends FamilyAsyncNotifier<ResultShipmentDetailsScreenState, ResultShipmentDetailsParams> {
  @override
  Future<ResultShipmentDetailsScreenState> build(ResultShipmentDetailsParams arg) async {
    return _fetchDetails(arg);
  }

  Future<ResultShipmentDetailsScreenState> _fetchDetails(ResultShipmentDetailsParams params) async {
    final localService = ref.read(nimsLocalServiceProvider);
    final shipment = params.shipment;
    final sampleCodes = params.sampleCodes;

    List<LabResult> results = [];

    // First try to fetch results by routeNo (results are linked via route_no after approval)
    results = await localService.getPickedResultsForRoute(shipment.routeNo);

    // If no results found by route and we have sample codes, fetch by sample codes
    if (results.isEmpty && sampleCodes.isNotEmpty) {
      results = await localService.getResultsBySampleCodes(sampleCodes);
    }

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
      if (approval.approvalType.toLowerCase().contains('result_pickup')) {
        pickupApproval = approval;
      } else if (approval.approvalType.toLowerCase().contains('result_delivery')) {
        deliveryApproval = approval;
      }
    }

    return ResultShipmentDetailsScreenState(
      shipment: shipment,
      results: results,
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
