// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_specimen_shipment_route_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSpecimenShipmentRouteResponseImpl
_$$CreateSpecimenShipmentRouteResponseImplFromJson(Map<String, dynamic> json) =>
    _$CreateSpecimenShipmentRouteResponseImpl(
      resultCode: (json['result_code'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CreateSpecimenShipmentRouteData.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$CreateSpecimenShipmentRouteResponseImplToJson(
  _$CreateSpecimenShipmentRouteResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$CreateSpecimenShipmentRouteDataImpl
_$$CreateSpecimenShipmentRouteDataImplFromJson(Map<String, dynamic> json) =>
    _$CreateSpecimenShipmentRouteDataImpl(
      routesProcessed: (json['routes_processed'] as num?)?.toInt(),
      routesSaved: (json['routes_saved'] as num?)?.toInt(),
      approvalsSaved: (json['approvals_saved'] as num?)?.toInt(),
      shipmentsSaved: (json['shipments_saved'] as num?)?.toInt(),
      errors: (json['errors'] as List<dynamic>?)
          ?.map(
            (e) => CreateShipmentRouteError.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$$CreateSpecimenShipmentRouteDataImplToJson(
  _$CreateSpecimenShipmentRouteDataImpl instance,
) => <String, dynamic>{
  'routes_processed': instance.routesProcessed,
  'routes_saved': instance.routesSaved,
  'approvals_saved': instance.approvalsSaved,
  'shipments_saved': instance.shipmentsSaved,
  'errors': instance.errors,
};

_$CreateShipmentRouteErrorImpl _$$CreateShipmentRouteErrorImplFromJson(
  Map<String, dynamic> json,
) => _$CreateShipmentRouteErrorImpl(
  routeNo: json['route_no'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$CreateShipmentRouteErrorImplToJson(
  _$CreateShipmentRouteErrorImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'message': instance.message,
};
