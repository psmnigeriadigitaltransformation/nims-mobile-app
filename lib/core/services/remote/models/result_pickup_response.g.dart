// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_pickup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultPickupResponseImpl _$$ResultPickupResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ResultPickupResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ResultPickupData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ResultPickupResponseImplToJson(
  _$ResultPickupResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$ResultPickupDataImpl _$$ResultPickupDataImplFromJson(
  Map<String, dynamic> json,
) => _$ResultPickupDataImpl(
  summary: json['summary'] == null
      ? null
      : ResultPickupSummary.fromJson(json['summary'] as Map<String, dynamic>),
  failedRoutes: (json['failed_routes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  errors: (json['errors'] as List<dynamic>?)
      ?.map((e) => ResultPickupError.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ResultPickupDataImplToJson(
  _$ResultPickupDataImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'failed_routes': instance.failedRoutes,
  'errors': instance.errors,
};

_$ResultPickupSummaryImpl _$$ResultPickupSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ResultPickupSummaryImpl(
  routesProcessed: (json['routes_processed'] as num?)?.toInt(),
  routesSaved: (json['routes_saved'] as num?)?.toInt(),
  approvalsSaved: (json['approvals_saved'] as num?)?.toInt(),
  shipmentsSaved: (json['shipments_saved'] as num?)?.toInt(),
  samplesUpdated: (json['samples_updated'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ResultPickupSummaryImplToJson(
  _$ResultPickupSummaryImpl instance,
) => <String, dynamic>{
  'routes_processed': instance.routesProcessed,
  'routes_saved': instance.routesSaved,
  'approvals_saved': instance.approvalsSaved,
  'shipments_saved': instance.shipmentsSaved,
  'samples_updated': instance.samplesUpdated,
};

_$ResultPickupErrorImpl _$$ResultPickupErrorImplFromJson(
  Map<String, dynamic> json,
) => _$ResultPickupErrorImpl(
  routeNo: json['route_no'] as String?,
  code: json['code'] as String?,
  message: json['message'] as String?,
  details: json['details'] as String?,
);

Map<String, dynamic> _$$ResultPickupErrorImplToJson(
  _$ResultPickupErrorImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'code': instance.code,
  'message': instance.message,
  'details': instance.details,
};
