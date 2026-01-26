import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/etoken/etoken_service.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';
import 'package:nims_mobile_app/features/auth/data/providers.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../../../../dashboard/providers.dart';
import '../models/result_shipment_approval_screen_state.dart';

class ResultShipmentApprovalScreenStateNotifier extends AutoDisposeFamilyNotifier<
    ResultShipmentApprovalScreenState,
    ({
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      DomainFacility destinationFacility,
      List<DomainShipment> shipments,
    List<String> shipmentSampleCodes,
    })> {
  @override
  ResultShipmentApprovalScreenState build(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainShipment> shipments,
    List<String>shipmentSampleCodes,
    }) param,
  ) {
    return _loadData(param);
  }

  ResultShipmentApprovalScreenState _loadData(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainShipment> shipments,
    List<String> shipmentSampleCodes,
    }) param,
  ) {
    return ResultShipmentApprovalScreenState(
      movementType: param.movementType,
      pickUpFacility: param.pickUpFacility,
      destinationFacility: param.destinationFacility,
      shipments: param.shipments,
      shipmentSampleCodes: param.shipmentSampleCodes,
    );
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

  Future<void> onApproveShipment() async {
    state = state.copyWith(isSavingShipmentRoute: true);

    try {
      final localService = ref.read(nimsLocalServiceProvider);
      final eTokenService = ref.read(eTokenServiceProvider);
      final user = await ref.read(authRepositoryProvider).getUser();
      final lsp = await localService.getFirstCachedLsp();

      // Get an etoken for the approval (auto-downloads if needed)
      DomainETokenData approvalEToken;
      try {
        approvalEToken = await eTokenService.getNextEToken();
      } on NoETokensAvailableException catch (e) {
        state = state.copyWith(
          isSavingShipmentRoute: false,
          alert: Alert(show: true, message: e.message),
        );
        return;
      }

      // Generate approval_no with -PK suffix for pickup approval
      final approvalNo =
          '${lsp?.display ?? "UNKNOWN"}-AP-${approvalEToken.serialNo}-PK';

      // Delete the approval etoken after use
      await eTokenService.deleteEToken(approvalEToken.etokenId!);

      final routeNo = state.shipments.first.routeNo;
      final shipmentRoute = DomainShipmentRoute(
        routeNo: routeNo,
        routeType: "result_shipment_route",
        originFacilityId: state.pickUpFacility.facilityId?.toString() ?? "",
        destinationFacilityId:
            state.destinationFacility.facilityId?.toString() ?? "",
        lspCode: lsp?.lspCode ?? "",
        riderUserId: user?.userId ?? "",
        originFacilityName: state.pickUpFacility.facilityName ?? "",
        destinationFacilityName: state.destinationFacility.facilityName ?? "",
        latitude: GeoLocationService().latitude,
        longitude: GeoLocationService().longitude,
      );

      final approval = DomainApproval(
        approvalNo: approvalNo,
        routeNo: routeNo,
        approvalType: 'result_pickup',
        fullname: state.fullName,
        phone: state.phoneNumber,
        designation: state.designation,
        signature: state.signature,
        latitude: GeoLocationService().latitude,
        longitude: GeoLocationService().longitude,
        approvalDate: DateTime.now().toIso8601String(),
      );

      developer.log(
        "Saving result specimen route: $routeNo with ${state.shipments.length} shipments",
        name: "ResultShipmentApprovalScreenStateNotifier:onApproveShipment",
      );

      final result = await ref
          .read(shipmentRouteRepositoryProvider)
          .saveResultShipmentRoute(
            shipmentRoute,
            state.shipments,
            approval,
        state.shipmentSampleCodes,
          );

      switch (result) {
        case Success<bool>():
          ref.invalidate(dashboardScreenStateNotifierProvider);
          state = state.copyWith(
            isSavingShipmentRoute: false,
            showSuccessDialog: true,
            createdRouteNo: routeNo,
          );
        case Error<bool>():
          state = state.copyWith(
            isSavingShipmentRoute: false,
            alert: Alert(show: true, message: result.message),
          );
      }
    } catch (e, s) {
      developer.log(
        "Error approving specimen: $e",
        name: "ResultShipmentApprovalScreenStateNotifier:onApproveShipment",
        error: e,
        stackTrace: s,
      );
      state = state.copyWith(
        isSavingShipmentRoute: false,
        alert: Alert(show: true, message: e.toString()),
      );
    }
  }

  onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }
}
