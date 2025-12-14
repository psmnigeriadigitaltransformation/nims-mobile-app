import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_sample_response.freezed.dart';
part 'reject_sample_response.g.dart';

@freezed
class RejectSampleResponse with _$RejectSampleResponse {
  const factory RejectSampleResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required bool? data,
  }) = _RejectSampleResponse;

  factory RejectSampleResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectSampleResponseFromJson(json);
}
