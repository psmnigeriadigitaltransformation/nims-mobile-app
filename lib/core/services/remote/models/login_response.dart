import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';

part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required LoginData? data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: 'JWT') required String? jwt,
    @JsonKey(name: 'userData') required UserData? userData,
    @JsonKey(name: 'deviceSerialNo') required String? deviceSerialNo,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String? status,
    required String? message,
    required User? user,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'user_id') required String? userId,
    required String? guid,
    @JsonKey(name: 'role_code') required String? roleCode,
    required String? role,
    required String? title,
    @JsonKey(name: 'first_name') required String? firstName,
    @JsonKey(name: 'middle_name') required String? middleName,
    @JsonKey(name: 'last_name') required String? lastName,
    @JsonKey(name: 'is_active') required int? isActive,
    @JsonKey(name: 'is_deleted') required int? isDeleted,
    required int? priority,

    // @PlatformItemListConverter()
    required List<PlatformItem>? platform,

    // @SystemPrivilegeListConverter()
    @JsonKey(name: 'system_privilege')
    required List<SystemPrivilege>? systemPrivilege,

    @JsonKey(name: 'geo_privileges') String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') String? lspPrivileges,

    @JsonKey(name: 'lsp') required List<Lsp>? lsp,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class PlatformItem with _$PlatformItem {
  const factory PlatformItem({required String name}) = _PlatformItem;

  factory PlatformItem.fromJson(Map<String, dynamic> json) =>
      _$PlatformItemFromJson(json);
}

@freezed
class SystemPrivilege with _$SystemPrivilege {
  const factory SystemPrivilege({
    required String name,
    required Privileges privileges,
  }) = _SystemPrivilege;

  factory SystemPrivilege.fromJson(Map<String, dynamic> json) =>
      _$SystemPrivilegeFromJson(json);
}

@freezed
class Privileges with _$Privileges {
  const factory Privileges({
    int? rider,
  }) = _Privileges;

  factory Privileges.fromJson(Map<String, dynamic> json) =>
      _$PrivilegesFromJson(json);
}

@freezed
class Lsp with _$Lsp {
  const factory Lsp({
    String? pick,
    @JsonKey(name: 'lsp_id') int? lspId,
    @JsonKey(name: 'lsp_code') String? lspCode,
    @JsonKey(name: 'fullname') String? fullName,
    @JsonKey(name: 'guid') String? guid,
    @JsonKey(name: 'display') String? display,
  }) = _Lsp;

  factory Lsp.fromJson(Map<String, dynamic> json) => _$LspFromJson(json);
}

/// Converters
class PlatformItemListConverter
    implements JsonConverter<List<PlatformItem>?, dynamic> {
  const PlatformItemListConverter();

  @override
  List<PlatformItem>? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is String) {
      final list = jsonDecode(json) as List;
      return list.map((e) => PlatformItem.fromJson(e)).toList();
    } else if (json is List) {
      return json.map((e) => PlatformItem.fromJson(e)).toList();
    }
    return null;
  }

  @override
  dynamic toJson(List<PlatformItem>? items) {
    if (items == null) return null;
    return jsonEncode(items.map((e) => e.toJson()).toList());
  }
}

class SystemPrivilegeListConverter
    implements JsonConverter<List<SystemPrivilege>?, dynamic> {
  const SystemPrivilegeListConverter();

  @override
  List<SystemPrivilege>? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is String) {
      final list = jsonDecode(json) as List;
      return list.map((e) => SystemPrivilege.fromJson(e)).toList();
    } else if (json is List) {
      return json.map((e) => SystemPrivilege.fromJson(e)).toList();
    }
    return null;
  }

  @override
  dynamic toJson(List<SystemPrivilege>? items) {
    if (items == null) return null;
    return jsonEncode(items.map((e) => e.toJson()).toList());
  }
}
