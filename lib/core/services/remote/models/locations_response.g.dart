// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationResponseImpl _$$LocationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$LocationResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => LocationItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$LocationResponseImplToJson(
  _$LocationResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$LocationItemImpl _$$LocationItemImplFromJson(Map<String, dynamic> json) =>
    _$LocationItemImpl(
      pick: json['pick'] as String?,
      locationId: (json['location_id'] as num?)?.toInt(),
      location: json['location'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$$LocationItemImplToJson(_$LocationItemImpl instance) =>
    <String, dynamic>{
      'pick': instance.pick,
      'location_id': instance.locationId,
      'location': instance.location,
      'created': instance.created,
    };
