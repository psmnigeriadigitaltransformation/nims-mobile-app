import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_manifest_request_body.freezed.dart';
part 'update_manifest_request_body.g.dart';

@freezed
class UpdateManifestRequest with _$UpdateManifestRequest {
  const factory UpdateManifestRequest({
    @JsonKey(name: 'manifest_no') required String manifestNo,
    @JsonKey(name: 'origin_facility_id') required String originFacilityId,
    @JsonKey(name: 'destination_facility_id')
        required String destinationFacilityId,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'phlebotomy_no') required String phlebotomyNo,
    required String temperature,
  }) = _UpdateManifestRequest;

  factory UpdateManifestRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateManifestRequestFromJson(json);
}
