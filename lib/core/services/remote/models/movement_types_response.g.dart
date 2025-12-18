// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_types_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovementTypesResponseImpl _$$MovementTypesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MovementTypesResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => MovementTypeItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$MovementTypesResponseImplToJson(
  _$MovementTypesResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$MovementTypeItemImpl _$$MovementTypeItemImplFromJson(
  Map<String, dynamic> json,
) => _$MovementTypeItemImpl(
  pick: json['pick'] as String?,
  typeId: (json['type_id'] as num?)?.toInt(),
  origin: json['origin'] as String?,
  destinationPrimary: json['destination_primary'] as String?,
  destinationSecondary: json['destination_secondary'] as String?,
  movement: json['movement'] as String?,
  created: json['created'] as String?,
);

Map<String, dynamic> _$$MovementTypeItemImplToJson(
  _$MovementTypeItemImpl instance,
) => <String, dynamic>{
  'pick': instance.pick,
  'type_id': instance.typeId,
  'origin': instance.origin,
  'destination_primary': instance.destinationPrimary,
  'destination_secondary': instance.destinationSecondary,
  'movement': instance.movement,
  'created': instance.created,
};
