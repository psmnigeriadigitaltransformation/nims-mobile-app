import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_manifest_response.freezed.dart';
part 'delete_manifest_response.g.dart';

@freezed
class DeleteManifestResponse with _$DeleteManifestResponse {
  const factory DeleteManifestResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required DeleteManifestData? data,
  }) = _DeleteManifestResponse;

  factory DeleteManifestResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteManifestResponseFromJson(json);
}

@freezed
class DeleteManifestData with _$DeleteManifestData {
  const factory DeleteManifestData({
    @JsonKey(name: 'manifests_deleted') required int? manifestsDeleted,
  }) = _DeleteManifestData;

  factory DeleteManifestData.fromJson(Map<String, dynamic> json) =>
      _$DeleteManifestDataFromJson(json);
}
