import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_delivery_request_body.freezed.dart';
part 'result_delivery_request_body.g.dart';

@freezed
class ResultDeliveryRequest with _$ResultDeliveryRequest {
  const factory ResultDeliveryRequest({
    @JsonKey(name: 'route_no') required String routeNo,
    required String latitude,
    required String longitude,
    @JsonKey(name: 'shipment') required ResultDeliveryShipment shipment,
    required List<String> samples,
    required ResultDeliveryApproval approval,
  }) = _ResultDeliveryRequest;

  factory ResultDeliveryRequest.fromJson(Map<String, dynamic> json) =>
      _$ResultDeliveryRequestFromJson(json);
}

@freezed
class ResultDeliveryShipment with _$ResultDeliveryShipment {
  const factory ResultDeliveryShipment({
    @JsonKey(name: 'shipment_no') required String shipmentNo,
    @JsonKey(name: 'origin_type') required String originType,
    @JsonKey(name: 'destination_type') required String destinationType,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'sample_count') required int sampleCount,
    @JsonKey(name: 'delivery_date') required String deliveryDate,
  }) = _ResultDeliveryShipment;

  factory ResultDeliveryShipment.fromJson(Map<String, dynamic> json) =>
      _$ResultDeliveryShipmentFromJson(json);
}

@freezed
class ResultDeliveryApproval with _$ResultDeliveryApproval {
  const factory ResultDeliveryApproval({
    @JsonKey(name: 'approval_no') required String approvalNo,
    @JsonKey(name: 'approval_type') required String approvalType,
    required String fullname,
    required String phone,
    required String designation,
    required String signature,
    @JsonKey(name: 'approval_date') required String approvalDate,
  }) = _ResultDeliveryApproval;

  factory ResultDeliveryApproval.fromJson(Map<String, dynamic> json) =>
      _$ResultDeliveryApprovalFromJson(json);
}
