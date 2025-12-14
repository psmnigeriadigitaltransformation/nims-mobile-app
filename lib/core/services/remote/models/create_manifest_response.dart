import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_manifest_response.freezed.dart';
part 'create_manifest_response.g.dart';

@freezed
class CreateManifestResponse with _$CreateManifestResponse {
  const factory CreateManifestResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required CreateManifestData? data,
  }) = _CreateManifestResponse;

  factory CreateManifestResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateManifestResponseFromJson(json);
}

@freezed
class CreateManifestData with _$CreateManifestData {
  const factory CreateManifestData({
    @JsonKey(name: 'manifests_saved') required int? manifestsSaved,
    @JsonKey(name: 'samples_saved') required int? samplesSaved,
    @JsonKey(name: 'manifests_no_saved')
    required List<String>? manifestsNoSaved,
    @JsonKey(name: 'manifests_no_failed')
    required List<String>? manifestsNoFailed,
    required List<CreateManifestError>? errors,
  }) = _ManifestCreateData;

  factory CreateManifestData.fromJson(Map<String, dynamic> json) =>
      _$CreateManifestDataFromJson(json);
}

@freezed
class CreateManifestError with _$CreateManifestError {
  const factory CreateManifestError({
    @JsonKey(name: 'manifest_no') required String? manifestNo,
    required String? message,
  }) = _CreateManifestError;

  factory CreateManifestError.fromJson(Map<String, dynamic> json) =>
      _$CreateManifestErrorFromJson(json);
}
