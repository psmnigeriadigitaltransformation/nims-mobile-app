import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_manifest_request_body.freezed.dart';
part 'create_manifest_request_body.g.dart';

@freezed
class ManifestRequestItem with _$ManifestRequestItem {
  const factory ManifestRequestItem({
    @JsonKey(name: "manifest_no") required String manifestNo,
    @JsonKey(name: "origin_id") required String originId,
    @JsonKey(name: "destination_id") required String destinationId,
    @JsonKey(name: "sample_type") required String sampleType,
    @JsonKey(name: "sample_count") required int sampleCount,
    @JsonKey(name: "phlebotomy_no") required String phlebotomyNo,
    @JsonKey(name: "lsp_code") required String lspCode,
    required String temperature,
    @JsonKey(name: "user_id") required String userId,
    required List<ManifestSampleRequest> samples,
  }) = _ManifestRequestItem;

  factory ManifestRequestItem.fromJson(Map<String, dynamic> json) =>
      _$ManifestRequestItemFromJson(json);
}

@freezed
class ManifestSampleRequest with _$ManifestSampleRequest {
  const factory ManifestSampleRequest({
    @JsonKey(name: "sample_code") required String sampleCode,
    @JsonKey(name: "patient_code") required String patientCode,
    required String age,
    required String gender,
  }) = _ManifestSampleRequest;

  factory ManifestSampleRequest.fromJson(Map<String, dynamic> json) =>
      _$ManifestSampleRequestFromJson(json);
}
