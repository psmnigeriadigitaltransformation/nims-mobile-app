import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_delivery_response.freezed.dart';
part 'result_delivery_response.g.dart';

@freezed
class ResultDeliveryResponse with _$ResultDeliveryResponse {
  const factory ResultDeliveryResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required ResultDeliveryData? data,
  }) = _ResultDeliveryResponse;

  factory ResultDeliveryResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultDeliveryResponseFromJson(json);
}

@freezed
class ResultDeliveryData with _$ResultDeliveryData {
  const factory ResultDeliveryData({
    required ResultDeliverySummary? summary,
    @JsonKey(name: 'route_no_failed') required List<String>? routeNoFailed,
    required List<ResultDeliveryError>? errors,
  }) = _ResultDeliveryData;

  factory ResultDeliveryData.fromJson(Map<String, dynamic> json) =>
      _$ResultDeliveryDataFromJson(json);
}

@freezed
class ResultDeliverySummary with _$ResultDeliverySummary {
  const factory ResultDeliverySummary({
    @JsonKey(name: 'routes_processed') required int? routesProcessed,
    @JsonKey(name: 'routes_saved') required int? routesSaved,
    @JsonKey(name: 'approvals_saved') required int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required int? shipmentsSaved,
    @JsonKey(name: 'samples_updated') required int? samplesUpdated,
  }) = _ResultDeliverySummary;

  factory ResultDeliverySummary.fromJson(Map<String, dynamic> json) =>
      _$ResultDeliverySummaryFromJson(json);
}

@freezed
class ResultDeliveryError with _$ResultDeliveryError {
  const factory ResultDeliveryError({
    @JsonKey(name: 'route_no') required String? routeNo,
    required String? message,
    required String? details,
  }) = _ResultDeliveryError;

  factory ResultDeliveryError.fromJson(Map<String, dynamic> json) =>
      _$ResultDeliveryErrorFromJson(json);
}
