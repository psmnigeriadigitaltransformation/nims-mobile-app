// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_sample_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteSampleResponseImpl _$$DeleteSampleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DeleteSampleResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] as bool?,
);

Map<String, dynamic> _$$DeleteSampleResponseImplToJson(
  _$DeleteSampleResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
