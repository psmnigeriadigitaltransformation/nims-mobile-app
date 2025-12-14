import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_manifest_response.freezed.dart';
part 'delete_manifest_response.g.dart';

@freezed
class DeleteManifestResponse with _$DeleteManifestResponse {
  const factory DeleteManifestResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required bool? data,
  }) = _DeleteManifestResponse;

  factory DeleteManifestResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteManifestResponseFromJson(json);
}
