import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_specimen_shipment_route_response.freezed.dart';
part 'create_specimen_shipment_route_response.g.dart';

@freezed
class CreateSpecimenShipmentRouteResponse with _$CreateSpecimenShipmentRouteResponse {
  const factory CreateSpecimenShipmentRouteResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required CreateSpecimenShipmentRouteData? data,
  }) = _CreateSpecimenShipmentRouteResponse;

  factory CreateSpecimenShipmentRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSpecimenShipmentRouteResponseFromJson(json);
}

@freezed
class CreateSpecimenShipmentRouteData with _$CreateSpecimenShipmentRouteData {
  const factory CreateSpecimenShipmentRouteData({
    @JsonKey(name: 'routes_processed') required int? routesProcessed,
    @JsonKey(name: 'routes_saved') required int? routesSaved,
    @JsonKey(name: 'approvals_saved') required int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required int? shipmentsSaved,
    required List<CreateShipmentRouteError>? errors,
  }) = _CreateSpecimenShipmentRouteData;

  factory CreateSpecimenShipmentRouteData.fromJson(Map<String, dynamic> json) =>
      _$CreateSpecimenShipmentRouteDataFromJson(json);
}

@freezed
class CreateShipmentRouteError with _$CreateShipmentRouteError {
  const factory CreateShipmentRouteError({
    @JsonKey(name: 'route_no') required String? routeNo,
    required String? message,
  }) = _CreateShipmentRouteError;

  factory CreateShipmentRouteError.fromJson(Map<String, dynamic> json) =>
      _$CreateShipmentRouteErrorFromJson(json);
}
