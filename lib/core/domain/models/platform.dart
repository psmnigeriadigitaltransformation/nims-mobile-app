import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform.freezed.dart';

part 'platform.g.dart';

@freezed
class Platform with _$Platform {
  const factory Platform({
    required int? id,
    @JsonKey(name: 'user_id') required String? userId,
    required String? name,
  }) = _Platform;

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);
}
