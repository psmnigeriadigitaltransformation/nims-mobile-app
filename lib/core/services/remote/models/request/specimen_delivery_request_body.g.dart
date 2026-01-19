// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specimen_delivery_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecimenDeliveryRequestImpl _$$SpecimenDeliveryRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SpecimenDeliveryRequestImpl(
  routeNo: json['route_no'] as String,
  shipmentNo: json['shipment_no'] as String,
  manifestNo: json['manifest_no'] as String,
  deliveryLatitude: json['delivery_latitude'] as String,
  deliveryLongitude: json['delivery_longitude'] as String,
  deliveryDate: json['delivery_date'] as String,
  destinationType: json['destination_type'] as String,
  approval: SpecimenDeliveryApproval.fromJson(
    json['approval'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$SpecimenDeliveryRequestImplToJson(
  _$SpecimenDeliveryRequestImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'shipment_no': instance.shipmentNo,
  'manifest_no': instance.manifestNo,
  'delivery_latitude': instance.deliveryLatitude,
  'delivery_longitude': instance.deliveryLongitude,
  'delivery_date': instance.deliveryDate,
  'destination_type': instance.destinationType,
  'approval': instance.approval,
};

_$SpecimenDeliveryApprovalImpl _$$SpecimenDeliveryApprovalImplFromJson(
  Map<String, dynamic> json,
) => _$SpecimenDeliveryApprovalImpl(
  approvalNo: json['approval_no'] as String,
  approvalType: json['approval_type'] as String,
  fullname: json['fullname'] as String,
  phone: json['phone'] as String,
  designation: json['designation'] as String,
  signature: json['signature'] as String,
  approvalDate: json['approval_date'] as String,
);

Map<String, dynamic> _$$SpecimenDeliveryApprovalImplToJson(
  _$SpecimenDeliveryApprovalImpl instance,
) => <String, dynamic>{
  'approval_no': instance.approvalNo,
  'approval_type': instance.approvalType,
  'fullname': instance.fullname,
  'phone': instance.phone,
  'designation': instance.designation,
  'signature': instance.signature,
  'approval_date': instance.approvalDate,
};
