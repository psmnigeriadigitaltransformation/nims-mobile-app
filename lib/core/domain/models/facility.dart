import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility.freezed.dart';
part 'facility.g.dart';

@freezed
class Facility with _$Facility {
  const factory Facility({
    required String? id,
    @JsonKey(name: 'facility_id') int? facilityId,
    @JsonKey(name: 'facility_code') String? facilityCode,
    @JsonKey(name: 'lab_code') String? labCode,
    @JsonKey(name: 'facility_name') String? facilityName,
    @JsonKey(name: 'geo_string') String? geoString,
    String? type,
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);
}
