import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';

import '../../../../../../core/ui/model/alert.dart';
import '../../../../../core/utils/validators.dart';

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
    @Default(false) bool isLoadingResults,
    // Results grouped by manifest_no
    @Default({}) Map<String, List<LabResult>> resultsByManifest,
    // Sample codes currently being processed (reject/accept)
    @Default({}) Set<String> loadingResultCodes,
  }) = _ResultPickUpScreenState;

  String? get phoneNumberError => PhoneValidator.validate(phoneNumber);

  bool get isPhoneNumberValid => PhoneValidator.isValid(phoneNumber);

  bool get isFormValid =>
      selectedFacility != null &&
      selectedResultCodes.isNotEmpty &&
      temperature.isNotEmpty &&
      fullName.isNotEmpty &&
      isPhoneNumberValid &&
      designation.isNotEmpty;

  bool get canProceedToApproval =>
      selectedFacility != null && selectedResultCodes.isNotEmpty;

  /// Get all available results as a flat list
  List<LabResult> get allResults {
    final results = <LabResult>[];
    for (final manifestResults in resultsByManifest.values) {
      results.addAll(manifestResults);
    }
    return results;
  }

  /// Get total count of available results (non-rejected)
  int get totalResultCount {
    int count = 0;
    for (final manifestResults in resultsByManifest.values) {
      count += manifestResults.where((r) => r.isRejected == 0).length;
    }
    return count;
  }

  /// Get all selectable sample codes (non-rejected results)
  Set<String> get selectableSampleCodes {
    final codes = <String>{};
    for (final manifestResults in resultsByManifest.values) {
      for (final result in manifestResults) {
        if (result.isRejected == 0) {
          codes.add(result.sampleCode);
        }
      }
    }
    return codes;
  }
}
