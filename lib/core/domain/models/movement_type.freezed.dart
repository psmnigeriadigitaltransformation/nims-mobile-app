// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model',
);

MovementType _$MovementTypeFromJson(Map<String, dynamic> json) {
  return _MovementType.fromJson(json);
}

/// @nodoc
mixin _$MovementType {
  int? get id => throw _privateConstructorUsedError;
  String? get pick => throw _privateConstructorUsedError;
  @JsonKey(name: "type_id")
  int? get typeId => throw _privateConstructorUsedError;
  String? get movement => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this MovementType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovementType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovementTypeCopyWith<MovementType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementTypeCopyWith<$Res> {
  factory $MovementTypeCopyWith(
    MovementType value,
    $Res Function(MovementType) then,
  ) = _$MovementTypeCopyWithImpl<$Res, MovementType>;
  @useResult
  $Res call({
    int? id,
    String? pick,
    @JsonKey(name: "type_id") int? typeId,
    String? movement,
    String? created,
    String? category,
  });
}

/// @nodoc
class _$MovementTypeCopyWithImpl<$Res, $Val extends MovementType>
    implements $MovementTypeCopyWith<$Res> {
  _$MovementTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovementType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pick = freezed,
    Object? typeId = freezed,
    Object? movement = freezed,
    Object? created = freezed,
    Object? category = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            pick: freezed == pick
                ? _value.pick
                : pick // ignore: cast_nullable_to_non_nullable
                      as String?,
            typeId: freezed == typeId
                ? _value.typeId
                : typeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            movement: freezed == movement
                ? _value.movement
                : movement // ignore: cast_nullable_to_non_nullable
                      as String?,
            created: freezed == created
                ? _value.created
                : created // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovementTypeImplCopyWith<$Res>
    implements $MovementTypeCopyWith<$Res> {
  factory _$$MovementTypeImplCopyWith(
    _$MovementTypeImpl value,
    $Res Function(_$MovementTypeImpl) then,
  ) = __$$MovementTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? pick,
    @JsonKey(name: "type_id") int? typeId,
    String? movement,
    String? created,
    String? category,
  });
}

/// @nodoc
class __$$MovementTypeImplCopyWithImpl<$Res>
    extends _$MovementTypeCopyWithImpl<$Res, _$MovementTypeImpl>
    implements _$$MovementTypeImplCopyWith<$Res> {
  __$$MovementTypeImplCopyWithImpl(
    _$MovementTypeImpl _value,
    $Res Function(_$MovementTypeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovementType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pick = freezed,
    Object? typeId = freezed,
    Object? movement = freezed,
    Object? created = freezed,
    Object? category = freezed,
  }) {
    return _then(
      _$MovementTypeImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        pick: freezed == pick
            ? _value.pick
            : pick // ignore: cast_nullable_to_non_nullable
                  as String?,
        typeId: freezed == typeId
            ? _value.typeId
            : typeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        movement: freezed == movement
            ? _value.movement
            : movement // ignore: cast_nullable_to_non_nullable
                  as String?,
        created: freezed == created
            ? _value.created
            : created // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementTypeImpl implements _MovementType {
  const _$MovementTypeImpl({
    required this.id,
    required this.pick,
    @JsonKey(name: "type_id") required this.typeId,
    required this.movement,
    required this.created,
    required this.category,
  });

  factory _$MovementTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovementTypeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? pick;
  @override
  @JsonKey(name: "type_id")
  final int? typeId;
  @override
  final String? movement;
  @override
  final String? created;
  @override
  final String? category;

  @override
  String toString() {
    return 'MovementType(id: $id, pick: $pick, typeId: $typeId, movement: $movement, created: $created, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pick, pick) || other.pick == pick) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.movement, movement) ||
                other.movement == movement) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, pick, typeId, movement, created, category);

  /// Create a copy of MovementType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovementTypeImplCopyWith<_$MovementTypeImpl> get copyWith =>
      __$$MovementTypeImplCopyWithImpl<_$MovementTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementTypeImplToJson(this);
  }
}

abstract class _MovementType implements MovementType {
  const factory _MovementType({
    required final int? id,
    required final String? pick,
    @JsonKey(name: "type_id") required final int? typeId,
    required final String? movement,
    required final String? created,
    required final String? category,
  }) = _$MovementTypeImpl;

  factory _MovementType.fromJson(Map<String, dynamic> json) =
      _$MovementTypeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get pick;
  @override
  @JsonKey(name: "type_id")
  int? get typeId;
  @override
  String? get movement;
  @override
  String? get created;
  @override
  String? get category;

  /// Create a copy of MovementType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementTypeImplCopyWith<_$MovementTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
