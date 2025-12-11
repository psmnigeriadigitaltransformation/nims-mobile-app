import 'package:freezed_annotation/freezed_annotation.dart';
part 'movement_type.freezed.dart';

part 'movement_type.g.dart';
@freezed
class MovementType with _$MovementType {
  const factory MovementType({
    required int? id,
    required String? pick,
    @JsonKey(name: "type_id") required int? typeId,
    required String? movement,
    required String? created,
  }) = _MovementType;

  factory MovementType.fromJson(Map<String, dynamic> json) =>
      _$MovementTypeFromJson(json);
}