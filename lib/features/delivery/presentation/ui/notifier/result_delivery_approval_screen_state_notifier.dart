import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';

import '../../../../../core/utils/result.dart';
import '../model/result_delivery_approval_screen_state.dart';

class ResultDeliveryApprovalScreenStateNotifier
    extends AutoDisposeFamilyNotifier<
        ResultDeliveryApprovalScreenState,
        ({
          ShipmentRoute route,
          List<Shipment> shipments,
          Facility destinationFacility,
          List<String> sampleCodes,
        })> {
  @override
  ResultDeliveryApprovalScreenState build(
    ({
      ShipmentRoute route,
      List<Shipment> shipments,
      Facility destinationFacility,
      List<String> sampleCodes,
    }) param,
  ) {
    return ResultDeliveryApprovalScreenState(
      route: param.route,
      shipments: param.shipments,
      destinationFacility: param.destinationFacility,
      sampleCodes: param.sampleCodes,
    );
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

    // Get etoken for approval number
    final approvalEToken = await localService.getNextEToken();
    if (approvalEToken == null) {
      state = state.copyWith(
        isSubmitting: false,
        alert: Alert(show: true, message: "No eTokens available. Please download more eTokens."),
      );
      return;
    }

    final approvalNo = '${lsp?.display ?? "UNKNOWN"}-AP-${approvalEToken.serialNo}';

    final approval = DomainApproval(
      approvalNo: approvalNo,
      routeNo: state.route.routeNo,
      approvalType: 'result_delivery',
      fullname: state.fullName,
      phone: state.phoneNumber,
      designation: state.designation,
      signature: state.signature,
    );

    final result = await ref.read(resultDeliveryRepositoryProvider).saveResultDelivery(
      routeNo: state.route.routeNo,
      shipments: state.shipments,
      approval: approval,
      sampleCodes: state.sampleCodes,
    );

    switch (result) {
      case Success<bool>():
        // Delete used etoken after successful save
        await localService.deleteEToken(approvalEToken.etokenId!);
        developer.log(
          "Result delivery approval saved successfully",
          name: "ResultDeliveryApprovalScreenStateNotifier:onApproveDelivery",
        );
        state = state.copyWith(
          showSuccessScreen: true,
          isSubmitting: false,
        );
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
