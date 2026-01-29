import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

import '../../../core/domain/models/shipment.dart';
import '../../../core/domain/models/shipment_route.dart';
import '../../../core/ui/model/alert.dart';
import '../../../core/utils/validators.dart';

part 'specimen_delivery_approval_screen_state.freezed.dart';

@freezed
class SpecimenDeliveryApprovalScreenState with _$SpecimenDeliveryApprovalScreenState {
  const SpecimenDeliveryApprovalScreenState._();

  const factory SpecimenDeliveryApprovalScreenState({
    required DomainShipmentRoute route,
    required List<DomainShipment> shipments,
    @Default("") String deliveryTemperature,
    @Default("") String fullName,
    @Default("") String phoneNumber,
    @Default("") String designation,
    @Default("") String signature,
    @Default(false) bool isSavingDelivery,
    @Default(Alert(message: "", show: false)) Alert alert,
    @Default(false) bool showSuccessScreen,
  }) = _SpecimenDeliveryApprovalScreenState;

  String? get phoneNumberError => PhoneValidator.validate(phoneNumber);

  bool get isPhoneNumberValid => PhoneValidator.isValid(phoneNumber);

  bool get isApproveDeliveryButtonEnabled =>
      deliveryTemperature.isNotEmpty &&
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
