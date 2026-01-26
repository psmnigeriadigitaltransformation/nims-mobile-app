// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LabResultImpl _$$LabResultImplFromJson(Map<String, dynamic> json) =>
    _$LabResultImpl(
      sampleCode: json['sample_code'] as String,
      manifestNo: json['manifest_no'] as String,
      patientCode: json['patient_code'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      facilityId: json['facility_id'] as String,
      isPicked: (json['is_picked'] as num?)?.toInt() ?? 0,
      isRejected: (json['is_rejected'] as num?)?.toInt() ?? 0,
      rejectionSyncStatus: json['rejection_sync_status'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
      rejectionDate: json['rejection_date'] as String?,
      routeNo: json['route_no'] as String?,
    );

Map<String, dynamic> _$$LabResultImplToJson(_$LabResultImpl instance) =>
    <String, dynamic>{
      'sample_code': instance.sampleCode,
      'manifest_no': instance.manifestNo,
      'patient_code': instance.patientCode,
      'age': instance.age,
      'gender': instance.gender,
      'facility_id': instance.facilityId,
      'is_picked': instance.isPicked,
      'is_rejected': instance.isRejected,
      'rejection_sync_status': instance.rejectionSyncStatus,
      'rejection_reason': instance.rejectionReason,
      'rejection_date': instance.rejectionDate,
      'route_no': instance.routeNo,
    };
