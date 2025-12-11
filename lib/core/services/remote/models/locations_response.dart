import 'package:freezed_annotation/freezed_annotation.dart';

part 'locations_response.freezed.dart';
part 'locations_response.g.dart';

@freezed
class LocationResponse with _$LocationResponse {
  const factory LocationResponse({
    @JsonKey(name: "result_code") required int? resultCode,
    required String? status,
    required String? message,
    required List<LocationItem>? data,
  }) = _LocationResponse;

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);
}

@freezed
class LocationItem with _$LocationItem {
  const factory LocationItem({
    required String? pick,
    @JsonKey(name: "location_id") required int? locationId,
    required String? location,
    required String? created,
  }) = _LocationItem;

  factory LocationItem.fromJson(Map<String, dynamic> json) =>
      _$LocationItemFromJson(json);
}
