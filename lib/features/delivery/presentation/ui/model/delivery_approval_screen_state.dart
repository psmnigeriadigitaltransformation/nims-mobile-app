import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

import '../../../../../core/domain/models/facility.dart';
import '../../../../../core/domain/models/movement_type.dart';
import '../../../../../core/domain/models/shipment.dart';
import '../../../../../core/ui/model/model/alert.dart';

part 'delivery_approval_screen_state.freezed.dart';

@freezed
class DeliveryApprovalScreenState with _$DeliveryApprovalScreenState {
  const DeliveryApprovalScreenState._();

  const factory DeliveryApprovalScreenState({
    required DomainMovementType movementType,
    required DomainFacility destinationFacility,
    required List<DomainShipment> shipments,
    required String routeNo,
    @Default("") String deliveryTemperature,
    @Default("") String fullName,
    @Default("") String phoneNumber,
    @Default("") String designation,
    @Default("") String signature,
    @Default(false) bool isSavingDelivery,
    @Default(Alert(message: "", show: false)) Alert alert,
    @Default(false) bool showSuccessScreen,
  }) = _DeliveryApprovalScreenState;

  String? get phoneNumberError {
    if (phoneNumber.isEmpty) return null;
    if (phoneNumber.length != 11) return "Phone number must be 11 digits";
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) return "Phone number must contain only digits";
    return null;
  }

  bool get isPhoneNumberValid =>
      phoneNumber.length == 11 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber);

  bool get isApproveDeliveryButtonEnabled =>
      deliveryTemperature.isNotEmpty &&
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
