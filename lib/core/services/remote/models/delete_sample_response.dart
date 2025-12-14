import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_sample_response.freezed.dart';
part 'delete_sample_response.g.dart';

@freezed
class DeleteSampleResponse with _$DeleteSampleResponse {
  const factory DeleteSampleResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required bool? data,
  }) = _DeleteSampleResponse;

  factory DeleteSampleResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSampleResponseFromJson(json);
}
