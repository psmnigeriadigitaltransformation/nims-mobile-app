// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rejection_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RejectionReason _$RejectionReasonFromJson(Map<String, dynamic> json) {
  return _RejectionReason.fromJson(json);
}

/// @nodoc
mixin _$RejectionReason {
  int? get id => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this RejectionReason to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RejectionReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectionReasonCopyWith<RejectionReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectionReasonCopyWith<$Res> {
  factory $RejectionReasonCopyWith(
    RejectionReason value,
    $Res Function(RejectionReason) then,
  ) = _$RejectionReasonCopyWithImpl<$Res, RejectionReason>;
  @useResult
  $Res call({int? id, String reason});
}

/// @nodoc
class _$RejectionReasonCopyWithImpl<$Res, $Val extends RejectionReason>
    implements $RejectionReasonCopyWith<$Res> {
  _$RejectionReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectionReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? reason = null}) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RejectionReasonImplCopyWith<$Res>
    implements $RejectionReasonCopyWith<$Res> {
  factory _$$RejectionReasonImplCopyWith(
    _$RejectionReasonImpl value,
    $Res Function(_$RejectionReasonImpl) then,
  ) = __$$RejectionReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String reason});
}

/// @nodoc
class __$$RejectionReasonImplCopyWithImpl<$Res>
    extends _$RejectionReasonCopyWithImpl<$Res, _$RejectionReasonImpl>
    implements _$$RejectionReasonImplCopyWith<$Res> {
  __$$RejectionReasonImplCopyWithImpl(
    _$RejectionReasonImpl _value,
    $Res Function(_$RejectionReasonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RejectionReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? reason = null}) {
    return _then(
      _$RejectionReasonImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RejectionReasonImpl implements _RejectionReason {
  const _$RejectionReasonImpl({this.id, required this.reason});

  factory _$RejectionReasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectionReasonImplFromJson(json);

  @override
  final int? id;
  @override
  final String reason;

  @override
  String toString() {
    return 'RejectionReason(id: $id, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectionReasonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reason);

  /// Create a copy of RejectionReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectionReasonImplCopyWith<_$RejectionReasonImpl> get copyWith =>
      __$$RejectionReasonImplCopyWithImpl<_$RejectionReasonImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectionReasonImplToJson(this);
  }
}

abstract class _RejectionReason implements RejectionReason {
  const factory _RejectionReason({
    final int? id,
    required final String reason,
  }) = _$RejectionReasonImpl;

  factory _RejectionReason.fromJson(Map<String, dynamic> json) =
      _$RejectionReasonImpl.fromJson;

  @override
  int? get id;
  @override
  String get reason;

  /// Create a copy of RejectionReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectionReasonImplCopyWith<_$RejectionReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
