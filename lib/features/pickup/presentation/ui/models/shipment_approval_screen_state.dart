import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/domain/models/location.dart';
import '../../../../../core/domain/models/shipment.dart';

part 'shipment_approval_screen_state.freezed.dart';

@freezed
class ShipmentApprovalScreenState with _$ShipmentApprovalScreenState {
  const ShipmentApprovalScreenState._();

  const factory ShipmentApprovalScreenState({
    required DomainMovementType movementType,
    required DomainFacility pickUpFacility,
    required DomainFacility destinationFacility,
    required List<DomainShipment> shipments,
    @Default("") String pickUpTemperature,
    @Default("") String fullName,
    @Default("") String phoneNumber,
    @Default("") String designation,
    @Default("") String signature,
    @Default(false) bool isSavingShipmentRoute,
    @Default(Alert(message: "", show: false)) Alert alert,
    @Default(false) bool showSuccessDialog,
    @Default("") String createdRouteNo,
  }) = _ShipmentApprovalScreenState;

  String? get phoneNumberError {
    if (phoneNumber.isEmpty) return null;
    if (phoneNumber.length != 11) return "Phone number must be 11 digits";
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) return "Phone number must contain only digits";
    return null;
  }

  bool get isPhoneNumberValid =>
      phoneNumber.length == 11 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber);

  bool get isApproveShipmentButtonEnabled =>
      pickUpTemperature.isNotEmpty &&
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
