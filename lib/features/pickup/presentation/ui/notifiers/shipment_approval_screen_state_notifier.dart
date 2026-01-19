import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';
import 'package:nims_mobile_app/features/auth/data/providers.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../../../../dashboard/providers.dart';
import '../model/shipment_approval_screen_state.dart';
import '../model/shipments_screen_state.dart';

class ShipmentApprovalScreenStateNotifier
    extends
        AutoDisposeFamilyNotifier<
          ShipmentApprovalScreenState,
          ({
            DomainMovementType movementType,
            DomainFacility pickUpFacility,
            DomainFacility destinationFacility,
            List<DomainShipment> shipments,
          })
        > {
  @override
  ShipmentApprovalScreenState build(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainShipment> shipments,
    })
    param,
  ) {
    return _loadData(param);
  }

  _loadData(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainShipment> shipments,
    })
    param,
  ) {
    return ShipmentApprovalScreenState(
      movementType: param.movementType,
      pickUpFacility: param.pickUpFacility,
      destinationFacility: param.destinationFacility,
      shipments: param.shipments,
    );
  }

  onUpdatePickUpTemperature(String temperature) {
    state = state.copyWith(pickUpTemperature: temperature);
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
    final localService = ref.read(nimsLocalServiceProvider);
    final user = await ref.read(authRepositoryProvider).getUser();
    final lsp = await localService.getFirstCachedLsp();

    // Get etoken for approval number
    final approvalEToken = await localService.getNextEToken();
    if (approvalEToken == null) {
      state = state.copyWith(
        isSavingShipmentRoute: false,
        alert: Alert(show: true, message: "No eTokens available. Please download more eTokens."),
      );
      return;
    }

    final approvalNo = '${lsp?.display ?? "UNKNOWN"}-AP-${approvalEToken.serialNo}';
    final routeNo = state.shipments.first.routeNo;
    final shipmentRoute = DomainShipmentRoute(
      routeNo: routeNo,
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
      approvalType: 'pickup',
      fullname: state.fullName,
      phone: state.phoneNumber,
      designation: state.designation,
      signature: state.signature,
    );

    final result = await ref
        .read(shipmentRouteRepositoryProvider)
        .saveShipmentRoute(shipmentRoute, state.shipments, approval);

    switch (result) {
      case Success<bool>():
        // Delete used etoken after successful save
        await localService.deleteEToken(approvalEToken.etokenId!);
        ref.invalidate(dashboardScreenStateNotifierProvider);
        state = state.copyWith(
          showSuccessDialog: true,
          createdRouteNo: routeNo,
        );
      case Error<bool>():
        state = state.copyWith(
          alert: Alert(show: true, message: result.message),
        );
    }
  }

  onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }
}
