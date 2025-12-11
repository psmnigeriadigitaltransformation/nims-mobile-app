// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovementTypeImpl _$$MovementTypeImplFromJson(Map<String, dynamic> json) =>
    _$MovementTypeImpl(
      id: (json['id'] as num?)?.toInt(),
      pick: json['pick'] as String?,
      typeId: (json['type_id'] as num?)?.toInt(),
      movement: json['movement'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$$MovementTypeImplToJson(_$MovementTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pick': instance.pick,
      'type_id': instance.typeId,
      'movement': instance.movement,
      'created': instance.created,
    };
