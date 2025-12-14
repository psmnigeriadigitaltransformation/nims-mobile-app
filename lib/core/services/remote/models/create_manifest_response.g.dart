// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_manifest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateManifestResponseImpl _$$CreateManifestResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateManifestResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : CreateManifestData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CreateManifestResponseImplToJson(
  _$CreateManifestResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$ManifestCreateDataImpl _$$ManifestCreateDataImplFromJson(
  Map<String, dynamic> json,
) => _$ManifestCreateDataImpl(
  manifestsSaved: (json['manifests_saved'] as num?)?.toInt(),
  samplesSaved: (json['samples_saved'] as num?)?.toInt(),
  manifestsNoSaved: (json['manifests_no_saved'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  manifestsNoFailed: (json['manifests_no_failed'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  errors: (json['errors'] as List<dynamic>?)
      ?.map((e) => CreateManifestError.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ManifestCreateDataImplToJson(
  _$ManifestCreateDataImpl instance,
) => <String, dynamic>{
  'manifests_saved': instance.manifestsSaved,
  'samples_saved': instance.samplesSaved,
  'manifests_no_saved': instance.manifestsNoSaved,
  'manifests_no_failed': instance.manifestsNoFailed,
  'errors': instance.errors,
};

_$CreateManifestErrorImpl _$$CreateManifestErrorImplFromJson(
  Map<String, dynamic> json,
) => _$CreateManifestErrorImpl(
  manifestNo: json['manifest_no'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$CreateManifestErrorImplToJson(
  _$CreateManifestErrorImpl instance,
) => <String, dynamic>{
  'manifest_no': instance.manifestNo,
  'message': instance.message,
};
