// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApprovalImpl _$$ApprovalImplFromJson(Map<String, dynamic> json) =>
    _$ApprovalImpl(
      id: (json['id'] as num?)?.toInt(),
      approvalNo: json['approval_no'] as String,
      routeNo: json['route_no'] as String,
      approvalType: json['approval_type'] as String,
      fullname: json['full_name'] as String,
      phone: json['phone'] as String,
      designation: json['designation'] as String,
      signature: json['signature'] as String,
      approvalDate: json['approval_date'] as String?,
      syncStatus: json['sync_status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$$ApprovalImplToJson(_$ApprovalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'approval_no': instance.approvalNo,
      'route_no': instance.routeNo,
      'approval_type': instance.approvalType,
      'full_name': instance.fullname,
      'phone': instance.phone,
      'designation': instance.designation,
      'signature': instance.signature,
      'approval_date': instance.approvalDate,
      'sync_status': instance.syncStatus,
    };
