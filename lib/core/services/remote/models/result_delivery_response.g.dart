// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_delivery_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDeliveryResponseImpl _$$ResultDeliveryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ResultDeliveryResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ResultDeliveryData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ResultDeliveryResponseImplToJson(
  _$ResultDeliveryResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$ResultDeliveryDataImpl _$$ResultDeliveryDataImplFromJson(
  Map<String, dynamic> json,
) => _$ResultDeliveryDataImpl(
  summary: json['summary'] == null
      ? null
      : ResultDeliverySummary.fromJson(json['summary'] as Map<String, dynamic>),
  routeNoFailed: (json['route_no_failed'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  errors: (json['errors'] as List<dynamic>?)
      ?.map((e) => ResultDeliveryError.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ResultDeliveryDataImplToJson(
  _$ResultDeliveryDataImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'route_no_failed': instance.routeNoFailed,
  'errors': instance.errors,
};

_$ResultDeliverySummaryImpl _$$ResultDeliverySummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ResultDeliverySummaryImpl(
  routesProcessed: (json['routes_processed'] as num?)?.toInt(),
  routesSaved: (json['routes_saved'] as num?)?.toInt(),
  approvalsSaved: (json['approvals_saved'] as num?)?.toInt(),
  shipmentsSaved: (json['shipments_saved'] as num?)?.toInt(),
  samplesUpdated: (json['samples_updated'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ResultDeliverySummaryImplToJson(
  _$ResultDeliverySummaryImpl instance,
) => <String, dynamic>{
  'routes_processed': instance.routesProcessed,
  'routes_saved': instance.routesSaved,
  'approvals_saved': instance.approvalsSaved,
  'shipments_saved': instance.shipmentsSaved,
  'samples_updated': instance.samplesUpdated,
};

_$ResultDeliveryErrorImpl _$$ResultDeliveryErrorImplFromJson(
  Map<String, dynamic> json,
) => _$ResultDeliveryErrorImpl(
  routeNo: json['route_no'] as String?,
  message: json['message'] as String?,
  details: json['details'] as String?,
);

Map<String, dynamic> _$$ResultDeliveryErrorImplToJson(
  _$ResultDeliveryErrorImpl instance,
) => <String, dynamic>{
  'route_no': instance.routeNo,
  'message': instance.message,
  'details': instance.details,
};
