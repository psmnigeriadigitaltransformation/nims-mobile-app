import 'package:freezed_annotation/freezed_annotation.dart';

part 'lsp.freezed.dart';

part 'lsp.g.dart';

@freezed
class Lsp with _$Lsp {
  const factory Lsp({
    required int? id,
    @JsonKey(name: 'user_id') required String? userId,
    String? pick,
    @JsonKey(name: 'lsp_id') int? lspId,
    @JsonKey(name: 'lsp_code') String? lspCode,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'guid') String? guid,
    String? display,
  }) = _Lsp;

  factory Lsp.fromJson(Map<String, dynamic> json) => _$LspFromJson(json);
}
