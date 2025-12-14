// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_manifest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteManifestResponseImpl _$$DeleteManifestResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DeleteManifestResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] as bool?,
);

Map<String, dynamic> _$$DeleteManifestResponseImplToJson(
  _$DeleteManifestResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
