import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample.freezed.dart';
part 'sample.g.dart';

@freezed
class Sample with _$Sample {
  const factory Sample({
    int? id,
    @JsonKey(name: 'manifest_no') required String manifestNo,
    @JsonKey(name: 'sample_code') required String sampleCode,
    @JsonKey(name: 'patient_code') required String patientCode,
    required String age,
    required String gender,
    String? comment,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Sample;

  factory Sample.fromJson(Map<String, dynamic> json) =>
      _$SampleFromJson(json);
}
