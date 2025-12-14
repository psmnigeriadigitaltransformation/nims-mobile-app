// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shipment_route_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateShipmentRouteResponseImpl _$$CreateShipmentRouteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateShipmentRouteResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : CreateShipmentData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CreateShipmentRouteResponseImplToJson(
  _$CreateShipmentRouteResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$CreateShipmentDataImpl _$$CreateShipmentDataImplFromJson(
  Map<String, dynamic> json,
) => _$CreateShipmentDataImpl(
  routesProcessed: (json['routes_processed'] as num?)?.toInt(),
  routesSaved: (json['routes_saved'] as num?)?.toInt(),
  approvalsSaved: (json['approvals_saved'] as num?)?.toInt(),
  shipmentsSaved: (json['shipments_saved'] as num?)?.toInt(),
  errors: (json['errors'] as List<dynamic>?)
      ?.map((e) => CreateShipmentError.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreateShipmentDataImplToJson(
  _$CreateShipmentDataImpl instance,
) => <String, dynamic>{
  'routes_processed': instance.routesProcessed,
  'routes_saved': instance.routesSaved,
  'approvals_saved': instance.approvalsSaved,
  'shipments_saved': instance.shipmentsSaved,
  'errors': instance.errors,
};

_$CreateShipmentErrorImpl _$$CreateShipmentErrorImplFromJson(
  Map<String, dynamic> json,
) => _$CreateShipmentErrorImpl(
  routeNo: json['route_no'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$CreateShipmentErrorImplToJson(
  _$CreateShipmentErrorImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'message': instance.message,
};
