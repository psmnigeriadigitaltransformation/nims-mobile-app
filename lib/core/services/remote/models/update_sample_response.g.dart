// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sample_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateSampleResponseImpl _$$UpdateSampleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateSampleResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : UpdateSampleData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UpdateSampleResponseImplToJson(
  _$UpdateSampleResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$UpdateSampleDataImpl _$$UpdateSampleDataImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateSampleDataImpl(updated: json['updated'] as bool);

Map<String, dynamic> _$$UpdateSampleDataImplToJson(
  _$UpdateSampleDataImpl instance,
) => <String, dynamic>{'updated': instance.updated};
