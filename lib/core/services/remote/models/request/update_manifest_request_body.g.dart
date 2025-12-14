// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_manifest_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateManifestRequestImpl _$$UpdateManifestRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateManifestRequestImpl(
  manifestNo: json['manifest_no'] as String,
  originFacilityId: json['origin_facility_id'] as String,
  destinationFacilityId: json['destination_facility_id'] as String,
  sampleType: json['sample_type'] as String,
  phlebotomyNo: json['phlebotomy_no'] as String,
  temperature: json['temperature'] as String,
);

Map<String, dynamic> _$$UpdateManifestRequestImplToJson(
  _$UpdateManifestRequestImpl instance,
) => <String, dynamic>{
  'manifest_no': instance.manifestNo,
  'origin_facility_id': instance.originFacilityId,
  'destination_facility_id': instance.destinationFacilityId,
  'sample_type': instance.sampleType,
  'phlebotomy_no': instance.phlebotomyNo,
  'temperature': instance.temperature,
};
