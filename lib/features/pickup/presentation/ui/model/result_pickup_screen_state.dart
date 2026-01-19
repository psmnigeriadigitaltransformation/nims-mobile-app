import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';

import '../../../../../../core/ui/model/model/alert.dart';

part 'result_pickup_screen_state.freezed.dart';

@freezed
class ResultPickUpScreenState with _$ResultPickUpScreenState {
  const ResultPickUpScreenState._();

  const factory ResultPickUpScreenState({
    @Default([]) List<Facility> facilities,
    MovementType? movementType,
    Facility? selectedFacility,
    @Default({}) Set<String> selectedResultCodes,
    @Default("") String temperature,
    @Default("") String fullName,
    @Default("") String phoneNumber,
    @Default("") String designation,
    @Default("") String signature,
    @Default(false) bool isSubmitting,
    @Default(Alert(message: "", show: false)) Alert alert,
    @Default(false) bool showSuccessScreen,
    // Hardcoded sample data for now (will be replaced with real API data later)
    @Default([]) List<ResultSampleData> availableResults,
  }) = _ResultPickUpScreenState;

  String? get phoneNumberError {
    if (phoneNumber.isEmpty) return null;
    if (phoneNumber.length != 11) return "Phone number must be 11 digits";
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) return "Phone number must contain only digits";
    return null;
  }

  bool get isPhoneNumberValid =>
      phoneNumber.length == 11 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber);

  bool get isFormValid =>
      selectedFacility != null &&
      selectedResultCodes.isNotEmpty &&
      temperature.isNotEmpty &&
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;

  bool get canProceedToApproval =>
      selectedFacility != null && selectedResultCodes.isNotEmpty;
}

/// Represents a sample/result that can be picked up
@freezed
class ResultSampleData with _$ResultSampleData {
  const factory ResultSampleData({
    required String manifestNo,
    required String sampleType,
    required List<String> sampleCodes,
  }) = _ResultSampleData;
}
