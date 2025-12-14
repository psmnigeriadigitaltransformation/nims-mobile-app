// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_manifest_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateManifestResponse _$CreateManifestResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreateManifestResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateManifestResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  CreateManifestData? get data => throw _privateConstructorUsedError;

  /// Serializes this CreateManifestResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateManifestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateManifestResponseCopyWith<CreateManifestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateManifestResponseCopyWith<$Res> {
  factory $CreateManifestResponseCopyWith(
    CreateManifestResponse value,
    $Res Function(CreateManifestResponse) then,
  ) = _$CreateManifestResponseCopyWithImpl<$Res, CreateManifestResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    CreateManifestData? data,
  });

  $CreateManifestDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CreateManifestResponseCopyWithImpl<
  $Res,
  $Val extends CreateManifestResponse
>
    implements $CreateManifestResponseCopyWith<$Res> {
  _$CreateManifestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateManifestResponse
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
                      as CreateManifestData?,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateManifestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateManifestDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CreateManifestDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateManifestResponseImplCopyWith<$Res>
    implements $CreateManifestResponseCopyWith<$Res> {
  factory _$$CreateManifestResponseImplCopyWith(
    _$CreateManifestResponseImpl value,
    $Res Function(_$CreateManifestResponseImpl) then,
  ) = __$$CreateManifestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    CreateManifestData? data,
  });

  @override
  $CreateManifestDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CreateManifestResponseImplCopyWithImpl<$Res>
    extends
        _$CreateManifestResponseCopyWithImpl<$Res, _$CreateManifestResponseImpl>
    implements _$$CreateManifestResponseImplCopyWith<$Res> {
  __$$CreateManifestResponseImplCopyWithImpl(
    _$CreateManifestResponseImpl _value,
    $Res Function(_$CreateManifestResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateManifestResponse
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
      _$CreateManifestResponseImpl(
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
                  as CreateManifestData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateManifestResponseImpl implements _CreateManifestResponse {
  const _$CreateManifestResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$CreateManifestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateManifestResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final CreateManifestData? data;

  @override
  String toString() {
    return 'CreateManifestResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateManifestResponseImpl &&
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

  /// Create a copy of CreateManifestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateManifestResponseImplCopyWith<_$CreateManifestResponseImpl>
  get copyWith =>
      __$$CreateManifestResponseImplCopyWithImpl<_$CreateManifestResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateManifestResponseImplToJson(this);
  }
}

abstract class _CreateManifestResponse implements CreateManifestResponse {
  const factory _CreateManifestResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final CreateManifestData? data,
  }) = _$CreateManifestResponseImpl;

  factory _CreateManifestResponse.fromJson(Map<String, dynamic> json) =
      _$CreateManifestResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  CreateManifestData? get data;

  /// Create a copy of CreateManifestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateManifestResponseImplCopyWith<_$CreateManifestResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateManifestData _$CreateManifestDataFromJson(Map<String, dynamic> json) {
  return _ManifestCreateData.fromJson(json);
}

/// @nodoc
mixin _$CreateManifestData {
  @JsonKey(name: 'manifests_saved')
  int? get manifestsSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'samples_saved')
  int? get samplesSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifests_no_saved')
  List<String>? get manifestsNoSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifests_no_failed')
  List<String>? get manifestsNoFailed => throw _privateConstructorUsedError;
  List<CreateManifestError>? get errors => throw _privateConstructorUsedError;

  /// Serializes this CreateManifestData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateManifestData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateManifestDataCopyWith<CreateManifestData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateManifestDataCopyWith<$Res> {
  factory $CreateManifestDataCopyWith(
    CreateManifestData value,
    $Res Function(CreateManifestData) then,
  ) = _$CreateManifestDataCopyWithImpl<$Res, CreateManifestData>;
  @useResult
  $Res call({
    @JsonKey(name: 'manifests_saved') int? manifestsSaved,
    @JsonKey(name: 'samples_saved') int? samplesSaved,
    @JsonKey(name: 'manifests_no_saved') List<String>? manifestsNoSaved,
    @JsonKey(name: 'manifests_no_failed') List<String>? manifestsNoFailed,
    List<CreateManifestError>? errors,
  });
}

/// @nodoc
class _$CreateManifestDataCopyWithImpl<$Res, $Val extends CreateManifestData>
    implements $CreateManifestDataCopyWith<$Res> {
  _$CreateManifestDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateManifestData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestsSaved = freezed,
    Object? samplesSaved = freezed,
    Object? manifestsNoSaved = freezed,
    Object? manifestsNoFailed = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _value.copyWith(
            manifestsSaved: freezed == manifestsSaved
                ? _value.manifestsSaved
                : manifestsSaved // ignore: cast_nullable_to_non_nullable
                      as int?,
            samplesSaved: freezed == samplesSaved
                ? _value.samplesSaved
                : samplesSaved // ignore: cast_nullable_to_non_nullable
                      as int?,
            manifestsNoSaved: freezed == manifestsNoSaved
                ? _value.manifestsNoSaved
                : manifestsNoSaved // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            manifestsNoFailed: freezed == manifestsNoFailed
                ? _value.manifestsNoFailed
                : manifestsNoFailed // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            errors: freezed == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<CreateManifestError>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestCreateDataImplCopyWith<$Res>
    implements $CreateManifestDataCopyWith<$Res> {
  factory _$$ManifestCreateDataImplCopyWith(
    _$ManifestCreateDataImpl value,
    $Res Function(_$ManifestCreateDataImpl) then,
  ) = __$$ManifestCreateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'manifests_saved') int? manifestsSaved,
    @JsonKey(name: 'samples_saved') int? samplesSaved,
    @JsonKey(name: 'manifests_no_saved') List<String>? manifestsNoSaved,
    @JsonKey(name: 'manifests_no_failed') List<String>? manifestsNoFailed,
    List<CreateManifestError>? errors,
  });
}

/// @nodoc
class __$$ManifestCreateDataImplCopyWithImpl<$Res>
    extends _$CreateManifestDataCopyWithImpl<$Res, _$ManifestCreateDataImpl>
    implements _$$ManifestCreateDataImplCopyWith<$Res> {
  __$$ManifestCreateDataImplCopyWithImpl(
    _$ManifestCreateDataImpl _value,
    $Res Function(_$ManifestCreateDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateManifestData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestsSaved = freezed,
    Object? samplesSaved = freezed,
    Object? manifestsNoSaved = freezed,
    Object? manifestsNoFailed = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _$ManifestCreateDataImpl(
        manifestsSaved: freezed == manifestsSaved
            ? _value.manifestsSaved
            : manifestsSaved // ignore: cast_nullable_to_non_nullable
                  as int?,
        samplesSaved: freezed == samplesSaved
            ? _value.samplesSaved
            : samplesSaved // ignore: cast_nullable_to_non_nullable
                  as int?,
        manifestsNoSaved: freezed == manifestsNoSaved
            ? _value._manifestsNoSaved
            : manifestsNoSaved // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        manifestsNoFailed: freezed == manifestsNoFailed
            ? _value._manifestsNoFailed
            : manifestsNoFailed // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        errors: freezed == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<CreateManifestError>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestCreateDataImpl implements _ManifestCreateData {
  const _$ManifestCreateDataImpl({
    @JsonKey(name: 'manifests_saved') required this.manifestsSaved,
    @JsonKey(name: 'samples_saved') required this.samplesSaved,
    @JsonKey(name: 'manifests_no_saved')
    required final List<String>? manifestsNoSaved,
    @JsonKey(name: 'manifests_no_failed')
    required final List<String>? manifestsNoFailed,
    required final List<CreateManifestError>? errors,
  }) : _manifestsNoSaved = manifestsNoSaved,
       _manifestsNoFailed = manifestsNoFailed,
       _errors = errors;

  factory _$ManifestCreateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestCreateDataImplFromJson(json);

  @override
  @JsonKey(name: 'manifests_saved')
  final int? manifestsSaved;
  @override
  @JsonKey(name: 'samples_saved')
  final int? samplesSaved;
  final List<String>? _manifestsNoSaved;
  @override
  @JsonKey(name: 'manifests_no_saved')
  List<String>? get manifestsNoSaved {
    final value = _manifestsNoSaved;
    if (value == null) return null;
    if (_manifestsNoSaved is EqualUnmodifiableListView)
      return _manifestsNoSaved;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _manifestsNoFailed;
  @override
  @JsonKey(name: 'manifests_no_failed')
  List<String>? get manifestsNoFailed {
    final value = _manifestsNoFailed;
    if (value == null) return null;
    if (_manifestsNoFailed is EqualUnmodifiableListView)
      return _manifestsNoFailed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CreateManifestError>? _errors;
  @override
  List<CreateManifestError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateManifestData(manifestsSaved: $manifestsSaved, samplesSaved: $samplesSaved, manifestsNoSaved: $manifestsNoSaved, manifestsNoFailed: $manifestsNoFailed, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestCreateDataImpl &&
            (identical(other.manifestsSaved, manifestsSaved) ||
                other.manifestsSaved == manifestsSaved) &&
            (identical(other.samplesSaved, samplesSaved) ||
                other.samplesSaved == samplesSaved) &&
            const DeepCollectionEquality().equals(
              other._manifestsNoSaved,
              _manifestsNoSaved,
            ) &&
            const DeepCollectionEquality().equals(
              other._manifestsNoFailed,
              _manifestsNoFailed,
            ) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    manifestsSaved,
    samplesSaved,
    const DeepCollectionEquality().hash(_manifestsNoSaved),
    const DeepCollectionEquality().hash(_manifestsNoFailed),
    const DeepCollectionEquality().hash(_errors),
  );

  /// Create a copy of CreateManifestData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestCreateDataImplCopyWith<_$ManifestCreateDataImpl> get copyWith =>
      __$$ManifestCreateDataImplCopyWithImpl<_$ManifestCreateDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestCreateDataImplToJson(this);
  }
}

abstract class _ManifestCreateData implements CreateManifestData {
  const factory _ManifestCreateData({
    @JsonKey(name: 'manifests_saved') required final int? manifestsSaved,
    @JsonKey(name: 'samples_saved') required final int? samplesSaved,
    @JsonKey(name: 'manifests_no_saved')
    required final List<String>? manifestsNoSaved,
    @JsonKey(name: 'manifests_no_failed')
    required final List<String>? manifestsNoFailed,
    required final List<CreateManifestError>? errors,
  }) = _$ManifestCreateDataImpl;

  factory _ManifestCreateData.fromJson(Map<String, dynamic> json) =
      _$ManifestCreateDataImpl.fromJson;

  @override
  @JsonKey(name: 'manifests_saved')
  int? get manifestsSaved;
  @override
  @JsonKey(name: 'samples_saved')
  int? get samplesSaved;
  @override
  @JsonKey(name: 'manifests_no_saved')
  List<String>? get manifestsNoSaved;
  @override
  @JsonKey(name: 'manifests_no_failed')
  List<String>? get manifestsNoFailed;
  @override
  List<CreateManifestError>? get errors;

  /// Create a copy of CreateManifestData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestCreateDataImplCopyWith<_$ManifestCreateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateManifestError _$CreateManifestErrorFromJson(Map<String, dynamic> json) {
  return _CreateManifestError.fromJson(json);
}

/// @nodoc
mixin _$CreateManifestError {
  @JsonKey(name: 'manifest_no')
  String? get manifestNo => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CreateManifestError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateManifestError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateManifestErrorCopyWith<CreateManifestError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateManifestErrorCopyWith<$Res> {
  factory $CreateManifestErrorCopyWith(
    CreateManifestError value,
    $Res Function(CreateManifestError) then,
  ) = _$CreateManifestErrorCopyWithImpl<$Res, CreateManifestError>;
  @useResult
  $Res call({
    @JsonKey(name: 'manifest_no') String? manifestNo,
    String? message,
  });
}

/// @nodoc
class _$CreateManifestErrorCopyWithImpl<$Res, $Val extends CreateManifestError>
    implements $CreateManifestErrorCopyWith<$Res> {
  _$CreateManifestErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateManifestError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? manifestNo = freezed, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            manifestNo: freezed == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateManifestErrorImplCopyWith<$Res>
    implements $CreateManifestErrorCopyWith<$Res> {
  factory _$$CreateManifestErrorImplCopyWith(
    _$CreateManifestErrorImpl value,
    $Res Function(_$CreateManifestErrorImpl) then,
  ) = __$$CreateManifestErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'manifest_no') String? manifestNo,
    String? message,
  });
}

/// @nodoc
class __$$CreateManifestErrorImplCopyWithImpl<$Res>
    extends _$CreateManifestErrorCopyWithImpl<$Res, _$CreateManifestErrorImpl>
    implements _$$CreateManifestErrorImplCopyWith<$Res> {
  __$$CreateManifestErrorImplCopyWithImpl(
    _$CreateManifestErrorImpl _value,
    $Res Function(_$CreateManifestErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateManifestError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? manifestNo = freezed, Object? message = freezed}) {
    return _then(
      _$CreateManifestErrorImpl(
        manifestNo: freezed == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateManifestErrorImpl implements _CreateManifestError {
  const _$CreateManifestErrorImpl({
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    required this.message,
  });

  factory _$CreateManifestErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateManifestErrorImplFromJson(json);

  @override
  @JsonKey(name: 'manifest_no')
  final String? manifestNo;
  @override
  final String? message;

  @override
  String toString() {
    return 'CreateManifestError(manifestNo: $manifestNo, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateManifestErrorImpl &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, manifestNo, message);

  /// Create a copy of CreateManifestError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateManifestErrorImplCopyWith<_$CreateManifestErrorImpl> get copyWith =>
      __$$CreateManifestErrorImplCopyWithImpl<_$CreateManifestErrorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateManifestErrorImplToJson(this);
  }
}

abstract class _CreateManifestError implements CreateManifestError {
  const factory _CreateManifestError({
    @JsonKey(name: 'manifest_no') required final String? manifestNo,
    required final String? message,
  }) = _$CreateManifestErrorImpl;

  factory _CreateManifestError.fromJson(Map<String, dynamic> json) =
      _$CreateManifestErrorImpl.fromJson;

  @override
  @JsonKey(name: 'manifest_no')
  String? get manifestNo;
  @override
  String? get message;

  /// Create a copy of CreateManifestError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateManifestErrorImplCopyWith<_$CreateManifestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
