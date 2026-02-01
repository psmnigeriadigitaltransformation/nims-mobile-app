import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/etoken/etoken_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/alert.dart';

import '../../../core/domain/mappers/typedefs.dart';
import '../../../core/utils/result.dart';
import '../../dashboard/providers.dart';
import '../../dashboard/routes/providers.dart';
import '../../dashboard/routes/specimen_shipment_route/providers.dart';
import 'specimen_delivery_approval_screen_state.dart';

class SpecimenDeliveryApprovalScreenStateNotifier
    extends
        AutoDisposeFamilyNotifier<
          SpecimenDeliveryApprovalScreenState,
          ({DomainShipmentRoute route, List<DomainShipment> shipments})
        > {
  @override
  SpecimenDeliveryApprovalScreenState build(
    ({DomainShipmentRoute route, List<DomainShipment> shipments}) param,
  ) {
    return _loadData(param);
  }

  _loadData(
    ({DomainShipmentRoute route, List<DomainShipment> shipments}) param,
  ) {
    return SpecimenDeliveryApprovalScreenState(
      route: param.route,
      shipments: param.shipments,
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
          isSavingDelivery: false,
          alert: Alert(show: true, message: e.message),
        );
        return;
      }

      // Generate approval_no with -DL suffix for specimen_delivery approval
      final approvalNo =
          '${lsp?.display ?? "UNKNOWN"}-AP-${approvalEToken.serialNo}-DL';

      // Delete the approval etoken after use
      await eTokenService.deleteEToken(approvalEToken.etokenId!);

      // Get destination_location_type from the shipments being delivered
      // All shipments in this group have the same destination_location_type
      final destinationLocationType = state.shipments.first.destinationLocationType;

      final deliveryApproval = DomainApproval(
        approvalNo: approvalNo,
        routeNo: state.route.routeNo,
        approvalType: 'specimen_delivery',
        fullname: state.fullName,
        phone: state.phoneNumber,
        designation: state.designation,
        signature: state.signature,
        latitude: ref.read(geoLocationServiceProvider).latitude,
        longitude: ref.read(geoLocationServiceProvider).longitude,
        approvalDate: DateTime.now().toIso8601String(),
        destinationLocationType: destinationLocationType,
      );

      final result = await ref
          .read(shipmentsRepositoryProvider)
          .saveDeliveryApproval(state.shipments, deliveryApproval, state.route.routeNo);

      switch (result) {
        case Success<bool>():
          // Update delivery_date on all shipments
          final deliveryDate = DateTime.now().toIso8601String();
          for (final shipment in state.shipments) {
            await localService.updateShipmentDeliveryDate(
              shipment.shipmentNo,
              deliveryDate,
            );
          }
          developer.log(
            "Delivery approval saved successfully",
            name: "SpecimenDeliveryApprovalScreenStateNotifier:onApproveDelivery",
          );
          // Invalidate all relevant providers to refresh data
          ref.invalidate(dashboardScreenStateNotifierProvider);
          ref.invalidate(routesScreenStateNotifierProvider);
          // Invalidate route details for this specific route
          ref.invalidate(specimenShipmentRouteDetailsScreenStateNotifierProvider);
          state = state.copyWith(
            showSuccessScreen: true,
            isSavingDelivery: false,
          );
        case Error<bool>():
          developer.log(
            "Failed to save specimen_delivery approval: ${result.message}",
            name: "SpecimenDeliveryApprovalScreenStateNotifier:onApproveDelivery",
          );
          state = state.copyWith(
            alert: Alert(show: true, message: result.message),
            isSavingDelivery: false,
          );
      }
    } catch (e, s) {
      developer.log(
        "Error approving delivery: $e",
        name: "SpecimenDeliveryApprovalScreenStateNotifier:onApproveDelivery",
        error: e,
        stackTrace: s,
      );
      state = state.copyWith(
        isSavingDelivery: false,
        alert: Alert(show: true, message: e.toString()),
      );
    }
  }

  onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }
}
