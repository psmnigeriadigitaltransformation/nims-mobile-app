import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/alert.dart';
import '../../../../../core/domain/models/location.dart';
import '../../../../../core/domain/models/shipment.dart';
import '../../../../../core/utils/validators.dart';

part 'specimen_shipment_approval_screen_state.freezed.dart';

@freezed
class SpecimenShipmentApprovalScreenState with _$SpecimenShipmentApprovalScreenState {
  const SpecimenShipmentApprovalScreenState._();

  const factory SpecimenShipmentApprovalScreenState({
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
  }) = _SpecimenShipmentApprovalScreenState;

  String? get phoneNumberError => PhoneValidator.validate(phoneNumber);

  bool get isPhoneNumberValid => PhoneValidator.isValid(phoneNumber);

  bool get isApproveShipmentButtonEnabled =>
      pickUpTemperature.isNotEmpty &&
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
