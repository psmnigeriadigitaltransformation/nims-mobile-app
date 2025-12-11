// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      resultCode: (json['result_code'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'result_code': instance.resultCode,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      jwt: json['JWT'] as String?,
      userData: json['userData'] == null
          ? null
          : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      deviceSerialNo: json['deviceSerialNo'] as String?,
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'JWT': instance.jwt,
      'userData': instance.userData,
      'deviceSerialNo': instance.deviceSerialNo,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
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
  platform: (json['platform'] as List<dynamic>?)
      ?.map((e) => PlatformItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  systemPrivilege: (json['system_privilege'] as List<dynamic>?)
      ?.map((e) => SystemPrivilege.fromJson(e as Map<String, dynamic>))
      .toList(),
  geoPrivileges: json['geo_privileges'] as String?,
  lspPrivileges: json['lsp_privileges'] as String?,
  lsp: (json['lsp'] as List<dynamic>?)
      ?.map((e) => Lsp.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
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
      'platform': instance.platform,
      'system_privilege': instance.systemPrivilege,
      'geo_privileges': instance.geoPrivileges,
      'lsp_privileges': instance.lspPrivileges,
      'lsp': instance.lsp,
    };

_$PlatformItemImpl _$$PlatformItemImplFromJson(Map<String, dynamic> json) =>
    _$PlatformItemImpl(name: json['name'] as String);

Map<String, dynamic> _$$PlatformItemImplToJson(_$PlatformItemImpl instance) =>
    <String, dynamic>{'name': instance.name};

_$SystemPrivilegeImpl _$$SystemPrivilegeImplFromJson(
  Map<String, dynamic> json,
) => _$SystemPrivilegeImpl(
  name: json['name'] as String,
  privileges: Privileges.fromJson(json['privileges'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SystemPrivilegeImplToJson(
  _$SystemPrivilegeImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'privileges': instance.privileges,
};

_$PrivilegesImpl _$$PrivilegesImplFromJson(Map<String, dynamic> json) =>
    _$PrivilegesImpl(rider: (json['rider'] as num?)?.toInt());

Map<String, dynamic> _$$PrivilegesImplToJson(_$PrivilegesImpl instance) =>
    <String, dynamic>{'rider': instance.rider};

_$LspImpl _$$LspImplFromJson(Map<String, dynamic> json) => _$LspImpl(
  pick: json['pick'] as String?,
  lspId: (json['lsp_id'] as num?)?.toInt(),
  lspCode: json['lsp_code'] as String?,
  fullName: json['fullname'] as String?,
  guid: json['guid'] as String?,
  display: json['display'] as String?,
);

Map<String, dynamic> _$$LspImplToJson(_$LspImpl instance) => <String, dynamic>{
  'pick': instance.pick,
  'lsp_id': instance.lspId,
  'lsp_code': instance.lspCode,
  'fullname': instance.fullName,
  'guid': instance.guid,
  'display': instance.display,
};
