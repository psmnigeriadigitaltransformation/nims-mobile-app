import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_manifest_request_body.freezed.dart';
part 'delete_manifest_request_body.g.dart';

@freezed
class DeleteManifestRequest with _$DeleteManifestRequest {
  const factory DeleteManifestRequest({
    @JsonKey(name: 'manifest_no') required String manifestNo,
  }) = _DeleteManifestRequest;

  factory DeleteManifestRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteManifestRequestFromJson(json);
}
