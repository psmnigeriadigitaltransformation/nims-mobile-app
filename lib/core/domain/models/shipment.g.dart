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
      manifestNo: json['manifest_no'] as String,
      originType: json['origin_type'] as String,
      destinationLocationType: json['destination_location_type'] as String,
      destinationFacilityId: json['destination_facility_id'] as String,
      destinationFacilityName: json['destination_facility_name'] as String,
      pickupLatitude: (json['pickup_latitude'] as num).toDouble(),
      pickupLongitude: (json['pickup_longitude'] as num).toDouble(),
      sampleType: json['sample_type'] as String,
      sampleCount: (json['sample_count'] as num).toInt(),
      pickupDate: json['pickup_date'] as String?,
    );

Map<String, dynamic> _$$ShipmentImplToJson(_$ShipmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipment_no': instance.shipmentNo,
      'route_no': instance.routeNo,
      'manifest_no': instance.manifestNo,
      'origin_type': instance.originType,
      'destination_location_type': instance.destinationLocationType,
      'destination_facility_id': instance.destinationFacilityId,
      'destination_facility_name': instance.destinationFacilityName,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'sample_type': instance.sampleType,
      'sample_count': instance.sampleCount,
      'pickup_date': instance.pickupDate,
    };
