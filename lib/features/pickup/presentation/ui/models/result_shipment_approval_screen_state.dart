import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/domain/models/shipment.dart';

part 'result_shipment_approval_screen_state.freezed.dart';

@freezed
class ResultShipmentApprovalScreenState
    with _$ResultShipmentApprovalScreenState {
  const ResultShipmentApprovalScreenState._();

  const factory ResultShipmentApprovalScreenState({
    required DomainMovementType movementType,
    required DomainFacility pickUpFacility,
    required DomainFacility destinationFacility,
    required List<DomainShipment> shipments,
    // Map of shipment_no to list of sample codes
    @Default([]) List<String> shipmentSampleCodes,
    @Default("") String fullName,
    @Default("") String phoneNumber,
    @Default("") String designation,
    @Default("") String signature,
    @Default(false) bool isSavingShipmentRoute,
    @Default(Alert(message: "", show: false)) Alert alert,
    @Default(false) bool showSuccessDialog,
    @Default("") String createdRouteNo,
  }) = _ResultShipmentApprovalScreenState;

  String? get phoneNumberError {
    if (phoneNumber.isEmpty) return null;
    if (phoneNumber.length != 11) return "Phone number must be 11 digits";
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      return "Phone number must contain only digits";
    }
    return null;
  }

  bool get isPhoneNumberValid =>
      phoneNumber.length == 11 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber);

  bool get isApproveShipmentButtonEnabled =>
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
