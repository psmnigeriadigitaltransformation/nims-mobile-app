import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';

import '../../../../../core/utils/result.dart';
import '../model/result_delivery_approval_screen_state.dart';

class ResultDeliveryApprovalScreenStateNotifier
    extends
        AutoDisposeFamilyNotifier<
          ResultDeliveryApprovalScreenState,
          ({
            ShipmentRoute route,
          DomainShipment shipment,
          })
        > {
  @override
  ResultDeliveryApprovalScreenState build(
    ({ShipmentRoute route, DomainShipment shipment}) param,
  ) {
    // Load results asynchronously from local service
    _loadResults(param.route.routeNo);

    return ResultDeliveryApprovalScreenState(
      route: param.route,
      shipment: param.shipment,
    );
  }

  Future<void> _loadResults(String routeNo) async {
    final localService = ref.read(nimsLocalServiceProvider);
    final pickedResults = await localService.getPickedResultsForRoute(routeNo);
    state = state.copyWith(results: pickedResults);
  }

  void onUpdateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void onUpdatePhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void onUpdateDesignation(String designation) {
    state = state.copyWith(designation: designation);
  }

  void onUpdateSignature(String signature) {
    state = state.copyWith(signature: signature);
  }

  void onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }

  Future<void> onApproveDelivery() async {
    state = state.copyWith(isSubmitting: true);

    final localService = ref.read(nimsLocalServiceProvider);
    final lsp = await localService.getFirstCachedLsp();

    // Extract etoken_serial from the result shipment_no
    // Format: {LSP}-SH-{etoken_serial} -> e.g., "LSP1-SH-001" -> "001"
    final shipmentNo = state.shipment.shipmentNo;
    final shipmentParts = shipmentNo.split('-');
    // shipment_no format is {LSP}-SH-{etoken_serial}, so we need the part after "SH-"
    final etokenSerial = shipmentParts.length > 2
        ? shipmentParts.sublist(2).join('-')
        : shipmentNo;

    // Generate approval_no with -DL suffix for delivery approval
    final approvalNo = '${lsp?.display ?? "UNKNOWN"}-AP-$etokenSerial-DL';

    final approval = DomainApproval(
      approvalNo: approvalNo,
      routeNo: state.route.routeNo,
      approvalType: 'result_delivery',
      fullname: state.fullName,
      phone: state.phoneNumber,
      designation: state.designation,
      signature: state.signature,
      latitude: GeoLocationService().latitude,
      longitude: GeoLocationService().longitude,
      approvalDate: DateTime.now().toIso8601String(),
    );

    // Extract sample codes from results
    final sampleCodes = state.results.map((r) => r.sampleCode).toList();

    final result = await ref
        .read(resultDeliveryRepositoryProvider)
        .saveResultDelivery(
          routeNo: state.route.routeNo,
          shipment: state.shipment,
          approval: approval,
          sampleCodes: sampleCodes,
        );

    switch (result) {
      case Success<bool>():
        // No etoken to delete - approval reuses etoken_serial from specimen
        // Update delivery_date on all shipments
        final deliveryDate = DateTime.now().toIso8601String();
        await localService.updateShipmentDeliveryDate(
          state.shipment.shipmentNo,
          deliveryDate,
        );
        developer.log(
          "Result delivery approval saved successfully",
          name: "ResultDeliveryApprovalScreenStateNotifier:onApproveDelivery",
        );
        state = state.copyWith(showSuccessScreen: true, isSubmitting: false);
      case Error<bool>():
        developer.log(
          "Failed to save result delivery approval: ${result.message}",
          name: "ResultDeliveryApprovalScreenStateNotifier:onApproveDelivery",
        );
        state = state.copyWith(
          alert: Alert(show: true, message: result.message),
          isSubmitting: false,
        );
    }
  }
}
