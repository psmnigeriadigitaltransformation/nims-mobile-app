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
  data: json['data'] == null
      ? null
      : DeleteManifestData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DeleteManifestResponseImplToJson(
  _$DeleteManifestResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$DeleteManifestDataImpl _$$DeleteManifestDataImplFromJson(
  Map<String, dynamic> json,
) => _$DeleteManifestDataImpl(
  manifestsDeleted: (json['manifests_deleted'] as num?)?.toInt(),
);

Map<String, dynamic> _$$DeleteManifestDataImplToJson(
  _$DeleteManifestDataImpl instance,
) => <String, dynamic>{'manifests_deleted': instance.manifestsDeleted};
