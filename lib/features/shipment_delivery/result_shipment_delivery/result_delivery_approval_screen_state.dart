import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

import '../../../core/ui/model/alert.dart';
import '../../../core/utils/validators.dart';

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

  String? get phoneNumberError => PhoneValidator.validate(phoneNumber);

  bool get isPhoneNumberValid => PhoneValidator.isValid(phoneNumber);

  bool get isApproveButtonEnabled =>
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;
}
