// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etoken_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ETokenResponseImpl _$$ETokenResponseImplFromJson(Map<String, dynamic> json) =>
    _$ETokenResponseImpl(
      resultCode: (json['result_code'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ETokenData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ETokenResponseImplToJson(
  _$ETokenResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$ETokenDataImpl _$$ETokenDataImplFromJson(Map<String, dynamic> json) =>
    _$ETokenDataImpl(
      etokenId: json['etoken_id'] as String?,
      serialNo: json['serial_no'] as String?,
    );

Map<String, dynamic> _$$ETokenDataImplToJson(_$ETokenDataImpl instance) =>
    <String, dynamic>{
      'etoken_id': instance.etokenId,
      'serial_no': instance.serialNo,
    };
