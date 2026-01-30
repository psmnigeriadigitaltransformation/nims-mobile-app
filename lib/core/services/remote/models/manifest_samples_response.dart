import 'package:freezed_annotation/freezed_annotation.dart';

part 'manifest_samples_response.freezed.dart';
part 'manifest_samples_response.g.dart';

@freezed
class ManifestSamplesResponse with _$ManifestSamplesResponse {
  const factory ManifestSamplesResponse({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ManifestSampleItem>? data,
  }) = _ManifestSamplesResponse;

  factory ManifestSamplesResponse.fromJson(Map<String, dynamic> json) =>
      _$ManifestSamplesResponseFromJson(json);
}

@freezed
class ManifestSampleItem with _$ManifestSampleItem {
  const factory ManifestSampleItem({
    @JsonKey(name: 'manifest_no') String? manifestNo,
    @JsonKey(name: 'phlebotomy_no') String? phlebotomyNo,
    @JsonKey(name: 'sample_type') String? sampleType,
    String? stage,
    @JsonKey(name: 'sample_count') int? sampleCount,
    @JsonKey(name: 'origin_facility_name') String? originFacilityName,
    @JsonKey(name: 'origin_facility_code') String? originFacilityCode,
    @JsonKey(name: 'origin_facility_id') int? originFacilityId,
    @JsonKey(name: 'destination_facility_name') String? destinationFacilityName,
    @JsonKey(name: 'destination_facility_code') String? destinationFacilityCode,
    @JsonKey(name: 'destination_facility_id') int? destinationFacilityId,
    List<ManifestSampleDetail>? samples,
  }) = _ManifestSampleItem;

  factory ManifestSampleItem.fromJson(Map<String, dynamic> json) =>
      _$ManifestSampleItemFromJson(json);
}

@freezed
class ManifestSampleDetail with _$ManifestSampleDetail {
  const factory ManifestSampleDetail({
    @JsonKey(name: 'sample_code') String? sampleCode,
    @JsonKey(name: 'patient_code') String? patientCode,
    String? age,
    String? gender,
  }) = _ManifestSampleDetail;

  factory ManifestSampleDetail.fromJson(Map<String, dynamic> json) =>
      _$ManifestSampleDetailFromJson(json);
}
