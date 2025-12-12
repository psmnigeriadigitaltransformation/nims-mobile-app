// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_privilege.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SystemPrivilegeImpl _$$SystemPrivilegeImplFromJson(
  Map<String, dynamic> json,
) => _$SystemPrivilegeImpl(
  id: (json['id'] as num?)?.toInt(),
  userId: json['user_id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$$SystemPrivilegeImplToJson(
  _$SystemPrivilegeImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'name': instance.name,
};
