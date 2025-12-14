// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etoken_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ETokenData _$ETokenDataFromJson(Map<String, dynamic> json) {
  return _ETokenData.fromJson(json);
}

/// @nodoc
mixin _$ETokenData {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'etoken_id')
  String? get etokenId => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_no')
  String? get serialNo => throw _privateConstructorUsedError;

  /// Serializes this ETokenData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ETokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ETokenDataCopyWith<ETokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ETokenDataCopyWith<$Res> {
  factory $ETokenDataCopyWith(
    ETokenData value,
    $Res Function(ETokenData) then,
  ) = _$ETokenDataCopyWithImpl<$Res, ETokenData>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'etoken_id') String? etokenId,
    @JsonKey(name: 'serial_no') String? serialNo,
  });
}

/// @nodoc
class _$ETokenDataCopyWithImpl<$Res, $Val extends ETokenData>
    implements $ETokenDataCopyWith<$Res> {
  _$ETokenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ETokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? etokenId = freezed,
    Object? serialNo = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            etokenId: freezed == etokenId
                ? _value.etokenId
                : etokenId // ignore: cast_nullable_to_non_nullable
                      as String?,
            serialNo: freezed == serialNo
                ? _value.serialNo
                : serialNo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ETokenDataImplCopyWith<$Res>
    implements $ETokenDataCopyWith<$Res> {
  factory _$$ETokenDataImplCopyWith(
    _$ETokenDataImpl value,
    $Res Function(_$ETokenDataImpl) then,
  ) = __$$ETokenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'etoken_id') String? etokenId,
    @JsonKey(name: 'serial_no') String? serialNo,
  });
}

/// @nodoc
class __$$ETokenDataImplCopyWithImpl<$Res>
    extends _$ETokenDataCopyWithImpl<$Res, _$ETokenDataImpl>
    implements _$$ETokenDataImplCopyWith<$Res> {
  __$$ETokenDataImplCopyWithImpl(
    _$ETokenDataImpl _value,
    $Res Function(_$ETokenDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ETokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? etokenId = freezed,
    Object? serialNo = freezed,
  }) {
    return _then(
      _$ETokenDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        etokenId: freezed == etokenId
            ? _value.etokenId
            : etokenId // ignore: cast_nullable_to_non_nullable
                  as String?,
        serialNo: freezed == serialNo
            ? _value.serialNo
            : serialNo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ETokenDataImpl implements _ETokenData {
  const _$ETokenDataImpl({
    required this.id,
    @JsonKey(name: 'etoken_id') required this.etokenId,
    @JsonKey(name: 'serial_no') required this.serialNo,
  });

  factory _$ETokenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ETokenDataImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'etoken_id')
  final String? etokenId;
  @override
  @JsonKey(name: 'serial_no')
  final String? serialNo;

  @override
  String toString() {
    return 'ETokenData(id: $id, etokenId: $etokenId, serialNo: $serialNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ETokenDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.etokenId, etokenId) ||
                other.etokenId == etokenId) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, etokenId, serialNo);

  /// Create a copy of ETokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ETokenDataImplCopyWith<_$ETokenDataImpl> get copyWith =>
      __$$ETokenDataImplCopyWithImpl<_$ETokenDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ETokenDataImplToJson(this);
  }
}

abstract class _ETokenData implements ETokenData {
  const factory _ETokenData({
    required final int? id,
    @JsonKey(name: 'etoken_id') required final String? etokenId,
    @JsonKey(name: 'serial_no') required final String? serialNo,
  }) = _$ETokenDataImpl;

  factory _ETokenData.fromJson(Map<String, dynamic> json) =
      _$ETokenDataImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'etoken_id')
  String? get etokenId;
  @override
  @JsonKey(name: 'serial_no')
  String? get serialNo;

  /// Create a copy of ETokenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ETokenDataImplCopyWith<_$ETokenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
