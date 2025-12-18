// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipmentRouteImpl _$$ShipmentRouteImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentRouteImpl(
      id: (json['id'] as num?)?.toInt(),
      routeNo: json['route_no'] as String,
      originFacilityId: json['origin_facility_id'] as String,
      destinationFacilityId: json['destination_facility_id'] as String,
      lspCode: json['lsp_code'] as String,
      riderUserId: json['rider_user_id'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ShipmentRouteImplToJson(_$ShipmentRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route_no': instance.routeNo,
      'origin_facility_id': instance.originFacilityId,
      'destination_facility_id': instance.destinationFacilityId,
      'lsp_code': instance.lspCode,
      'rider_user_id': instance.riderUserId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
