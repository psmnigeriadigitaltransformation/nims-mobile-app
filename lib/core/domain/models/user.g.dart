// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num?)?.toInt(),
  userId: json['user_id'] as String?,
  guid: json['guid'] as String?,
  roleCode: json['role_code'] as String?,
  role: json['role'] as String?,
  title: json['title'] as String?,
  firstName: json['first_name'] as String?,
  middleName: json['middle_name'] as String?,
  lastName: json['last_name'] as String?,
  isActive: (json['is_active'] as num?)?.toInt(),
  isDeleted: (json['is_deleted'] as num?)?.toInt(),
  priority: (json['priority'] as num?)?.toInt(),
  geoPrivileges: json['geo_privileges'] as String?,
  lspPrivileges: json['lsp_privileges'] as String?,
  deviceSerialNo: json['device_serial_no'] as String?,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'guid': instance.guid,
      'role_code': instance.roleCode,
      'role': instance.role,
      'title': instance.title,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'is_active': instance.isActive,
      'is_deleted': instance.isDeleted,
      'priority': instance.priority,
      'geo_privileges': instance.geoPrivileges,
      'lsp_privileges': instance.lspPrivileges,
      'device_serial_no': instance.deviceSerialNo,
    };
