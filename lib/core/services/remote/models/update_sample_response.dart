import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_sample_response.freezed.dart';
part 'update_sample_response.g.dart';

@freezed
class UpdateSampleResponse with _$UpdateSampleResponse {
  const factory UpdateSampleResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required UpdateSampleData? data,
  }) = _UpdateSampleResponse;

  factory UpdateSampleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSampleResponseFromJson(json);
}

@freezed
class UpdateSampleData with _$UpdateSampleData {
  const factory UpdateSampleData({
    required bool updated,
  }) = _UpdateSampleData;

  factory UpdateSampleData.fromJson(Map<String, dynamic> json) =>
      _$UpdateSampleDataFromJson(json);
}
