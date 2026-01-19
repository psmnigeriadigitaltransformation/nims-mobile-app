// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specimen_delivery_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecimenDeliveryResponseImpl _$$SpecimenDeliveryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SpecimenDeliveryResponseImpl(
  status: json['status'] as String?,
  message: json['message'] as String?,
  routeUpdated: (json['route_updated'] as num?)?.toInt(),
  shipmentUpdated: (json['shipment_updated'] as num?)?.toInt(),
  approvalUpdated: (json['approval_updated'] as num?)?.toInt(),
  manifestUpdated: (json['manifest_updated'] as num?)?.toInt(),
  sampleUpdated: (json['sample_updated'] as num?)?.toInt(),
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  updated: (json['updated'] as List<dynamic>?)
      ?.map(
        (e) => SpecimenDeliveryUpdatedItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$$SpecimenDeliveryResponseImplToJson(
  _$SpecimenDeliveryResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'route_updated': instance.routeUpdated,
  'shipment_updated': instance.shipmentUpdated,
  'approval_updated': instance.approvalUpdated,
  'manifest_updated': instance.manifestUpdated,
  'sample_updated': instance.sampleUpdated,
  'errors': instance.errors,
  'updated': instance.updated,
};

_$SpecimenDeliveryUpdatedItemImpl _$$SpecimenDeliveryUpdatedItemImplFromJson(
  Map<String, dynamic> json,
) => _$SpecimenDeliveryUpdatedItemImpl(
  routeNo: json['route_no'] as String?,
  shipmentNo: json['shipment_no'] as String?,
  manifestNo: json['manifest_no'] as String?,
);

Map<String, dynamic> _$$SpecimenDeliveryUpdatedItemImplToJson(
  _$SpecimenDeliveryUpdatedItemImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'shipment_no': instance.shipmentNo,
  'manifest_no': instance.manifestNo,
};
