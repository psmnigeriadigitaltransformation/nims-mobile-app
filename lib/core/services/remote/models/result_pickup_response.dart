import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_pickup_response.freezed.dart';
part 'result_pickup_response.g.dart';

@freezed
class ResultPickupResponse with _$ResultPickupResponse {
  const factory ResultPickupResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required ResultPickupData? data,
  }) = _ResultPickupResponse;

  factory ResultPickupResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultPickupResponseFromJson(json);
}

@freezed
class ResultPickupData with _$ResultPickupData {
  const factory ResultPickupData({
    required ResultPickupSummary? summary,
    @JsonKey(name: 'failed_routes') required List<String>? failedRoutes,
    required List<ResultPickupError>? errors,
  }) = _ResultPickupData;

  factory ResultPickupData.fromJson(Map<String, dynamic> json) =>
      _$ResultPickupDataFromJson(json);
}

@freezed
class ResultPickupSummary with _$ResultPickupSummary {
  const factory ResultPickupSummary({
    @JsonKey(name: 'routes_processed') required int? routesProcessed,
    @JsonKey(name: 'routes_saved') required int? routesSaved,
    @JsonKey(name: 'approvals_saved') required int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required int? shipmentsSaved,
    @JsonKey(name: 'samples_updated') required int? samplesUpdated,
  }) = _ResultPickupSummary;

  factory ResultPickupSummary.fromJson(Map<String, dynamic> json) =>
      _$ResultPickupSummaryFromJson(json);
}

@freezed
class ResultPickupError with _$ResultPickupError {
  const factory ResultPickupError({
    @JsonKey(name: 'route_no') required String? routeNo,
    required String? code,
    required String? message,
    required String? details,
  }) = _ResultPickupError;

  factory ResultPickupError.fromJson(Map<String, dynamic> json) =>
      _$ResultPickupErrorFromJson(json);
}
