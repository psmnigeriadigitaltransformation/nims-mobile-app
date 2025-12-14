// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sample_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateSampleRequestImpl _$$UpdateSampleRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateSampleRequestImpl(
  sampleCode: json['sample_code'] as String,
  patientCode: json['patient_code'] as String,
  age: json['age'] as String,
  gender: json['gender'] as String,
);

Map<String, dynamic> _$$UpdateSampleRequestImplToJson(
  _$UpdateSampleRequestImpl instance,
) => <String, dynamic>{
  'sample_code': instance.sampleCode,
  'patient_code': instance.patientCode,
  'age': instance.age,
  'gender': instance.gender,
};
