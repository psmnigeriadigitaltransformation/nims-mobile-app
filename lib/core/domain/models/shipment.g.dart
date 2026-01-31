// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipmentImpl _$$ShipmentImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentImpl(
      id: (json['id'] as num?)?.toInt(),
      shipmentNo: json['shipment_no'] as String,
      routeNo: json['route_no'] as String,
      manifestNo: json['manifest_no'] as String?,
      originId: json['origin_id'] as String,
      originType: json['origin_type'] as String,
      originFacilityName: json['origin_facility_name'] as String? ?? '',
      destinationLocationType: json['destination_location_type'] as String,
      destinationFacilityId: json['destination_facility_id'] as String,
      destinationFacilityName: json['destination_facility_name'] as String,
      pickupLatitude: (json['pickup_latitude'] as num).toDouble(),
      pickupLongitude: (json['pickup_longitude'] as num).toDouble(),
      sampleType: json['sample_type'] as String,
      sampleCount: (json['sample_count'] as num).toInt(),
      payloadType: json['payload_type'] as String? ?? 'specimen',
      pickupDate: json['pickup_date'] as String?,
      deliveryDate: json['delivery_date'] as String?,
      syncStatus: json['sync_status'] as String? ?? 'pending',
      stage: json['stage'] as String? ?? 'Pending',
    );

Map<String, dynamic> _$$ShipmentImplToJson(_$ShipmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipment_no': instance.shipmentNo,
      'route_no': instance.routeNo,
      'manifest_no': instance.manifestNo,
      'origin_id': instance.originId,
      'origin_type': instance.originType,
      'origin_facility_name': instance.originFacilityName,
      'destination_location_type': instance.destinationLocationType,
      'destination_facility_id': instance.destinationFacilityId,
      'destination_facility_name': instance.destinationFacilityName,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'sample_type': instance.sampleType,
      'sample_count': instance.sampleCount,
      'payload_type': instance.payloadType,
      'pickup_date': instance.pickupDate,
      'delivery_date': instance.deliveryDate,
      'sync_status': instance.syncStatus,
      'stage': instance.stage,
    };
