// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model',
);

SampleType _$SampleTypeFromJson(Map<String, dynamic> json) {
  return _SampleType.fromJson(json);
}

/// @nodoc
mixin _$SampleType {
  int? get id => throw _privateConstructorUsedError;
  String? get pick => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_id')
  int? get sampleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;

  /// Serializes this SampleType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SampleType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleTypeCopyWith<SampleType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleTypeCopyWith<$Res> {
  factory $SampleTypeCopyWith(
    SampleType value,
    $Res Function(SampleType) then,
  ) = _$SampleTypeCopyWithImpl<$Res, SampleType>;
  @useResult
  $Res call({
    int? id,
    String? pick,
    @JsonKey(name: 'sample_id') int? sampleId,
    @JsonKey(name: 'full_name') String? fullName,
  });
}

/// @nodoc
class _$SampleTypeCopyWithImpl<$Res, $Val extends SampleType>
    implements $SampleTypeCopyWith<$Res> {
  _$SampleTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SampleType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pick = freezed,
    Object? sampleId = freezed,
    Object? fullName = freezed,
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
            sampleId: freezed == sampleId
                ? _value.sampleId
                : sampleId // ignore: cast_nullable_to_non_nullable
                      as int?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SampleTypeImplCopyWith<$Res>
    implements $SampleTypeCopyWith<$Res> {
  factory _$$SampleTypeImplCopyWith(
    _$SampleTypeImpl value,
    $Res Function(_$SampleTypeImpl) then,
  ) = __$$SampleTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? pick,
    @JsonKey(name: 'sample_id') int? sampleId,
    @JsonKey(name: 'full_name') String? fullName,
  });
}

/// @nodoc
class __$$SampleTypeImplCopyWithImpl<$Res>
    extends _$SampleTypeCopyWithImpl<$Res, _$SampleTypeImpl>
    implements _$$SampleTypeImplCopyWith<$Res> {
  __$$SampleTypeImplCopyWithImpl(
    _$SampleTypeImpl _value,
    $Res Function(_$SampleTypeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SampleType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pick = freezed,
    Object? sampleId = freezed,
    Object? fullName = freezed,
  }) {
    return _then(
      _$SampleTypeImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        pick: freezed == pick
            ? _value.pick
            : pick // ignore: cast_nullable_to_non_nullable
                  as String?,
        sampleId: freezed == sampleId
            ? _value.sampleId
            : sampleId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleTypeImpl implements _SampleType {
  const _$SampleTypeImpl({
    required this.id,
    required this.pick,
    @JsonKey(name: 'sample_id') required this.sampleId,
    @JsonKey(name: 'full_name') required this.fullName,
  });

  factory _$SampleTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleTypeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? pick;
  @override
  @JsonKey(name: 'sample_id')
  final int? sampleId;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;

  @override
  String toString() {
    return 'SampleType(id: $id, pick: $pick, sampleId: $sampleId, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pick, pick) || other.pick == pick) &&
            (identical(other.sampleId, sampleId) ||
                other.sampleId == sampleId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pick, sampleId, fullName);

  /// Create a copy of SampleType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleTypeImplCopyWith<_$SampleTypeImpl> get copyWith =>
      __$$SampleTypeImplCopyWithImpl<_$SampleTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleTypeImplToJson(this);
  }
}

abstract class _SampleType implements SampleType {
  const factory _SampleType({
    required final int? id,
    required final String? pick,
    @JsonKey(name: 'sample_id') required final int? sampleId,
    @JsonKey(name: 'full_name') required final String? fullName,
  }) = _$SampleTypeImpl;

  factory _SampleType.fromJson(Map<String, dynamic> json) =
      _$SampleTypeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get pick;
  @override
  @JsonKey(name: 'sample_id')
  int? get sampleId;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;

  /// Create a copy of SampleType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleTypeImplCopyWith<_$SampleTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
