// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_manifest_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManifestRequestItemImpl _$$ManifestRequestItemImplFromJson(
  Map<String, dynamic> json,
) => _$ManifestRequestItemImpl(
  manifestNo: json['manifest_no'] as String?,
  originId: json['origin_id'] as String?,
  destinationId: json['destination_id'] as String?,
  sampleType: json['sample_type'] as String?,
  sampleCount: (json['sample_count'] as num?)?.toInt(),
  phlebotomyNo: json['phlebotomy_no'] as String?,
  lspCode: json['lsp_code'] as String?,
  temperature: json['temperature'] as String?,
  userId: json['user_id'] as String?,
  samples: (json['samples'] as List<dynamic>?)
      ?.map((e) => ManifestSampleRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ManifestRequestItemImplToJson(
  _$ManifestRequestItemImpl instance,
) => <String, dynamic>{
  'manifest_no': instance.manifestNo,
  'origin_id': instance.originId,
  'destination_id': instance.destinationId,
  'sample_type': instance.sampleType,
  'sample_count': instance.sampleCount,
  'phlebotomy_no': instance.phlebotomyNo,
  'lsp_code': instance.lspCode,
  'temperature': instance.temperature,
  'user_id': instance.userId,
  'samples': instance.samples,
};

_$ManifestSampleRequestImpl _$$ManifestSampleRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ManifestSampleRequestImpl(
  sampleCode: json['sample_code'] as String?,
  patientCode: json['patient_code'] as String?,
  age: json['age'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$$ManifestSampleRequestImplToJson(
  _$ManifestSampleRequestImpl instance,
) => <String, dynamic>{
  'sample_code': instance.sampleCode,
  'patient_code': instance.patientCode,
  'age': instance.age,
  'gender': instance.gender,
};
