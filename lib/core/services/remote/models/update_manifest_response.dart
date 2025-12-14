import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_manifest_response.freezed.dart';
part 'update_manifest_response.g.dart';

@freezed
class UpdateManifestResponse with _$UpdateManifestResponse {
  const factory UpdateManifestResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required bool? data,
  }) = _UpdateManifestResponse;

  factory UpdateManifestResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateManifestResponseFromJson(json);
}
