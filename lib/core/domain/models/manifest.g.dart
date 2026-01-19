// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManifestImpl _$$ManifestImplFromJson(Map<String, dynamic> json) =>
    _$ManifestImpl(
      id: (json['id'] as num?)?.toInt(),
      manifestNo: json['manifest_no'] as String,
      originId: json['origin_id'] as String,
      destinationId: json['destination_id'] as String,
      sampleType: json['sample_type'] as String,
      sampleCount: (json['sample_count'] as num).toInt(),
      phlebotomyNo: json['phlebotomy_no'] as String,
      lspCode: json['lsp_code'] as String,
      temperature: json['temperature'] as String?,
      userId: json['user_id'] as String,
      originatingFacilityName: json['originating_facility_name'] as String,
      destinationFacilityName: json['destination_facility_name'] as String,
      syncStatus: json['sync_status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$$ManifestImplToJson(_$ManifestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'manifest_no': instance.manifestNo,
      'origin_id': instance.originId,
      'destination_id': instance.destinationId,
      'sample_type': instance.sampleType,
      'sample_count': instance.sampleCount,
      'phlebotomy_no': instance.phlebotomyNo,
      'lsp_code': instance.lspCode,
      'temperature': instance.temperature,
      'user_id': instance.userId,
      'originating_facility_name': instance.originatingFacilityName,
      'destination_facility_name': instance.destinationFacilityName,
      'sync_status': instance.syncStatus,
    };
