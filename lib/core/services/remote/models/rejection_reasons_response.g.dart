// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rejection_reasons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RejectionReasonsResponseImpl _$$RejectionReasonsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RejectionReasonsResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => RejectionReasonItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$RejectionReasonsResponseImplToJson(
  _$RejectionReasonsResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$RejectionReasonItemImpl _$$RejectionReasonItemImplFromJson(
  Map<String, dynamic> json,
) => _$RejectionReasonItemImpl(reason: json['reason'] as String?);

Map<String, dynamic> _$$RejectionReasonItemImplToJson(
  _$RejectionReasonItemImpl instance,
) => <String, dynamic>{'reason': instance.reason};
