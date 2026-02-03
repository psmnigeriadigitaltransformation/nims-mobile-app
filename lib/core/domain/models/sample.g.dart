// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleImpl _$$SampleImplFromJson(Map<String, dynamic> json) => _$SampleImpl(
  id: (json['id'] as num?)?.toInt(),
  manifestNo: json['manifest_no'] as String,
  originId: json['origin_id'] as String,
  sampleCode: json['sample_code'] as String,
  patientCode: json['patient_code'] as String,
  age: json['age'] as String,
  gender: json['gender'] as String,
  comment: json['comment'] as String?,
  syncStatus: json['sync_status'] as String? ?? 'pending',
  stage: json['stage'] as String? ?? 'Order',
  isRejected: (json['is_rejected'] as num?)?.toInt() ?? 0,
  rejectionReason: json['rejection_reason'] as String?,
  rejectionDate: json['rejection_date'] as String?,
  rejectionSyncStatus: json['rejection_sync_status'] as String?,
);

Map<String, dynamic> _$$SampleImplToJson(_$SampleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'manifest_no': instance.manifestNo,
      'origin_id': instance.originId,
      'sample_code': instance.sampleCode,
      'patient_code': instance.patientCode,
      'age': instance.age,
      'gender': instance.gender,
      'comment': instance.comment,
      'sync_status': instance.syncStatus,
      'stage': instance.stage,
      'is_rejected': instance.isRejected,
      'rejection_reason': instance.rejectionReason,
      'rejection_date': instance.rejectionDate,
      'rejection_sync_status': instance.rejectionSyncStatus,
    };
