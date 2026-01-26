import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

import '../../../../../core/ui/model/model/alert.dart';

part 'result_delivery_approval_screen_state.freezed.dart';

@freezed
class ResultDeliveryApprovalScreenState with _$ResultDeliveryApprovalScreenState {
  const ResultDeliveryApprovalScreenState._();

  const factory ResultDeliveryApprovalScreenState({
    required ShipmentRoute route,
    required Shipment shipment,
    @Default([]) List<DomainResult> results,
    @Default("") String fullName,
    @Default("") String phoneNumber,
    @Default("") String designation,
    @Default("") String signature,
    @Default(false) bool isSubmitting,
    @Default(Alert(message: "", show: false)) Alert alert,
    @Default(false) bool showSuccessScreen,
  }) = _ResultDeliveryApprovalScreenState;

  String? get phoneNumberError {
    if (phoneNumber.isEmpty) return null;
    if (phoneNumber.length != 11) return "Phone number must be 11 digits";
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) return "Phone number must contain only digits";
    return null;
  }

  bool get isPhoneNumberValid =>
      phoneNumber.length == 11 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber);

  bool get isApproveButtonEnabled =>
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
