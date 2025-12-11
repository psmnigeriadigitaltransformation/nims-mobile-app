import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_manifest_response.freezed.dart';
part 'create_manifest_response.g.dart';

@freezed
class ManifestSaveResponse with _$ManifestSaveResponse {
  const factory ManifestSaveResponse({
    @JsonKey(name: "result_code") required int? resultCode,
    required String? status,
    required String? message,
    required List<ManifestItem>? data,
  }) = _ManifestSaveResponse;

  factory ManifestSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$ManifestSaveResponseFromJson(json);
}

@freezed
class ManifestItem with _$ManifestItem {
  const factory ManifestItem({
    @JsonKey(name: "manifest_no") required String? manifestNo,
    @JsonKey(name: "origin_id") required String? originId,
    @JsonKey(name: "destination_id") required String? destinationId,
    @JsonKey(name: "sample_type") required String? sampleType,
    @JsonKey(name: "sample_count") required int? sampleCount,
    @JsonKey(name: "phlebotomy_no") required String? phlebotomyNo,
    @JsonKey(name: "lsp_code") required String? lspCode,
    required String? temperature,
    @JsonKey(name: "user_id") required String? userId,
    required List<ManifestSample>? samples,
  }) = _ManifestItem;

  factory ManifestItem.fromJson(Map<String, dynamic> json) =>
      _$ManifestItemFromJson(json);
}

@freezed
class ManifestSample with _$ManifestSample {
  const factory ManifestSample({
    @JsonKey(name: "sample_code") required String? sampleCode,
    @JsonKey(name: "patient_code") required String? patientCode,
    required String? age,
    required String? gender,
  }) = _ManifestSample;

  factory ManifestSample.fromJson(Map<String, dynamic> json) =>
      _$ManifestSampleFromJson(json);
}
