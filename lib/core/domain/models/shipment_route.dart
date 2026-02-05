import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_route.freezed.dart';
part 'shipment_route.g.dart';

@freezed
class ShipmentRoute with _$ShipmentRoute {
  const factory ShipmentRoute({
    int? id,
    @JsonKey(name: 'route_no') required String routeNo,
    @JsonKey(name: 'route_type') required String routeType,
    @JsonKey(name: 'origin_facility_id') required String originFacilityId,
    @JsonKey(name: 'origin_facility_name') required String originFacilityName,
    @JsonKey(name: 'destination_facility_id') required String destinationFacilityId,
    @JsonKey(name: 'destination_facility_name') required String destinationFacilityName,
    @JsonKey(name: 'lsp_code') required String lspCode,
    @JsonKey(name: 'rider_user_id') required String riderUserId,
    double? latitude,
    double? longitude,
    String? temperature,
    @JsonKey(name: 'sync_status') @Default('pending') String syncStatus,
    @Default('Pending') String stage,
  }) = _ShipmentRoute;

  factory ShipmentRoute.fromJson(Map<String, dynamic> json) =>
      _$ShipmentRouteFromJson(json);
}
