import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_result_shipment_route_request_body.freezed.dart';
part 'create_result_shipment_route_request_body.g.dart';

@freezed
class CreateResultShipmentRouteRequest with _$CreateResultShipmentRouteRequest {
  const factory CreateResultShipmentRouteRequest({
    @JsonKey(name: 'route_no') required String routeNo,
    @JsonKey(name: 'origin_facility_id') required String originFacilityId,
    @JsonKey(name: 'destination_facility_id') required String destinationFacilityId,
    @JsonKey(name: 'lsp_code') required String lspCode,
    @JsonKey(name: 'rider_user_id') required String riderUserId,
    required String temperature,
    required String latitude,
    required String longitude,
    @JsonKey(name: 'shipment') required ResultShipment shipment,
    required List<String> samples,
    required ResultShipmentApproval approval,
  }) = _CreateResultShipmentRouteRequest;

  factory CreateResultShipmentRouteRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateResultShipmentRouteRequestFromJson(json);
}

@freezed
class ResultShipment with _$ResultShipment {
  const factory ResultShipment({
    @JsonKey(name: 'shipment_no') required String shipmentNo,
    @JsonKey(name: 'origin_type') required String originType,
    @JsonKey(name: 'destination_type') required String destinationType,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'sample_count') required int sampleCount,
    @JsonKey(name: 'pickup_date') required String pickupDate,
  }) = _ResultShipment;

  factory ResultShipment.fromJson(Map<String, dynamic> json) =>
      _$ResultShipmentFromJson(json);
}

@freezed
class ResultShipmentApproval with _$ResultShipmentApproval {
  const factory ResultShipmentApproval({
    @JsonKey(name: 'approval_no') required String approvalNo,
    @JsonKey(name: 'approval_type') required String approvalType,
    required String fullname,
    required String phone,
    required String designation,
    required String signature,
    @JsonKey(name: 'approval_date') required String approvalDate,
  }) = _ResultShipmentApproval;

  factory ResultShipmentApproval.fromJson(Map<String, dynamic> json) =>
      _$ResultShipmentApprovalFromJson(json);
}
