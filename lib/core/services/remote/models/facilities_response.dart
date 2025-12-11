import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'facilities_response.freezed.dart';

part 'facilities_response.g.dart';

@freezed
class FacilitiesResponse with _$FacilitiesResponse {
  const factory FacilitiesResponse({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    FacilitiesData? data,
  }) = _FacilitiesResponse;

  factory FacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesResponseFromJson(json);
}

@freezed
class FacilitiesData with _$FacilitiesData {
  const factory FacilitiesData({
    // @FacilityItemListConverter()
    @JsonKey(name: 'spoke_list')
    List<FacilityItem>? spokeList,

    // @FacilityItemListConverter()
    @JsonKey(name: 'hub_list')
    List<FacilityItem>? hubList,

    // @FacilityItemListConverter()
    @JsonKey(name: 'genexpert_list')
    List<FacilityItem>? genexpertList,

    // @FacilityItemListConverter()
    @JsonKey(name: 'pcr_list')
    List<FacilityItem>? pcrList,
  }) = _FacilitiesData;

  factory FacilitiesData.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesDataFromJson(json);
}

@freezed
class FacilityItem with _$FacilityItem {
  const factory FacilityItem({
    @JsonKey(name: 'facility_id') int? facilityId,
    @JsonKey(name: 'facility_code') String? facilityCode,
    @JsonKey(name: 'lab_code') String? labCode,
    @JsonKey(name: 'facility_name') String? facilityName,
    @JsonKey(name: 'geo_string') String? geoString,
  }) = _FacilityItem;

  factory FacilityItem.fromJson(Map<String, dynamic> json) =>
      _$FacilityItemFromJson(json);
}

class FacilityItemListConverter
    implements JsonConverter<List<FacilityItem>?, dynamic> {
  const FacilityItemListConverter();

  @override
  List<FacilityItem>? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is String) {
      final list = jsonDecode(json) as List;
      return list.map((e) => FacilityItem.fromJson(e)).toList();
    } else if (json is List) {
      return json.map((e) => FacilityItem.fromJson(e)).toList();
    }
    return null;
  }

  @override
  dynamic toJson(List<FacilityItem>? items) {
    if (items == null) return null;
    return jsonEncode(items.map((e) => e.toJson()).toList());
  }
}
