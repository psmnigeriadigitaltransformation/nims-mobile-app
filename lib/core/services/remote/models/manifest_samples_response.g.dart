// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manifest_samples_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManifestSamplesResponseImpl _$$ManifestSamplesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ManifestSamplesResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ManifestSampleItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ManifestSamplesResponseImplToJson(
  _$ManifestSamplesResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$ManifestSampleItemImpl _$$ManifestSampleItemImplFromJson(
  Map<String, dynamic> json,
) => _$ManifestSampleItemImpl(
  manifestNo: json['manifest_no'] as String?,
  phlebotomyNo: json['phlebotomy_no'] as String?,
  sampleType: json['sample_type'] as String?,
  stage: json['stage'] as String?,
  sampleCount: (json['sample_count'] as num?)?.toInt(),
  originFacilityName: json['origin_facility_name'] as String?,
  originFacilityCode: json['origin_facility_code'] as String?,
  originFacilityId: (json['origin_facility_id'] as num?)?.toInt(),
  destinationFacilityName: json['destination_facility_name'] as String?,
  destinationFacilityCode: json['destination_facility_code'] as String?,
  destinationFacilityId: (json['destination_facility_id'] as num?)?.toInt(),
  samples: (json['samples'] as List<dynamic>?)
      ?.map((e) => ManifestSampleDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ManifestSampleItemImplToJson(
  _$ManifestSampleItemImpl instance,
) => <String, dynamic>{
  'manifest_no': instance.manifestNo,
  'phlebotomy_no': instance.phlebotomyNo,
  'sample_type': instance.sampleType,
  'stage': instance.stage,
  'sample_count': instance.sampleCount,
  'origin_facility_name': instance.originFacilityName,
  'origin_facility_code': instance.originFacilityCode,
  'origin_facility_id': instance.originFacilityId,
  'destination_facility_name': instance.destinationFacilityName,
  'destination_facility_code': instance.destinationFacilityCode,
  'destination_facility_id': instance.destinationFacilityId,
  'samples': instance.samples,
};

_$ManifestSampleDetailImpl _$$ManifestSampleDetailImplFromJson(
  Map<String, dynamic> json,
) => _$ManifestSampleDetailImpl(
  sampleCode: json['sample_code'] as String?,
  patientCode: json['patient_code'] as String?,
  age: json['age'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$$ManifestSampleDetailImplToJson(
  _$ManifestSampleDetailImpl instance,
) => <String, dynamic>{
  'sample_code': instance.sampleCode,
  'patient_code': instance.patientCode,
  'age': instance.age,
  'gender': instance.gender,
};
