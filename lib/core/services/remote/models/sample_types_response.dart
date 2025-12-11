import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_types_response.freezed.dart';
part 'sample_types_response.g.dart';

@freezed
class SampleTypesResponse with _$SampleTypesResponse {
  const factory SampleTypesResponse({
    @JsonKey(name: "result_code") required int? resultCode,
    required String? status,
    required String? message,
    required List<SampleTypeItem>? data,
  }) = _SampleTypesResponse;

  factory SampleTypesResponse.fromJson(Map<String, dynamic> json)
  => _$SampleTypesResponseFromJson(json);
}

@freezed
class SampleTypeItem with _$SampleTypeItem {
  const factory SampleTypeItem({
    required String? pick,
    required int? id,
    @JsonKey(name: "fullname") required String? fullName,
  }) = _SampleTypeItem;

  factory SampleTypeItem.fromJson(Map<String, dynamic> json)
  => _$SampleTypeItemFromJson(json);
}
