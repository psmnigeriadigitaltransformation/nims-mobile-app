// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultsResponseImpl _$$ResultsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ResultsResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ResultItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ResultsResponseImplToJson(
  _$ResultsResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$ResultItemImpl _$$ResultItemImplFromJson(Map<String, dynamic> json) =>
    _$ResultItemImpl(
      sampleCode: json['sample_code'] as String?,
      manifestNo: json['manifest_no'] as String?,
      patientCode: json['patient_code'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$ResultItemImplToJson(_$ResultItemImpl instance) =>
    <String, dynamic>{
      'sample_code': instance.sampleCode,
      'manifest_no': instance.manifestNo,
      'patient_code': instance.patientCode,
      'age': instance.age,
      'gender': instance.gender,
    };
