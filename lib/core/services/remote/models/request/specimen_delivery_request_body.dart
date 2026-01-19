import 'package:freezed_annotation/freezed_annotation.dart';

part 'specimen_delivery_request_body.freezed.dart';
part 'specimen_delivery_request_body.g.dart';

@freezed
class SpecimenDeliveryRequest with _$SpecimenDeliveryRequest {
  const factory SpecimenDeliveryRequest({
    @JsonKey(name: 'route_no') required String routeNo,
    @JsonKey(name: 'shipment_no') required String shipmentNo,
    @JsonKey(name: 'manifest_no') required String manifestNo,
    @JsonKey(name: 'delivery_latitude') required String deliveryLatitude,
    @JsonKey(name: 'delivery_longitude') required String deliveryLongitude,
    @JsonKey(name: 'delivery_date') required String deliveryDate,
    @JsonKey(name: 'destination_type') required String destinationType,
    required SpecimenDeliveryApproval approval,
  }) = _SpecimenDeliveryRequest;

  factory SpecimenDeliveryRequest.fromJson(Map<String, dynamic> json) =>
      _$SpecimenDeliveryRequestFromJson(json);
}

@freezed
class SpecimenDeliveryApproval with _$SpecimenDeliveryApproval {
  const factory SpecimenDeliveryApproval({
    @JsonKey(name: 'approval_no') required String approvalNo,
    @JsonKey(name: 'approval_type') required String approvalType,
    required String fullname,
    required String phone,
    required String designation,
    required String signature,
    @JsonKey(name: 'approval_date') required String approvalDate,
  }) = _SpecimenDeliveryApproval;

  factory SpecimenDeliveryApproval.fromJson(Map<String, dynamic> json) =>
      _$SpecimenDeliveryApprovalFromJson(json);
}
