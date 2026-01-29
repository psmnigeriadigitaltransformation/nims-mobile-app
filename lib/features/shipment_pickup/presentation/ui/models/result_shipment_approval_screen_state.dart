import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/alert.dart';
import '../../../../../core/domain/models/shipment.dart';
import '../../../../../core/utils/validators.dart';

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

  String? get phoneNumberError => PhoneValidator.validate(phoneNumber);

  bool get isPhoneNumberValid => PhoneValidator.isValid(phoneNumber);

  bool get isApproveShipmentButtonEnabled =>
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
