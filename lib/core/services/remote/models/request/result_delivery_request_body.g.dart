// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_delivery_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDeliveryRequestImpl _$$ResultDeliveryRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ResultDeliveryRequestImpl(
  routeNo: json['route_no'] as String,
  latitude: json['latitude'] as String,
  longitude: json['longitude'] as String,
  shipment: ResultDeliveryShipment.fromJson(
    json['shipment'] as Map<String, dynamic>,
  ),
  samples: (json['samples'] as List<dynamic>).map((e) => e as String).toList(),
  approval: ResultDeliveryApproval.fromJson(
    json['approval'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$ResultDeliveryRequestImplToJson(
  _$ResultDeliveryRequestImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'shipment': instance.shipment,
  'samples': instance.samples,
  'approval': instance.approval,
};

_$ResultDeliveryShipmentImpl _$$ResultDeliveryShipmentImplFromJson(
  Map<String, dynamic> json,
) => _$ResultDeliveryShipmentImpl(
  shipmentNo: json['shipment_no'] as String,
  originType: json['origin_type'] as String,
  destinationType: json['destination_type'] as String,
  sampleType: json['sample_type'] as String,
  sampleCount: (json['sample_count'] as num).toInt(),
  deliveryDate: json['delivery_date'] as String,
);

Map<String, dynamic> _$$ResultDeliveryShipmentImplToJson(
  _$ResultDeliveryShipmentImpl instance,
) => <String, dynamic>{
  'shipment_no': instance.shipmentNo,
  'origin_type': instance.originType,
  'destination_type': instance.destinationType,
  'sample_type': instance.sampleType,
  'sample_count': instance.sampleCount,
  'delivery_date': instance.deliveryDate,
};

_$ResultDeliveryApprovalImpl _$$ResultDeliveryApprovalImplFromJson(
  Map<String, dynamic> json,
) => _$ResultDeliveryApprovalImpl(
  approvalNo: json['approval_no'] as String,
  approvalType: json['approval_type'] as String,
  fullname: json['fullname'] as String,
  phone: json['phone'] as String,
  designation: json['designation'] as String,
  signature: json['signature'] as String,
  approvalDate: json['approval_date'] as String,
);

Map<String, dynamic> _$$ResultDeliveryApprovalImplToJson(
  _$ResultDeliveryApprovalImpl instance,
) => <String, dynamic>{
  'approval_no': instance.approvalNo,
  'approval_type': instance.approvalType,
  'fullname': instance.fullname,
  'phone': instance.phone,
  'designation': instance.designation,
  'signature': instance.signature,
  'approval_date': instance.approvalDate,
};
