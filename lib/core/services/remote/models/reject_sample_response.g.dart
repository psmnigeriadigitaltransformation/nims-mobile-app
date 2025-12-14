// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_sample_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RejectSampleResponseImpl _$$RejectSampleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RejectSampleResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] as bool?,
);

Map<String, dynamic> _$$RejectSampleResponseImplToJson(
  _$RejectSampleResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
