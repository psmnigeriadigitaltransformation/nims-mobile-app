import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_sample_request_body.freezed.dart';
part 'update_sample_request_body.g.dart';

@freezed
class UpdateSampleRequest with _$UpdateSampleRequest {
  const factory UpdateSampleRequest({
    @JsonKey(name: "sample_code") required String sampleCode,
    @JsonKey(name: "patient_code") required String patientCode,
    required String age,
    required String gender,
  }) = _UpdateSampleRequest;

  factory UpdateSampleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSampleRequestFromJson(json);
}
