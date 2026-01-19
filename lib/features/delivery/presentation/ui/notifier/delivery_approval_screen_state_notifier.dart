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

    // Get etoken for approval number
    final approvalEToken = await localService.getNextEToken();
    if (approvalEToken == null) {
      state = state.copyWith(
        isSavingDelivery: false,
        alert: Alert(show: true, message: "No eTokens available. Please download more eTokens."),
      );
      return;
    }

    final approvalNo = '${lsp?.display ?? "UNKNOWN"}-AP-${approvalEToken.serialNo}';

    final deliveryApproval = DomainApproval(
      approvalNo: approvalNo,
      routeNo: state.routeNo,
      approvalType: 'delivery',
      fullname: state.fullName,
      phone: state.phoneNumber,
      designation: state.designation,
      signature: state.signature,
    );

    final result = await ref
        .read(shipmentsRepositoryProvider)
        .saveDeliveryApproval(state.shipments, deliveryApproval, state.routeNo);

    switch (result) {
      case Success<bool>():
        // Delete used etoken after successful save
        await localService.deleteEToken(approvalEToken.etokenId!);
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
