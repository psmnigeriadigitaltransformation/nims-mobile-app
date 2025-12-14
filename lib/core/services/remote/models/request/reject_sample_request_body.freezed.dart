// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_sample_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RejectSampleRequest _$RejectSampleRequestFromJson(Map<String, dynamic> json) {
  return _RejectSampleRequest.fromJson(json);
}

/// @nodoc
mixin _$RejectSampleRequest {
  @JsonKey(name: 'sample_code')
  String get sampleCode => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_date')
  String get rejectionDate => throw _privateConstructorUsedError;

  /// Serializes this RejectSampleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RejectSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectSampleRequestCopyWith<RejectSampleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectSampleRequestCopyWith<$Res> {
  factory $RejectSampleRequestCopyWith(
    RejectSampleRequest value,
    $Res Function(RejectSampleRequest) then,
  ) = _$RejectSampleRequestCopyWithImpl<$Res, RejectSampleRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String sampleCode,
    String reason,
    @JsonKey(name: 'rejection_date') String rejectionDate,
  });
}

/// @nodoc
class _$RejectSampleRequestCopyWithImpl<$Res, $Val extends RejectSampleRequest>
    implements $RejectSampleRequestCopyWith<$Res> {
  _$RejectSampleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = null,
    Object? reason = null,
    Object? rejectionDate = null,
  }) {
    return _then(
      _value.copyWith(
            sampleCode: null == sampleCode
                ? _value.sampleCode
                : sampleCode // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
            rejectionDate: null == rejectionDate
                ? _value.rejectionDate
                : rejectionDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RejectSampleRequestImplCopyWith<$Res>
    implements $RejectSampleRequestCopyWith<$Res> {
  factory _$$RejectSampleRequestImplCopyWith(
    _$RejectSampleRequestImpl value,
    $Res Function(_$RejectSampleRequestImpl) then,
  ) = __$$RejectSampleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String sampleCode,
    String reason,
    @JsonKey(name: 'rejection_date') String rejectionDate,
  });
}

/// @nodoc
class __$$RejectSampleRequestImplCopyWithImpl<$Res>
    extends _$RejectSampleRequestCopyWithImpl<$Res, _$RejectSampleRequestImpl>
    implements _$$RejectSampleRequestImplCopyWith<$Res> {
  __$$RejectSampleRequestImplCopyWithImpl(
    _$RejectSampleRequestImpl _value,
    $Res Function(_$RejectSampleRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RejectSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = null,
    Object? reason = null,
    Object? rejectionDate = null,
  }) {
    return _then(
      _$RejectSampleRequestImpl(
        sampleCode: null == sampleCode
            ? _value.sampleCode
            : sampleCode // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
        rejectionDate: null == rejectionDate
            ? _value.rejectionDate
            : rejectionDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RejectSampleRequestImpl implements _RejectSampleRequest {
  const _$RejectSampleRequestImpl({
    @JsonKey(name: 'sample_code') required this.sampleCode,
    required this.reason,
    @JsonKey(name: 'rejection_date') required this.rejectionDate,
  });

  factory _$RejectSampleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectSampleRequestImplFromJson(json);

  @override
  @JsonKey(name: 'sample_code')
  final String sampleCode;
  @override
  final String reason;
  @override
  @JsonKey(name: 'rejection_date')
  final String rejectionDate;

  @override
  String toString() {
    return 'RejectSampleRequest(sampleCode: $sampleCode, reason: $reason, rejectionDate: $rejectionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectSampleRequestImpl &&
            (identical(other.sampleCode, sampleCode) ||
                other.sampleCode == sampleCode) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.rejectionDate, rejectionDate) ||
                other.rejectionDate == rejectionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sampleCode, reason, rejectionDate);

  /// Create a copy of RejectSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectSampleRequestImplCopyWith<_$RejectSampleRequestImpl> get copyWith =>
      __$$RejectSampleRequestImplCopyWithImpl<_$RejectSampleRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectSampleRequestImplToJson(this);
  }
}

abstract class _RejectSampleRequest implements RejectSampleRequest {
  const factory _RejectSampleRequest({
    @JsonKey(name: 'sample_code') required final String sampleCode,
    required final String reason,
    @JsonKey(name: 'rejection_date') required final String rejectionDate,
  }) = _$RejectSampleRequestImpl;

  factory _RejectSampleRequest.fromJson(Map<String, dynamic> json) =
      _$RejectSampleRequestImpl.fromJson;

  @override
  @JsonKey(name: 'sample_code')
  String get sampleCode;
  @override
  String get reason;
  @override
  @JsonKey(name: 'rejection_date')
  String get rejectionDate;

  /// Create a copy of RejectSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectSampleRequestImplCopyWith<_$RejectSampleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
