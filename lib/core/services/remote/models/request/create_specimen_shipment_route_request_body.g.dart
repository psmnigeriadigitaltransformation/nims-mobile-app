// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_specimen_shipment_route_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSpecimenShipmentRouteRequestImpl
_$$CreateSpecimenShipmentRouteRequestImplFromJson(Map<String, dynamic> json) =>
    _$CreateSpecimenShipmentRouteRequestImpl(
      routeNo: json['route_no'] as String,
      originFacilityId: json['origin_facility_id'] as String,
      destinationFacilityId: json['destination_facility_id'] as String,
      lspCode: json['lsp_code'] as String,
      riderUserId: json['rider_user_id'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      temperature: json['temperature'] as String,
      shipment: (json['shipment'] as List<dynamic>)
          .map((e) => Shipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      approval: Approval.fromJson(json['approval'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateSpecimenShipmentRouteRequestImplToJson(
  _$CreateSpecimenShipmentRouteRequestImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'origin_facility_id': instance.originFacilityId,
  'destination_facility_id': instance.destinationFacilityId,
  'lsp_code': instance.lspCode,
  'rider_user_id': instance.riderUserId,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'temperature': instance.temperature,
  'shipment': instance.shipment,
  'approval': instance.approval,
};

_$ShipmentImpl _$$ShipmentImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentImpl(
      shipmentNo: json['shipment_no'] as String,
      manifestNo: json['manifest_no'] as String,
      originType: json['origin_type'] as String,
      destinationType: json['destination_type'] as String,
      pickupLatitude: json['pickup_latitude'] as String,
      pickupLongitude: json['pickup_longitude'] as String,
      sampleType: json['sample_type'] as String,
      sampleCount: (json['sample_count'] as num).toInt(),
      pickupDate: json['pickup_date'] as String,
    );

Map<String, dynamic> _$$ShipmentImplToJson(_$ShipmentImpl instance) =>
    <String, dynamic>{
      'shipment_no': instance.shipmentNo,
      'manifest_no': instance.manifestNo,
      'origin_type': instance.originType,
      'destination_type': instance.destinationType,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'sample_type': instance.sampleType,
      'sample_count': instance.sampleCount,
      'pickup_date': instance.pickupDate,
    };

_$ApprovalImpl _$$ApprovalImplFromJson(Map<String, dynamic> json) =>
    _$ApprovalImpl(
      approvalNo: json['approval_no'] as String,
      approvalType: json['approval_type'] as String,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      designation: json['designation'] as String,
      signature: json['signature'] as String,
      approvalDate: json['approval_date'] as String,
    );

Map<String, dynamic> _$$ApprovalImplToJson(_$ApprovalImpl instance) =>
    <String, dynamic>{
      'approval_no': instance.approvalNo,
      'approval_type': instance.approvalType,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'designation': instance.designation,
      'signature': instance.signature,
      'approval_date': instance.approvalDate,
    };
