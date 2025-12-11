// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacilityImpl _$$FacilityImplFromJson(Map<String, dynamic> json) =>
    _$FacilityImpl(
      id: json['id'] as String?,
      facilityId: (json['facility_id'] as num?)?.toInt(),
      facilityCode: json['facility_code'] as String?,
      labCode: json['lab_code'] as String?,
      facilityName: json['facility_name'] as String?,
      geoString: json['geo_string'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$FacilityImplToJson(_$FacilityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facility_id': instance.facilityId,
      'facility_code': instance.facilityCode,
      'lab_code': instance.labCode,
      'facility_name': instance.facilityName,
      'geo_string': instance.geoString,
      'type': instance.type,
    };
