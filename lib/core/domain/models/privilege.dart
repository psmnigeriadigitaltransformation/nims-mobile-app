import 'package:freezed_annotation/freezed_annotation.dart';

part 'privilege.freezed.dart';

part 'privilege.g.dart';

@freezed
class Privilege with _$Privilege {
  const factory Privilege({
    required String? id,
    @JsonKey(name: 'system_privilege_id') required int? systemPrivilegeId,
    @JsonKey(name: 'rider') required int? rider,
  }) = _Privilege;


  factory Privilege.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeFromJson(json);
}
