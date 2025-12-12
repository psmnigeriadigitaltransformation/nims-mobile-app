import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_privilege.freezed.dart';

part 'system_privilege.g.dart';

@freezed
class SystemPrivilege with _$SystemPrivilege {
  const factory SystemPrivilege({
    required int? id,
    @JsonKey(name: 'user_id') required String? userId,
    required String? name,
  }) = _SystemPrivilege;

  factory SystemPrivilege.fromJson(Map<String, dynamic> json) =>
      _$SystemPrivilegeFromJson(json);
}
