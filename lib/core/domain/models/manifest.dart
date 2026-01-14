import 'package:freezed_annotation/freezed_annotation.dart';

part 'manifest.freezed.dart';
part 'manifest.g.dart';

@freezed
class Manifest with _$Manifest {
  const factory Manifest({
    int? id,
    @JsonKey(name: 'manifest_no') required String manifestNo,
    @JsonKey(name: 'origin_id') required String originId,
    @JsonKey(name: 'destination_id') required String destinationId,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'sample_count') required int sampleCount,
    @JsonKey(name: 'phlebotomy_no') required String phlebotomyNo,
    @JsonKey(name: 'lsp_code') required String lspCode,
    String? temperature,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'originating_facility_name') required String originatingFacilityName,
    @JsonKey(name: 'destination_facility_name') required String destinationFacilityName
    // @JsonKey(name: 'created_at') String? createdAt,
  }) = _Manifest;

  factory Manifest.fromJson(Map<String, dynamic> json) =>
      _$ManifestFromJson(json);
}
