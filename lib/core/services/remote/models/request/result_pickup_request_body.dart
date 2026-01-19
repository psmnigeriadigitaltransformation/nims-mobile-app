import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_pickup_request_body.freezed.dart';
part 'result_pickup_request_body.g.dart';

@freezed
class ResultPickupRequest with _$ResultPickupRequest {
  const factory ResultPickupRequest({
    @JsonKey(name: 'route_no') required String routeNo,
    @JsonKey(name: 'origin_facility_id') required String originFacilityId,
    @JsonKey(name: 'destination_facility_id') required String destinationFacilityId,
    @JsonKey(name: 'lsp_code') required String lspCode,
    @JsonKey(name: 'rider_user_id') required String riderUserId,
    required String temperature,
    required String latitude,
    required String longitude,
    required ResultPickupShipment shipment,
    required List<String> samples,
    required ResultPickupApproval approval,
  }) = _ResultPickupRequest;

  factory ResultPickupRequest.fromJson(Map<String, dynamic> json) =>
      _$ResultPickupRequestFromJson(json);
}

@freezed
class ResultPickupShipment with _$ResultPickupShipment {
  const factory ResultPickupShipment({
    @JsonKey(name: 'shipment_no') required String shipmentNo,
    @JsonKey(name: 'origin_type') required String originType,
    @JsonKey(name: 'destination_type') required String destinationType,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'sample_count') required int sampleCount,
    @JsonKey(name: 'pickup_date') required String pickupDate,
  }) = _ResultPickupShipment;

  factory ResultPickupShipment.fromJson(Map<String, dynamic> json) =>
      _$ResultPickupShipmentFromJson(json);
}

@freezed
class ResultPickupApproval with _$ResultPickupApproval {
  const factory ResultPickupApproval({
    @JsonKey(name: 'approval_no') required String approvalNo,
    @JsonKey(name: 'approval_type') required String approvalType,
    required String fullname,
    required String phone,
    required String designation,
    required String signature,
    @JsonKey(name: 'approval_date') required String approvalDate,
  }) = _ResultPickupApproval;

  factory ResultPickupApproval.fromJson(Map<String, dynamic> json) =>
      _$ResultPickupApprovalFromJson(json);
}
