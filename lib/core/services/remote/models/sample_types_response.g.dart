// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_types_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleTypesResponseImpl _$$SampleTypesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SampleTypesResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => SampleTypeItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$SampleTypesResponseImplToJson(
  _$SampleTypesResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$SampleTypeItemImpl _$$SampleTypeItemImplFromJson(Map<String, dynamic> json) =>
    _$SampleTypeItemImpl(
      pick: json['pick'] as String?,
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullname'] as String?,
    );

Map<String, dynamic> _$$SampleTypeItemImplToJson(
  _$SampleTypeItemImpl instance,
) => <String, dynamic>{
  'pick': instance.pick,
  'id': instance.id,
  'fullname': instance.fullName,
};
