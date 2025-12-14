// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etoken_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ETokenDataImpl _$$ETokenDataImplFromJson(Map<String, dynamic> json) =>
    _$ETokenDataImpl(
      id: (json['id'] as num?)?.toInt(),
      etokenId: json['etoken_id'] as String?,
      serialNo: json['serial_no'] as String?,
    );

Map<String, dynamic> _$$ETokenDataImplToJson(_$ETokenDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'etoken_id': instance.etokenId,
      'serial_no': instance.serialNo,
    };
