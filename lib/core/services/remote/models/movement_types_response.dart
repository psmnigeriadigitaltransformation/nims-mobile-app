import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement_types_response.freezed.dart';
part 'movement_types_response.g.dart';

@freezed
class MovementTypesResponse with _$MovementTypesResponse {
  const factory MovementTypesResponse({
    @JsonKey(name: "result_code") required int? resultCode,
    required String? status,
    required String? message,
    // @MovementTypeItemListConverter()
    required List<MovementTypeItem>? data,
  }) = _MovementTypesResponse;

  factory MovementTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovementTypesResponseFromJson(json);
}

@freezed
class MovementTypeItem with _$MovementTypeItem {
  const factory MovementTypeItem({
    required String? pick,
    @JsonKey(name: "type_id") required int? typeId,
    required String? movement,
    required String? created,
  }) = _MovementTypeItem;

  factory MovementTypeItem.fromJson(Map<String, dynamic> json) =>
      _$MovementTypeItemFromJson(json);
}

class MovementTypeItemListConverter
    implements JsonConverter<List<MovementTypeItem>?, dynamic> {
  const MovementTypeItemListConverter();

  @override
  List<MovementTypeItem>? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is String) {
      final list = jsonDecode(json) as List;
      return list.map((e) => MovementTypeItem.fromJson(e)).toList();
    } else if (json is List) {
      return json.map((e) => MovementTypeItem.fromJson(e)).toList();
    }
    return null;
  }

  @override
  dynamic toJson(List<MovementTypeItem>? items) {
    if (items == null) return null;
    return jsonEncode(items.map((e) => e.toJson()).toList());
  }
}
