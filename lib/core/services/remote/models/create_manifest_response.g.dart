// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_manifest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManifestSaveResponseImpl _$$ManifestSaveResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ManifestSaveResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ManifestItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ManifestSaveResponseImplToJson(
  _$ManifestSaveResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$ManifestItemImpl _$$ManifestItemImplFromJson(Map<String, dynamic> json) =>
    _$ManifestItemImpl(
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
          ?.map((e) => ManifestSample.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ManifestItemImplToJson(_$ManifestItemImpl instance) =>
    <String, dynamic>{
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

_$ManifestSampleImpl _$$ManifestSampleImplFromJson(Map<String, dynamic> json) =>
    _$ManifestSampleImpl(
      sampleCode: json['sample_code'] as String?,
      patientCode: json['patient_code'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$ManifestSampleImplToJson(
  _$ManifestSampleImpl instance,
) => <String, dynamic>{
  'sample_code': instance.sampleCode,
  'patient_code': instance.patientCode,
  'age': instance.age,
  'gender': instance.gender,
};
