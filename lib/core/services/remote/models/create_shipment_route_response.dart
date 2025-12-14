import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_shipment_route_response.freezed.dart';
part 'create_shipment_route_response.g.dart';

@freezed
class CreateShipmentRouteResponse with _$CreateShipmentRouteResponse {
  const factory CreateShipmentRouteResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required CreateShipmentData? data,
  }) = _CreateShipmentRouteResponse;

  factory CreateShipmentRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateShipmentRouteResponseFromJson(json);
}

@freezed
class CreateShipmentData with _$CreateShipmentData {
  const factory CreateShipmentData({
    @JsonKey(name: 'routes_processed') required int? routesProcessed,
    @JsonKey(name: 'routes_saved') required int? routesSaved,
    @JsonKey(name: 'approvals_saved') required int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required int? shipmentsSaved,
    required List<CreateShipmentError>? errors,
  }) = _CreateShipmentData;

  factory CreateShipmentData.fromJson(Map<String, dynamic> json) =>
      _$CreateShipmentDataFromJson(json);
}

@freezed
class CreateShipmentError with _$CreateShipmentError {
  const factory CreateShipmentError({
    @JsonKey(name: 'route_no') required String? routeNo,
    required String? message,
  }) = _CreateShipmentError;

  factory CreateShipmentError.fromJson(Map<String, dynamic> json) =>
      _$CreateShipmentErrorFromJson(json);
}
