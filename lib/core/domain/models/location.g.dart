// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num?)?.toInt(),
      locationId: (json['location_id'] as num?)?.toInt(),
      pick: json['pick'] as String?,
      location: json['location'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.locationId,
      'pick': instance.pick,
      'location': instance.location,
      'created': instance.created,
    };
