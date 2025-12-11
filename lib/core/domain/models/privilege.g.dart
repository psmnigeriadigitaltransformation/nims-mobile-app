// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privilege.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivilegeImpl _$$PrivilegeImplFromJson(Map<String, dynamic> json) =>
    _$PrivilegeImpl(
      id: json['id'] as String?,
      systemPrivilegeId: (json['system_privilege_id'] as num?)?.toInt(),
      rider: (json['rider'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PrivilegeImplToJson(_$PrivilegeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'system_privilege_id': instance.systemPrivilegeId,
      'rider': instance.rider,
    };
