// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_sample_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RejectSampleRequestImpl _$$RejectSampleRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RejectSampleRequestImpl(
  sampleCode: json['sample_code'] as String,
  reason: json['reason'] as String,
  rejectionDate: json['rejection_date'] as String,
);

Map<String, dynamic> _$$RejectSampleRequestImplToJson(
  _$RejectSampleRequestImpl instance,
) => <String, dynamic>{
  'sample_code': instance.sampleCode,
  'reason': instance.reason,
  'rejection_date': instance.rejectionDate,
};
