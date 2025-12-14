// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etoken_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ETokenResponse _$ETokenResponseFromJson(Map<String, dynamic> json) {
  return _ETokenResponse.fromJson(json);
}

/// @nodoc
mixin _$ETokenResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ETokenData>? get data => throw _privateConstructorUsedError;

  /// Serializes this ETokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ETokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ETokenResponseCopyWith<ETokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ETokenResponseCopyWith<$Res> {
  factory $ETokenResponseCopyWith(
    ETokenResponse value,
    $Res Function(ETokenResponse) then,
  ) = _$ETokenResponseCopyWithImpl<$Res, ETokenResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ETokenData>? data,
  });
}

/// @nodoc
class _$ETokenResponseCopyWithImpl<$Res, $Val extends ETokenResponse>
    implements $ETokenResponseCopyWith<$Res> {
  _$ETokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ETokenResponse
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
                      as List<ETokenData>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ETokenResponseImplCopyWith<$Res>
    implements $ETokenResponseCopyWith<$Res> {
  factory _$$ETokenResponseImplCopyWith(
    _$ETokenResponseImpl value,
    $Res Function(_$ETokenResponseImpl) then,
  ) = __$$ETokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ETokenData>? data,
  });
}

/// @nodoc
class __$$ETokenResponseImplCopyWithImpl<$Res>
    extends _$ETokenResponseCopyWithImpl<$Res, _$ETokenResponseImpl>
    implements _$$ETokenResponseImplCopyWith<$Res> {
  __$$ETokenResponseImplCopyWithImpl(
    _$ETokenResponseImpl _value,
    $Res Function(_$ETokenResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ETokenResponse
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
      _$ETokenResponseImpl(
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
                  as List<ETokenData>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ETokenResponseImpl implements _ETokenResponse {
  const _$ETokenResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required final List<ETokenData>? data,
  }) : _data = data;

  factory _$ETokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ETokenResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  final List<ETokenData>? _data;
  @override
  List<ETokenData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ETokenResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ETokenResponseImpl &&
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

  /// Create a copy of ETokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ETokenResponseImplCopyWith<_$ETokenResponseImpl> get copyWith =>
      __$$ETokenResponseImplCopyWithImpl<_$ETokenResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ETokenResponseImplToJson(this);
  }
}

abstract class _ETokenResponse implements ETokenResponse {
  const factory _ETokenResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final List<ETokenData>? data,
  }) = _$ETokenResponseImpl;

  factory _ETokenResponse.fromJson(Map<String, dynamic> json) =
      _$ETokenResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  List<ETokenData>? get data;

  /// Create a copy of ETokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ETokenResponseImplCopyWith<_$ETokenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ETokenData _$ETokenDataFromJson(Map<String, dynamic> json) {
  return _ETokenData.fromJson(json);
}

/// @nodoc
mixin _$ETokenData {
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
  $Res call({Object? etokenId = freezed, Object? serialNo = freezed}) {
    return _then(
      _value.copyWith(
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
  $Res call({Object? etokenId = freezed, Object? serialNo = freezed}) {
    return _then(
      _$ETokenDataImpl(
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
    @JsonKey(name: 'etoken_id') required this.etokenId,
    @JsonKey(name: 'serial_no') required this.serialNo,
  });

  factory _$ETokenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ETokenDataImplFromJson(json);

  @override
  @JsonKey(name: 'etoken_id')
  final String? etokenId;
  @override
  @JsonKey(name: 'serial_no')
  final String? serialNo;

  @override
  String toString() {
    return 'ETokenData(etokenId: $etokenId, serialNo: $serialNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ETokenDataImpl &&
            (identical(other.etokenId, etokenId) ||
                other.etokenId == etokenId) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, etokenId, serialNo);

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
    @JsonKey(name: 'etoken_id') required final String? etokenId,
    @JsonKey(name: 'serial_no') required final String? serialNo,
  }) = _$ETokenDataImpl;

  factory _ETokenData.fromJson(Map<String, dynamic> json) =
      _$ETokenDataImpl.fromJson;

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
