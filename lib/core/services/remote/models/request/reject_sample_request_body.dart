import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_sample_request_body.freezed.dart';
part 'reject_sample_request_body.g.dart';

@freezed
class RejectSampleRequest with _$RejectSampleRequest {
  const factory RejectSampleRequest({
    @JsonKey(name: 'sample_code') required String sampleCode,
    required String reason,
    @JsonKey(name: 'rejection_date') required String rejectionDate,
  }) = _RejectSampleRequest;

  factory RejectSampleRequest.fromJson(Map<String, dynamic> json) =>
      _$RejectSampleRequestFromJson(json);
}
