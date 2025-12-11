// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleTypeImpl _$$SampleTypeImplFromJson(Map<String, dynamic> json) =>
    _$SampleTypeImpl(
      id: (json['id'] as num?)?.toInt(),
      pick: json['pick'] as String?,
      sampleId: (json['sample_id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$$SampleTypeImplToJson(_$SampleTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pick': instance.pick,
      'sample_id': instance.sampleId,
      'full_name': instance.fullName,
    };
