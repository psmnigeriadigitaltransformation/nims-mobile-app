import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
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
  // @override
  // FutureOr<ShipmentApprovalScreenState> build(
  //   ({
  //     DomainFacility destinationFacility,
  //     DomainMovementType movementType,
  //     DomainFacility pickUpFacility,
  //     List<DomainShipment> shipments,
  //   })
  //   param,
  // ) {
  //   developer.log(
  //     "${param.movementType}",
  //     name: "ShipmentApprovalScreenStateNotifier:movementType",
  //   );
  //   developer.log(
  //     "${param.pickUpFacility}",
  //     name: "ShipmentApprovalScreenStateNotifier:pickUpFacility",
  //   );
  //   developer.log(
  //     "${param.destinationFacility}",
  //     name: "ShipmentApprovalScreenStateNotifier:destinationFacility",
  //   );
  //   developer.log(
  //     "${param.shipments}",
  //     name: "ShipmentApprovalScreenStateNotifier:shipments",
  //   );
  //   return _loadData((
  //     movementType: param.movementType,
  //     pickUpFacility: param.pickUpFacility,
  //     destinationFacility: param.destinationFacility,
  //     shipments: param.shipments,
  //   ));
  // }

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
}
