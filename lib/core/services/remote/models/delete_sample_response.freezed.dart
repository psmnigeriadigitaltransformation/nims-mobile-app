// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_sample_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DeleteSampleResponse _$DeleteSampleResponseFromJson(Map<String, dynamic> json) {
  return _DeleteSampleResponse.fromJson(json);
}

/// @nodoc
mixin _$DeleteSampleResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get data => throw _privateConstructorUsedError;

  /// Serializes this DeleteSampleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteSampleResponseCopyWith<DeleteSampleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteSampleResponseCopyWith<$Res> {
  factory $DeleteSampleResponseCopyWith(
    DeleteSampleResponse value,
    $Res Function(DeleteSampleResponse) then,
  ) = _$DeleteSampleResponseCopyWithImpl<$Res, DeleteSampleResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    bool? data,
  });
}

/// @nodoc
class _$DeleteSampleResponseCopyWithImpl<
  $Res,
  $Val extends DeleteSampleResponse
>
    implements $DeleteSampleResponseCopyWith<$Res> {
  _$DeleteSampleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteSampleResponse
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
abstract class _$$DeleteSampleResponseImplCopyWith<$Res>
    implements $DeleteSampleResponseCopyWith<$Res> {
  factory _$$DeleteSampleResponseImplCopyWith(
    _$DeleteSampleResponseImpl value,
    $Res Function(_$DeleteSampleResponseImpl) then,
  ) = __$$DeleteSampleResponseImplCopyWithImpl<$Res>;
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
class __$$DeleteSampleResponseImplCopyWithImpl<$Res>
    extends _$DeleteSampleResponseCopyWithImpl<$Res, _$DeleteSampleResponseImpl>
    implements _$$DeleteSampleResponseImplCopyWith<$Res> {
  __$$DeleteSampleResponseImplCopyWithImpl(
    _$DeleteSampleResponseImpl _value,
    $Res Function(_$DeleteSampleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteSampleResponse
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
      _$DeleteSampleResponseImpl(
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
class _$DeleteSampleResponseImpl implements _DeleteSampleResponse {
  const _$DeleteSampleResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$DeleteSampleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteSampleResponseImplFromJson(json);

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
    return 'DeleteSampleResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSampleResponseImpl &&
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

  /// Create a copy of DeleteSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSampleResponseImplCopyWith<_$DeleteSampleResponseImpl>
  get copyWith =>
      __$$DeleteSampleResponseImplCopyWithImpl<_$DeleteSampleResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteSampleResponseImplToJson(this);
  }
}

abstract class _DeleteSampleResponse implements DeleteSampleResponse {
  const factory _DeleteSampleResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final bool? data,
  }) = _$DeleteSampleResponseImpl;

  factory _DeleteSampleResponse.fromJson(Map<String, dynamic> json) =
      _$DeleteSampleResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  bool? get data;

  /// Create a copy of DeleteSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSampleResponseImplCopyWith<_$DeleteSampleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
