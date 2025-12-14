import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment.freezed.dart';
part 'shipment.g.dart';

@freezed
class Shipment with _$Shipment {
  const factory Shipment({
    int? id,
    @JsonKey(name: 'shipment_no') required String shipmentNo,
    @JsonKey(name: 'route_no') required String routeNo,
    @JsonKey(name: 'manifest_no') required String manifestNo,
    @JsonKey(name: 'origin_type') required String originType,
    @JsonKey(name: 'destination_type') required String destinationType,
    @JsonKey(name: 'pickup_latitude') required double pickupLatitude,
    @JsonKey(name: 'pickup_longitude') required double pickupLongitude,
    @JsonKey(name: 'sample_type') required String sampleType,
    @JsonKey(name: 'sample_count') required int sampleCount,
    @JsonKey(name: 'pickup_date') String? pickupDate,
  }) = _Shipment;

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);
}
