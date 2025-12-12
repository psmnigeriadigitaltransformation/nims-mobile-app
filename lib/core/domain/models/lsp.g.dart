// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lsp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LspImpl _$$LspImplFromJson(Map<String, dynamic> json) => _$LspImpl(
  id: (json['id'] as num?)?.toInt(),
  userId: json['user_id'] as String?,
  pick: json['pick'] as String?,
  lspId: (json['lsp_id'] as num?)?.toInt(),
  lspCode: json['lsp_code'] as String?,
  fullName: json['full_name'] as String?,
  guid: json['guid'] as String?,
  display: json['display'] as String?,
);

Map<String, dynamic> _$$LspImplToJson(_$LspImpl instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'pick': instance.pick,
  'lsp_id': instance.lspId,
  'lsp_code': instance.lspCode,
  'full_name': instance.fullName,
  'guid': instance.guid,
  'display': instance.display,
};
