import 'package:freezed_annotation/freezed_annotation.dart';

part 'specimen_delivery_response.freezed.dart';
part 'specimen_delivery_response.g.dart';

@freezed
class SpecimenDeliveryResponse with _$SpecimenDeliveryResponse {
  const factory SpecimenDeliveryResponse({
    required String? status,
    required String? message,
    @JsonKey(name: 'route_updated') required int? routeUpdated,
    @JsonKey(name: 'shipment_updated') required int? shipmentUpdated,
    @JsonKey(name: 'approval_updated') required int? approvalUpdated,
    @JsonKey(name: 'manifest_updated') required int? manifestUpdated,
    @JsonKey(name: 'sample_updated') required int? sampleUpdated,
    required List<String>? errors,
    required List<SpecimenDeliveryUpdatedItem>? updated,
  }) = _SpecimenDeliveryResponse;

  factory SpecimenDeliveryResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecimenDeliveryResponseFromJson(json);
}

@freezed
class SpecimenDeliveryUpdatedItem with _$SpecimenDeliveryUpdatedItem {
  const factory SpecimenDeliveryUpdatedItem({
    @JsonKey(name: 'route_no') required String? routeNo,
    @JsonKey(name: 'shipment_no') required String? shipmentNo,
    @JsonKey(name: 'manifest_no') required String? manifestNo,
  }) = _SpecimenDeliveryUpdatedItem;

  factory SpecimenDeliveryUpdatedItem.fromJson(Map<String, dynamic> json) =>
      _$SpecimenDeliveryUpdatedItemFromJson(json);
}
