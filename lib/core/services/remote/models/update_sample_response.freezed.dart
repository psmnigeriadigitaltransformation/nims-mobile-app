// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_sample_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateSampleResponse _$UpdateSampleResponseFromJson(Map<String, dynamic> json) {
  return _UpdateSampleResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateSampleResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UpdateSampleData? get data => throw _privateConstructorUsedError;

  /// Serializes this UpdateSampleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSampleResponseCopyWith<UpdateSampleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSampleResponseCopyWith<$Res> {
  factory $UpdateSampleResponseCopyWith(
    UpdateSampleResponse value,
    $Res Function(UpdateSampleResponse) then,
  ) = _$UpdateSampleResponseCopyWithImpl<$Res, UpdateSampleResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    UpdateSampleData? data,
  });

  $UpdateSampleDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UpdateSampleResponseCopyWithImpl<
  $Res,
  $Val extends UpdateSampleResponse
>
    implements $UpdateSampleResponseCopyWith<$Res> {
  _$UpdateSampleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSampleResponse
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
                      as UpdateSampleData?,
          )
          as $Val,
    );
  }

  /// Create a copy of UpdateSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateSampleDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UpdateSampleDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateSampleResponseImplCopyWith<$Res>
    implements $UpdateSampleResponseCopyWith<$Res> {
  factory _$$UpdateSampleResponseImplCopyWith(
    _$UpdateSampleResponseImpl value,
    $Res Function(_$UpdateSampleResponseImpl) then,
  ) = __$$UpdateSampleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    UpdateSampleData? data,
  });

  @override
  $UpdateSampleDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$UpdateSampleResponseImplCopyWithImpl<$Res>
    extends _$UpdateSampleResponseCopyWithImpl<$Res, _$UpdateSampleResponseImpl>
    implements _$$UpdateSampleResponseImplCopyWith<$Res> {
  __$$UpdateSampleResponseImplCopyWithImpl(
    _$UpdateSampleResponseImpl _value,
    $Res Function(_$UpdateSampleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateSampleResponse
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
      _$UpdateSampleResponseImpl(
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
                  as UpdateSampleData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateSampleResponseImpl implements _UpdateSampleResponse {
  const _$UpdateSampleResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$UpdateSampleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSampleResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final UpdateSampleData? data;

  @override
  String toString() {
    return 'UpdateSampleResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSampleResponseImpl &&
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

  /// Create a copy of UpdateSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSampleResponseImplCopyWith<_$UpdateSampleResponseImpl>
  get copyWith =>
      __$$UpdateSampleResponseImplCopyWithImpl<_$UpdateSampleResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSampleResponseImplToJson(this);
  }
}

abstract class _UpdateSampleResponse implements UpdateSampleResponse {
  const factory _UpdateSampleResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final UpdateSampleData? data,
  }) = _$UpdateSampleResponseImpl;

  factory _UpdateSampleResponse.fromJson(Map<String, dynamic> json) =
      _$UpdateSampleResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  UpdateSampleData? get data;

  /// Create a copy of UpdateSampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSampleResponseImplCopyWith<_$UpdateSampleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UpdateSampleData _$UpdateSampleDataFromJson(Map<String, dynamic> json) {
  return _UpdateSampleData.fromJson(json);
}

/// @nodoc
mixin _$UpdateSampleData {
  bool get updated => throw _privateConstructorUsedError;

  /// Serializes this UpdateSampleData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSampleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSampleDataCopyWith<UpdateSampleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSampleDataCopyWith<$Res> {
  factory $UpdateSampleDataCopyWith(
    UpdateSampleData value,
    $Res Function(UpdateSampleData) then,
  ) = _$UpdateSampleDataCopyWithImpl<$Res, UpdateSampleData>;
  @useResult
  $Res call({bool updated});
}

/// @nodoc
class _$UpdateSampleDataCopyWithImpl<$Res, $Val extends UpdateSampleData>
    implements $UpdateSampleDataCopyWith<$Res> {
  _$UpdateSampleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSampleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? updated = null}) {
    return _then(
      _value.copyWith(
            updated: null == updated
                ? _value.updated
                : updated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateSampleDataImplCopyWith<$Res>
    implements $UpdateSampleDataCopyWith<$Res> {
  factory _$$UpdateSampleDataImplCopyWith(
    _$UpdateSampleDataImpl value,
    $Res Function(_$UpdateSampleDataImpl) then,
  ) = __$$UpdateSampleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool updated});
}

/// @nodoc
class __$$UpdateSampleDataImplCopyWithImpl<$Res>
    extends _$UpdateSampleDataCopyWithImpl<$Res, _$UpdateSampleDataImpl>
    implements _$$UpdateSampleDataImplCopyWith<$Res> {
  __$$UpdateSampleDataImplCopyWithImpl(
    _$UpdateSampleDataImpl _value,
    $Res Function(_$UpdateSampleDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateSampleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? updated = null}) {
    return _then(
      _$UpdateSampleDataImpl(
        updated: null == updated
            ? _value.updated
            : updated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateSampleDataImpl implements _UpdateSampleData {
  const _$UpdateSampleDataImpl({required this.updated});

  factory _$UpdateSampleDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSampleDataImplFromJson(json);

  @override
  final bool updated;

  @override
  String toString() {
    return 'UpdateSampleData(updated: $updated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSampleDataImpl &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, updated);

  /// Create a copy of UpdateSampleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSampleDataImplCopyWith<_$UpdateSampleDataImpl> get copyWith =>
      __$$UpdateSampleDataImplCopyWithImpl<_$UpdateSampleDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSampleDataImplToJson(this);
  }
}

abstract class _UpdateSampleData implements UpdateSampleData {
  const factory _UpdateSampleData({required final bool updated}) =
      _$UpdateSampleDataImpl;

  factory _UpdateSampleData.fromJson(Map<String, dynamic> json) =
      _$UpdateSampleDataImpl.fromJson;

  @override
  bool get updated;

  /// Create a copy of UpdateSampleData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSampleDataImplCopyWith<_$UpdateSampleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
