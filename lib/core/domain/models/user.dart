import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required int? id,
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
    @JsonKey(name: 'geo_privileges') String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') String? lspPrivileges,
    @JsonKey(name: 'device_serial_no') String? deviceSerialNo,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
