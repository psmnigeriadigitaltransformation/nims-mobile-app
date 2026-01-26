import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class LabResult with _$LabResult {
  const factory LabResult({
    @JsonKey(name: 'sample_code') required String sampleCode,
    @JsonKey(name: 'manifest_no') required String manifestNo,
    @JsonKey(name: 'patient_code') required String patientCode,
    required String age,
    required String gender,
    @JsonKey(name: 'facility_id') required String facilityId,
    @JsonKey(name: 'is_picked') @Default(0) int isPicked,
    @JsonKey(name: 'is_rejected') @Default(0) int isRejected,
    @JsonKey(name: 'rejection_sync_status') String? rejectionSyncStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'rejection_date') String? rejectionDate,
    @JsonKey(name: 'route_no') String? routeNo,
  }) = _LabResult;

  factory LabResult.fromJson(Map<String, dynamic> json) => _$LabResultFromJson(json);
}
