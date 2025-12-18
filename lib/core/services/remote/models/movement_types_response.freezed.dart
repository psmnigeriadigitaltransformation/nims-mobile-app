// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_types_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MovementTypesResponse _$MovementTypesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _MovementTypesResponse.fromJson(json);
}

/// @nodoc
mixin _$MovementTypesResponse {
  @JsonKey(name: "result_code")
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message =>
      throw _privateConstructorUsedError; // @MovementTypeItemListConverter()
  List<MovementTypeItem>? get data => throw _privateConstructorUsedError;

  /// Serializes this MovementTypesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovementTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovementTypesResponseCopyWith<MovementTypesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementTypesResponseCopyWith<$Res> {
  factory $MovementTypesResponseCopyWith(
    MovementTypesResponse value,
    $Res Function(MovementTypesResponse) then,
  ) = _$MovementTypesResponseCopyWithImpl<$Res, MovementTypesResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<MovementTypeItem>? data,
  });
}

/// @nodoc
class _$MovementTypesResponseCopyWithImpl<
  $Res,
  $Val extends MovementTypesResponse
>
    implements $MovementTypesResponseCopyWith<$Res> {
  _$MovementTypesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovementTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCode = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            resultCode: freezed == resultCode
                ? _value.resultCode
                : resultCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<MovementTypeItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovementTypesResponseImplCopyWith<$Res>
    implements $MovementTypesResponseCopyWith<$Res> {
  factory _$$MovementTypesResponseImplCopyWith(
    _$MovementTypesResponseImpl value,
    $Res Function(_$MovementTypesResponseImpl) then,
  ) = __$$MovementTypesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<MovementTypeItem>? data,
  });
}

/// @nodoc
class __$$MovementTypesResponseImplCopyWithImpl<$Res>
    extends
        _$MovementTypesResponseCopyWithImpl<$Res, _$MovementTypesResponseImpl>
    implements _$$MovementTypesResponseImplCopyWith<$Res> {
  __$$MovementTypesResponseImplCopyWithImpl(
    _$MovementTypesResponseImpl _value,
    $Res Function(_$MovementTypesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovementTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCode = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$MovementTypesResponseImpl(
        resultCode: freezed == resultCode
            ? _value.resultCode
            : resultCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<MovementTypeItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementTypesResponseImpl implements _MovementTypesResponse {
  const _$MovementTypesResponseImpl({
    @JsonKey(name: "result_code") required this.resultCode,
    required this.status,
    required this.message,
    required final List<MovementTypeItem>? data,
  }) : _data = data;

  factory _$MovementTypesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovementTypesResponseImplFromJson(json);

  @override
  @JsonKey(name: "result_code")
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  // @MovementTypeItemListConverter()
  final List<MovementTypeItem>? _data;
  // @MovementTypeItemListConverter()
  @override
  List<MovementTypeItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MovementTypesResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementTypesResponseImpl &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    resultCode,
    status,
    message,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of MovementTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovementTypesResponseImplCopyWith<_$MovementTypesResponseImpl>
  get copyWith =>
      __$$MovementTypesResponseImplCopyWithImpl<_$MovementTypesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementTypesResponseImplToJson(this);
  }
}

abstract class _MovementTypesResponse implements MovementTypesResponse {
  const factory _MovementTypesResponse({
    @JsonKey(name: "result_code") required final int? resultCode,
    required final String? status,
    required final String? message,
    required final List<MovementTypeItem>? data,
  }) = _$MovementTypesResponseImpl;

  factory _MovementTypesResponse.fromJson(Map<String, dynamic> json) =
      _$MovementTypesResponseImpl.fromJson;

  @override
  @JsonKey(name: "result_code")
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message; // @MovementTypeItemListConverter()
  @override
  List<MovementTypeItem>? get data;

  /// Create a copy of MovementTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementTypesResponseImplCopyWith<_$MovementTypesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MovementTypeItem _$MovementTypeItemFromJson(Map<String, dynamic> json) {
  return _MovementTypeItem.fromJson(json);
}

/// @nodoc
mixin _$MovementTypeItem {
  String? get pick => throw _privateConstructorUsedError;
  @JsonKey(name: "type_id")
  int? get typeId => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  @JsonKey(name: "destination_primary")
  String? get destinationPrimary => throw _privateConstructorUsedError;
  @JsonKey(name: "destination_secondary")
  String? get destinationSecondary => throw _privateConstructorUsedError;
  String? get movement => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;

  /// Serializes this MovementTypeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovementTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovementTypeItemCopyWith<MovementTypeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementTypeItemCopyWith<$Res> {
  factory $MovementTypeItemCopyWith(
    MovementTypeItem value,
    $Res Function(MovementTypeItem) then,
  ) = _$MovementTypeItemCopyWithImpl<$Res, MovementTypeItem>;
  @useResult
  $Res call({
    String? pick,
    @JsonKey(name: "type_id") int? typeId,
    String? origin,
    @JsonKey(name: "destination_primary") String? destinationPrimary,
    @JsonKey(name: "destination_secondary") String? destinationSecondary,
    String? movement,
    String? created,
  });
}

/// @nodoc
class _$MovementTypeItemCopyWithImpl<$Res, $Val extends MovementTypeItem>
    implements $MovementTypeItemCopyWith<$Res> {
  _$MovementTypeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovementTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? typeId = freezed,
    Object? origin = freezed,
    Object? destinationPrimary = freezed,
    Object? destinationSecondary = freezed,
    Object? movement = freezed,
    Object? created = freezed,
  }) {
    return _then(
      _value.copyWith(
            pick: freezed == pick
                ? _value.pick
                : pick // ignore: cast_nullable_to_non_nullable
                      as String?,
            typeId: freezed == typeId
                ? _value.typeId
                : typeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            origin: freezed == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinationPrimary: freezed == destinationPrimary
                ? _value.destinationPrimary
                : destinationPrimary // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinationSecondary: freezed == destinationSecondary
                ? _value.destinationSecondary
                : destinationSecondary // ignore: cast_nullable_to_non_nullable
                      as String?,
            movement: freezed == movement
                ? _value.movement
                : movement // ignore: cast_nullable_to_non_nullable
                      as String?,
            created: freezed == created
                ? _value.created
                : created // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovementTypeItemImplCopyWith<$Res>
    implements $MovementTypeItemCopyWith<$Res> {
  factory _$$MovementTypeItemImplCopyWith(
    _$MovementTypeItemImpl value,
    $Res Function(_$MovementTypeItemImpl) then,
  ) = __$$MovementTypeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? pick,
    @JsonKey(name: "type_id") int? typeId,
    String? origin,
    @JsonKey(name: "destination_primary") String? destinationPrimary,
    @JsonKey(name: "destination_secondary") String? destinationSecondary,
    String? movement,
    String? created,
  });
}

/// @nodoc
class __$$MovementTypeItemImplCopyWithImpl<$Res>
    extends _$MovementTypeItemCopyWithImpl<$Res, _$MovementTypeItemImpl>
    implements _$$MovementTypeItemImplCopyWith<$Res> {
  __$$MovementTypeItemImplCopyWithImpl(
    _$MovementTypeItemImpl _value,
    $Res Function(_$MovementTypeItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovementTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? typeId = freezed,
    Object? origin = freezed,
    Object? destinationPrimary = freezed,
    Object? destinationSecondary = freezed,
    Object? movement = freezed,
    Object? created = freezed,
  }) {
    return _then(
      _$MovementTypeItemImpl(
        pick: freezed == pick
            ? _value.pick
            : pick // ignore: cast_nullable_to_non_nullable
                  as String?,
        typeId: freezed == typeId
            ? _value.typeId
            : typeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        origin: freezed == origin
            ? _value.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinationPrimary: freezed == destinationPrimary
            ? _value.destinationPrimary
            : destinationPrimary // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinationSecondary: freezed == destinationSecondary
            ? _value.destinationSecondary
            : destinationSecondary // ignore: cast_nullable_to_non_nullable
                  as String?,
        movement: freezed == movement
            ? _value.movement
            : movement // ignore: cast_nullable_to_non_nullable
                  as String?,
        created: freezed == created
            ? _value.created
            : created // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementTypeItemImpl implements _MovementTypeItem {
  const _$MovementTypeItemImpl({
    required this.pick,
    @JsonKey(name: "type_id") required this.typeId,
    required this.origin,
    @JsonKey(name: "destination_primary") required this.destinationPrimary,
    @JsonKey(name: "destination_secondary") required this.destinationSecondary,
    required this.movement,
    required this.created,
  });

  factory _$MovementTypeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovementTypeItemImplFromJson(json);

  @override
  final String? pick;
  @override
  @JsonKey(name: "type_id")
  final int? typeId;
  @override
  final String? origin;
  @override
  @JsonKey(name: "destination_primary")
  final String? destinationPrimary;
  @override
  @JsonKey(name: "destination_secondary")
  final String? destinationSecondary;
  @override
  final String? movement;
  @override
  final String? created;

  @override
  String toString() {
    return 'MovementTypeItem(pick: $pick, typeId: $typeId, origin: $origin, destinationPrimary: $destinationPrimary, destinationSecondary: $destinationSecondary, movement: $movement, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementTypeItemImpl &&
            (identical(other.pick, pick) || other.pick == pick) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destinationPrimary, destinationPrimary) ||
                other.destinationPrimary == destinationPrimary) &&
            (identical(other.destinationSecondary, destinationSecondary) ||
                other.destinationSecondary == destinationSecondary) &&
            (identical(other.movement, movement) ||
                other.movement == movement) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pick,
    typeId,
    origin,
    destinationPrimary,
    destinationSecondary,
    movement,
    created,
  );

  /// Create a copy of MovementTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovementTypeItemImplCopyWith<_$MovementTypeItemImpl> get copyWith =>
      __$$MovementTypeItemImplCopyWithImpl<_$MovementTypeItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementTypeItemImplToJson(this);
  }
}

abstract class _MovementTypeItem implements MovementTypeItem {
  const factory _MovementTypeItem({
    required final String? pick,
    @JsonKey(name: "type_id") required final int? typeId,
    required final String? origin,
    @JsonKey(name: "destination_primary")
    required final String? destinationPrimary,
    @JsonKey(name: "destination_secondary")
    required final String? destinationSecondary,
    required final String? movement,
    required final String? created,
  }) = _$MovementTypeItemImpl;

  factory _MovementTypeItem.fromJson(Map<String, dynamic> json) =
      _$MovementTypeItemImpl.fromJson;

  @override
  String? get pick;
  @override
  @JsonKey(name: "type_id")
  int? get typeId;
  @override
  String? get origin;
  @override
  @JsonKey(name: "destination_primary")
  String? get destinationPrimary;
  @override
  @JsonKey(name: "destination_secondary")
  String? get destinationSecondary;
  @override
  String? get movement;
  @override
  String? get created;

  /// Create a copy of MovementTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementTypeItemImplCopyWith<_$MovementTypeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
