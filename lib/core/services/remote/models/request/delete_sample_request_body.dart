import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_sample_request_body.freezed.dart';
part 'delete_sample_request_body.g.dart';

@freezed
class DeleteSampleRequest with _$DeleteSampleRequest {
  const factory DeleteSampleRequest({
    @JsonKey(name: 'sample_code') required String manifestNo,
  }) = _DeleteSampleRequest;

  factory DeleteSampleRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteSampleRequestFromJson(json);
}
