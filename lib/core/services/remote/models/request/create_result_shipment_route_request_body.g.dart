// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_result_shipment_route_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateResultShipmentRouteRequestImpl
_$$CreateResultShipmentRouteRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateResultShipmentRouteRequestImpl(
  routeNo: json['route_no'] as String,
  originFacilityId: json['origin_facility_id'] as String,
  destinationFacilityId: json['destination_facility_id'] as String,
  lspCode: json['lsp_code'] as String,
  riderUserId: json['rider_user_id'] as String,
  temperature: json['temperature'] as String,
  latitude: json['latitude'] as String,
  longitude: json['longitude'] as String,
  shipment: ResultShipment.fromJson(json['shipment'] as Map<String, dynamic>),
  samples: (json['samples'] as List<dynamic>).map((e) => e as String).toList(),
  approval: ResultShipmentApproval.fromJson(
    json['approval'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$CreateResultShipmentRouteRequestImplToJson(
  _$CreateResultShipmentRouteRequestImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'origin_facility_id': instance.originFacilityId,
  'destination_facility_id': instance.destinationFacilityId,
  'lsp_code': instance.lspCode,
  'rider_user_id': instance.riderUserId,
  'temperature': instance.temperature,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'shipment': instance.shipment,
  'samples': instance.samples,
  'approval': instance.approval,
};

_$ResultShipmentImpl _$$ResultShipmentImplFromJson(Map<String, dynamic> json) =>
    _$ResultShipmentImpl(
      shipmentNo: json['shipment_no'] as String,
      originType: json['origin_type'] as String,
      destinationType: json['destination_type'] as String,
      sampleType: json['sample_type'] as String,
      sampleCount: (json['sample_count'] as num).toInt(),
      pickupDate: json['pickup_date'] as String,
    );

Map<String, dynamic> _$$ResultShipmentImplToJson(
  _$ResultShipmentImpl instance,
) => <String, dynamic>{
  'shipment_no': instance.shipmentNo,
  'origin_type': instance.originType,
  'destination_type': instance.destinationType,
  'sample_type': instance.sampleType,
  'sample_count': instance.sampleCount,
  'pickup_date': instance.pickupDate,
};

_$ResultShipmentApprovalImpl _$$ResultShipmentApprovalImplFromJson(
  Map<String, dynamic> json,
) => _$ResultShipmentApprovalImpl(
  approvalNo: json['approval_no'] as String,
  approvalType: json['approval_type'] as String,
  fullname: json['fullname'] as String,
  phone: json['phone'] as String,
  designation: json['designation'] as String,
  signature: json['signature'] as String,
  approvalDate: json['approval_date'] as String,
);

Map<String, dynamic> _$$ResultShipmentApprovalImplToJson(
  _$ResultShipmentApprovalImpl instance,
) => <String, dynamic>{
  'approval_no': instance.approvalNo,
  'approval_type': instance.approvalType,
  'fullname': instance.fullname,
  'phone': instance.phone,
  'designation': instance.designation,
  'signature': instance.signature,
  'approval_date': instance.approvalDate,
};
