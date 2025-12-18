import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
import 'package:projects/core/ui/model/model/alert.dart';
import 'package:projects/features/auth/data/providers.dart';
import 'package:projects/features/facilities/data/providers.dart';
import 'package:projects/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
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

  onApproveShipment() async {
    state = state.copyWith(isSavingShipmentRoute: true);
    final user = await ref.read(authRepositoryProvider).getUser();
    final routeNo = Uuid().v4();
    final shipmentRoute = DomainShipmentRoute(
      routeNo: routeNo,
      originFacilityId: state.pickUpFacility.facilityId?.toString() ?? "",
      destinationFacilityId:
          state.destinationFacility.facilityId?.toString() ?? "",
      lspCode: '',
      riderUserId: user?.userId ?? "",
    );

    final approval = DomainApproval(
      approvalNo: Uuid().v4(),
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
        state = state.copyWith(showSuccessDialog: true);
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
