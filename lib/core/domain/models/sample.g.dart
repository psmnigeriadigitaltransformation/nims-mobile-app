// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleImpl _$$SampleImplFromJson(Map<String, dynamic> json) => _$SampleImpl(
  id: (json['id'] as num?)?.toInt(),
  manifestNo: json['manifest_no'] as String,
  sampleCode: json['sample_code'] as String,
  patientCode: json['patient_code'] as String,
  age: json['age'] as String,
  gender: json['gender'] as String,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$$SampleImplToJson(_$SampleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'manifest_no': instance.manifestNo,
      'sample_code': instance.sampleCode,
      'patient_code': instance.patientCode,
      'age': instance.age,
      'gender': instance.gender,
      'created_at': instance.createdAt,
    };
