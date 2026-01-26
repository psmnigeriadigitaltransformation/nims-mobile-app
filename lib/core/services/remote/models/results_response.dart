import 'package:freezed_annotation/freezed_annotation.dart';

part 'results_response.freezed.dart';
part 'results_response.g.dart';

@freezed
class ResultsResponse with _$ResultsResponse {
  const factory ResultsResponse({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ResultItem>? data,
  }) = _ResultsResponse;

  factory ResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultsResponseFromJson(json);
}

@freezed
class ResultItem with _$ResultItem {
  const factory ResultItem({
    @JsonKey(name: 'sample_code') String? sampleCode,
    @JsonKey(name: 'manifest_no') String? manifestNo,
    @JsonKey(name: 'patient_code') String? patientCode,
    String? age,
    String? gender,
  }) = _ResultItem;

  factory ResultItem.fromJson(Map<String, dynamic> json) =>
      _$ResultItemFromJson(json);
}
