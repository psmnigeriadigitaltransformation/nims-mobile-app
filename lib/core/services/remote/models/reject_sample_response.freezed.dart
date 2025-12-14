// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_sample_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RejectSampleResponse _$RejectSampleResponseFromJson(Map<String, dynamic> json) {
  return _RejectSampleResponse.fromJson(json);
}

/// @nodoc
mixin _$RejectSampleResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get data => throw _privateConstructorUsedError;

  /// Serializes this RejectSampleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RejectSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectSampleResponseCopyWith<RejectSampleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectSampleResponseCopyWith<$Res> {
  factory $RejectSampleResponseCopyWith(
    RejectSampleResponse value,
    $Res Function(RejectSampleResponse) then,
  ) = _$RejectSampleResponseCopyWithImpl<$Res, RejectSampleResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    bool? data,
  });
}

/// @nodoc
class _$RejectSampleResponseCopyWithImpl<
  $Res,
  $Val extends RejectSampleResponse
>
    implements $RejectSampleResponseCopyWith<$Res> {
  _$RejectSampleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectSampleResponse
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
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RejectSampleResponseImplCopyWith<$Res>
    implements $RejectSampleResponseCopyWith<$Res> {
  factory _$$RejectSampleResponseImplCopyWith(
    _$RejectSampleResponseImpl value,
    $Res Function(_$RejectSampleResponseImpl) then,
  ) = __$$RejectSampleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    bool? data,
  });
}

/// @nodoc
class __$$RejectSampleResponseImplCopyWithImpl<$Res>
    extends _$RejectSampleResponseCopyWithImpl<$Res, _$RejectSampleResponseImpl>
    implements _$$RejectSampleResponseImplCopyWith<$Res> {
  __$$RejectSampleResponseImplCopyWithImpl(
    _$RejectSampleResponseImpl _value,
    $Res Function(_$RejectSampleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RejectSampleResponse
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
      _$RejectSampleResponseImpl(
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
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RejectSampleResponseImpl implements _RejectSampleResponse {
  const _$RejectSampleResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$RejectSampleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectSampleResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final bool? data;

  @override
  String toString() {
    return 'RejectSampleResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectSampleResponseImpl &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, resultCode, status, message, data);

  /// Create a copy of RejectSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectSampleResponseImplCopyWith<_$RejectSampleResponseImpl>
  get copyWith =>
      __$$RejectSampleResponseImplCopyWithImpl<_$RejectSampleResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectSampleResponseImplToJson(this);
  }
}

abstract class _RejectSampleResponse implements RejectSampleResponse {
  const factory _RejectSampleResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final bool? data,
  }) = _$RejectSampleResponseImpl;

  factory _RejectSampleResponse.fromJson(Map<String, dynamic> json) =
      _$RejectSampleResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  bool? get data;

  /// Create a copy of RejectSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectSampleResponseImplCopyWith<_$RejectSampleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
