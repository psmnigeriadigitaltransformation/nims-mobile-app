import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/core/services/etoken/etoken_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/alert.dart';

import '../../../core/utils/result.dart';
import '../../dashboard/providers.dart';
import '../../dashboard/routes/providers.dart';
import '../../dashboard/routes/result_shipment_route/providers.dart';
import 'result_delivery_approval_screen_state.dart';

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

    try {
      final localService = ref.read(nimsLocalServiceProvider);
      final eTokenService = ref.read(eTokenServiceProvider);
      final lsp = await localService.getFirstCachedLsp();

      // Get a fresh etoken for the approval (auto-downloads if needed)
      DomainETokenData approvalEToken;
      try {
        approvalEToken = await eTokenService.getNextEToken();
      } on NoETokensAvailableException catch (e) {
        state = state.copyWith(
          isSubmitting: false,
          alert: Alert(show: true, message: e.message),
        );
        return;
      }

      // Generate approval_no with -DL suffix for result_delivery approval
      final approvalNo =
          '${lsp?.display ?? "UNKNOWN"}-AP-${approvalEToken.serialNo}-DL';

      // Delete the approval etoken after use
      await eTokenService.deleteEToken(approvalEToken.etokenId!);

      final approval = DomainApproval(
        approvalNo: approvalNo,
        routeNo: state.route.routeNo,
        approvalType: 'result_delivery',
        fullname: state.fullName,
        phone: state.phoneNumber,
        designation: state.designation,
        signature: state.signature,
        latitude: ref.read(geoLocationServiceProvider).latitude,
        longitude: ref.read(geoLocationServiceProvider).longitude,
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
          // Invalidate all relevant providers to refresh data
          ref.invalidate(dashboardScreenStateNotifierProvider);
          ref.invalidate(routesScreenStateNotifierProvider);
          ref.invalidate(resultShipmentRouteDetailsScreenStateNotifierProvider);
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
    } catch (e, s) {
      developer.log(
        "Error approving result delivery: $e",
        name: "ResultDeliveryApprovalScreenStateNotifier:onApproveDelivery",
        error: e,
        stackTrace: s,
      );
      state = state.copyWith(
        isSubmitting: false,
        alert: Alert(show: true, message: e.toString()),
      );
    }
  }
}
