import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../../../../dashboard/providers.dart';
import '../model/delivery_approval_screen_state.dart';

class DeliveryApprovalScreenStateNotifier
    extends AutoDisposeFamilyNotifier<
        DeliveryApprovalScreenState,
        ({
          DomainMovementType movementType,
          DomainFacility destinationFacility,
          List<DomainShipment> shipments,
          String routeNo,
        })> {
  @override
  DeliveryApprovalScreenState build(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      List<DomainShipment> shipments,
      String routeNo,
    }) param,
  ) {
    return _loadData(param);
  }

  _loadData(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      List<DomainShipment> shipments,
      String routeNo,
    }) param,
  ) {
    return DeliveryApprovalScreenState(
      movementType: param.movementType,
      destinationFacility: param.destinationFacility,
      shipments: param.shipments,
      routeNo: param.routeNo,
    );
  }

  onUpdateDeliveryTemperature(String temperature) {
    state = state.copyWith(deliveryTemperature: temperature);
  }

  onUpdateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  onUpdateDesignation(String designation) {
    state = state.copyWith(designation: designation);
  }

  onUpdateSignature(String signature) {
    state = state.copyWith(signature: signature);
  }

  onUpdatePhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  Future<void> refreshState() async {
    state = _loadData(arg);
  }

  Future<void> onApproveDelivery() async {
    state = state.copyWith(isSavingDelivery: true);

    final localService = ref.read(nimsLocalServiceProvider);
    final lsp = await localService.getFirstCachedLsp();

    // Extract etoken_serial from the first shipment's manifest_no
    // Format: {LSP}-{etoken_serial} -> e.g., "LSP1-001" -> "001"
    final firstManifestNo = state.shipments.first.manifestNo;
    final manifestParts = firstManifestNo.split('-');
    final etokenSerial = manifestParts.length > 1 ? manifestParts.sublist(1).join('-') : firstManifestNo;

    // Generate approval_no with -DL suffix for delivery approval
    final approvalNo = '${lsp?.display ?? "UNKNOWN"}-AP-$etokenSerial-DL';

    final deliveryApproval = DomainApproval(
      approvalNo: approvalNo,
      routeNo: state.routeNo,
      approvalType: 'delivery',
      fullname: state.fullName,
      phone: state.phoneNumber,
      designation: state.designation,
      signature: state.signature,
      approvalDate: DateTime.now().toIso8601String(),
    );

    final result = await ref
        .read(shipmentsRepositoryProvider)
        .saveDeliveryApproval(state.shipments, deliveryApproval, state.routeNo);

    switch (result) {
      case Success<bool>():
        // No etoken to delete - approval reuses etoken_serial from manifest
        // Update delivery_date on all shipments
        final deliveryDate = DateTime.now().toIso8601String();
        for (final shipment in state.shipments) {
          await localService.updateShipmentDeliveryDate(shipment.shipmentNo, deliveryDate);
        }
        developer.log(
          "Delivery approval saved successfully",
          name: "DeliveryApprovalScreenStateNotifier:onApproveDelivery",
        );
        // Invalidate all relevant providers to refresh data
        ref.invalidate(dashboardScreenStateNotifierProvider);
        ref.invalidate(routesScreenStateNotifierProvider);
        // Invalidate route details for this specific route
        ref.invalidate(routeDetailsScreenStateNotifierProvider);
        state = state.copyWith(
          showSuccessScreen: true,
          isSavingDelivery: false,
        );
      case Error<bool>():
        developer.log(
          "Failed to save delivery approval: ${result.message}",
          name: "DeliveryApprovalScreenStateNotifier:onApproveDelivery",
        );
        state = state.copyWith(
          alert: Alert(show: true, message: result.message),
          isSavingDelivery: false,
        );
    }
  }

  onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }
}
