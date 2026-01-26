import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_specimen_shipment_route_request_body.freezed.dart';
part 'create_specimen_shipment_route_request_body.g.dart';

@freezed
class CreateSpecimenShipmentRouteRequest with _$CreateSpecimenShipmentRouteRequest {
  const factory CreateSpecimenShipmentRouteRequest({
    @JsonKey(name: 'route_no') required String routeNo,
    @JsonKey(name: 'origin_facility_id') required String originFacilityId,
    @JsonKey(name: 'destination_facility_id') required String destinationFacilityId,
    @JsonKey(name: 'lsp_code') required String lspCode,
    @JsonKey(name: 'rider_user_id') required String riderUserId,
    required String latitude,
    required String longitude,
    required List<Shipment> shipment,
    required Approval approval,
  }) = _CreateSpecimenShipmentRouteRequest;

  factory CreateSpecimenShipmentRouteRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSpecimenShipmentRouteRequestFromJson(json);
}

@freezed
class Shipment with _$Shipment {
  const factory Shipment({
    @JsonKey(name: 'shipment_no') required String shipmentNo,
    @JsonKey(name: 'manifest_no') required String manifestNo,
    @JsonKey(name: 'origin_type') required String originType,
    @JsonKey(name: 'destination_type') required String destinationType,
    @JsonKey(name: 'pickup_latitude') required String pickupLatitude,
    @JsonKey(name: 'pickup_longitude') required String pickupLongitude,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'sample_count') required int sampleCount,
    @JsonKey(name: 'pickup_date') required String pickupDate,
  }) = _Shipment;

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);
}

@freezed
class Approval with _$Approval {
  const factory Approval({
    @JsonKey(name: 'approval_no') required String approvalNo,
    @JsonKey(name: 'approval_type') required String approvalType,
    required String fullname,
    required String phone,
    required String designation,
    required String signature,
    @JsonKey(name: 'approval_date') required String approvalDate,
  }) = _Approval;

  factory Approval.fromJson(Map<String, dynamic> json) =>
      _$ApprovalFromJson(json);
}
