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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model',
);

ManifestSaveResponse _$ManifestSaveResponseFromJson(Map<String, dynamic> json) {
  return _ManifestSaveResponse.fromJson(json);
}

/// @nodoc
mixin _$ManifestSaveResponse {
  @JsonKey(name: "result_code")
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ManifestItem>? get data => throw _privateConstructorUsedError;

  /// Serializes this ManifestSaveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestSaveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestSaveResponseCopyWith<ManifestSaveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestSaveResponseCopyWith<$Res> {
  factory $ManifestSaveResponseCopyWith(
    ManifestSaveResponse value,
    $Res Function(ManifestSaveResponse) then,
  ) = _$ManifestSaveResponseCopyWithImpl<$Res, ManifestSaveResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<ManifestItem>? data,
  });
}

/// @nodoc
class _$ManifestSaveResponseCopyWithImpl<
  $Res,
  $Val extends ManifestSaveResponse
>
    implements $ManifestSaveResponseCopyWith<$Res> {
  _$ManifestSaveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestSaveResponse
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
                      as List<ManifestItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestSaveResponseImplCopyWith<$Res>
    implements $ManifestSaveResponseCopyWith<$Res> {
  factory _$$ManifestSaveResponseImplCopyWith(
    _$ManifestSaveResponseImpl value,
    $Res Function(_$ManifestSaveResponseImpl) then,
  ) = __$$ManifestSaveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<ManifestItem>? data,
  });
}

/// @nodoc
class __$$ManifestSaveResponseImplCopyWithImpl<$Res>
    extends _$ManifestSaveResponseCopyWithImpl<$Res, _$ManifestSaveResponseImpl>
    implements _$$ManifestSaveResponseImplCopyWith<$Res> {
  __$$ManifestSaveResponseImplCopyWithImpl(
    _$ManifestSaveResponseImpl _value,
    $Res Function(_$ManifestSaveResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestSaveResponse
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
      _$ManifestSaveResponseImpl(
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
                  as List<ManifestItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestSaveResponseImpl implements _ManifestSaveResponse {
  const _$ManifestSaveResponseImpl({
    @JsonKey(name: "result_code") required this.resultCode,
    required this.status,
    required this.message,
    required final List<ManifestItem>? data,
  }) : _data = data;

  factory _$ManifestSaveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestSaveResponseImplFromJson(json);

  @override
  @JsonKey(name: "result_code")
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  final List<ManifestItem>? _data;
  @override
  List<ManifestItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManifestSaveResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestSaveResponseImpl &&
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

  /// Create a copy of ManifestSaveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestSaveResponseImplCopyWith<_$ManifestSaveResponseImpl>
  get copyWith =>
      __$$ManifestSaveResponseImplCopyWithImpl<_$ManifestSaveResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestSaveResponseImplToJson(this);
  }
}

abstract class _ManifestSaveResponse implements ManifestSaveResponse {
  const factory _ManifestSaveResponse({
    @JsonKey(name: "result_code") required final int? resultCode,
    required final String? status,
    required final String? message,
    required final List<ManifestItem>? data,
  }) = _$ManifestSaveResponseImpl;

  factory _ManifestSaveResponse.fromJson(Map<String, dynamic> json) =
      _$ManifestSaveResponseImpl.fromJson;

  @override
  @JsonKey(name: "result_code")
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  List<ManifestItem>? get data;

  /// Create a copy of ManifestSaveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestSaveResponseImplCopyWith<_$ManifestSaveResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ManifestItem _$ManifestItemFromJson(Map<String, dynamic> json) {
  return _ManifestItem.fromJson(json);
}

/// @nodoc
mixin _$ManifestItem {
  @JsonKey(name: "manifest_no")
  String? get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: "origin_id")
  String? get originId => throw _privateConstructorUsedError;
  @JsonKey(name: "destination_id")
  String? get destinationId => throw _privateConstructorUsedError;
  @JsonKey(name: "sample_type")
  String? get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: "sample_count")
  int? get sampleCount => throw _privateConstructorUsedError;
  @JsonKey(name: "phlebotomy_no")
  String? get phlebotomyNo => throw _privateConstructorUsedError;
  @JsonKey(name: "lsp_code")
  String? get lspCode => throw _privateConstructorUsedError;
  String? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  List<ManifestSample>? get samples => throw _privateConstructorUsedError;

  /// Serializes this ManifestItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestItemCopyWith<ManifestItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestItemCopyWith<$Res> {
  factory $ManifestItemCopyWith(
    ManifestItem value,
    $Res Function(ManifestItem) then,
  ) = _$ManifestItemCopyWithImpl<$Res, ManifestItem>;
  @useResult
  $Res call({
    @JsonKey(name: "manifest_no") String? manifestNo,
    @JsonKey(name: "origin_id") String? originId,
    @JsonKey(name: "destination_id") String? destinationId,
    @JsonKey(name: "sample_type") String? sampleType,
    @JsonKey(name: "sample_count") int? sampleCount,
    @JsonKey(name: "phlebotomy_no") String? phlebotomyNo,
    @JsonKey(name: "lsp_code") String? lspCode,
    String? temperature,
    @JsonKey(name: "user_id") String? userId,
    List<ManifestSample>? samples,
  });
}

/// @nodoc
class _$ManifestItemCopyWithImpl<$Res, $Val extends ManifestItem>
    implements $ManifestItemCopyWith<$Res> {
  _$ManifestItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = freezed,
    Object? originId = freezed,
    Object? destinationId = freezed,
    Object? sampleType = freezed,
    Object? sampleCount = freezed,
    Object? phlebotomyNo = freezed,
    Object? lspCode = freezed,
    Object? temperature = freezed,
    Object? userId = freezed,
    Object? samples = freezed,
  }) {
    return _then(
      _value.copyWith(
            manifestNo: freezed == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            originId: freezed == originId
                ? _value.originId
                : originId // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinationId: freezed == destinationId
                ? _value.destinationId
                : destinationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sampleType: freezed == sampleType
                ? _value.sampleType
                : sampleType // ignore: cast_nullable_to_non_nullable
                      as String?,
            sampleCount: freezed == sampleCount
                ? _value.sampleCount
                : sampleCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            phlebotomyNo: freezed == phlebotomyNo
                ? _value.phlebotomyNo
                : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            lspCode: freezed == lspCode
                ? _value.lspCode
                : lspCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            samples: freezed == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<ManifestSample>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestItemImplCopyWith<$Res>
    implements $ManifestItemCopyWith<$Res> {
  factory _$$ManifestItemImplCopyWith(
    _$ManifestItemImpl value,
    $Res Function(_$ManifestItemImpl) then,
  ) = __$$ManifestItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "manifest_no") String? manifestNo,
    @JsonKey(name: "origin_id") String? originId,
    @JsonKey(name: "destination_id") String? destinationId,
    @JsonKey(name: "sample_type") String? sampleType,
    @JsonKey(name: "sample_count") int? sampleCount,
    @JsonKey(name: "phlebotomy_no") String? phlebotomyNo,
    @JsonKey(name: "lsp_code") String? lspCode,
    String? temperature,
    @JsonKey(name: "user_id") String? userId,
    List<ManifestSample>? samples,
  });
}

/// @nodoc
class __$$ManifestItemImplCopyWithImpl<$Res>
    extends _$ManifestItemCopyWithImpl<$Res, _$ManifestItemImpl>
    implements _$$ManifestItemImplCopyWith<$Res> {
  __$$ManifestItemImplCopyWithImpl(
    _$ManifestItemImpl _value,
    $Res Function(_$ManifestItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = freezed,
    Object? originId = freezed,
    Object? destinationId = freezed,
    Object? sampleType = freezed,
    Object? sampleCount = freezed,
    Object? phlebotomyNo = freezed,
    Object? lspCode = freezed,
    Object? temperature = freezed,
    Object? userId = freezed,
    Object? samples = freezed,
  }) {
    return _then(
      _$ManifestItemImpl(
        manifestNo: freezed == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        originId: freezed == originId
            ? _value.originId
            : originId // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinationId: freezed == destinationId
            ? _value.destinationId
            : destinationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sampleType: freezed == sampleType
            ? _value.sampleType
            : sampleType // ignore: cast_nullable_to_non_nullable
                  as String?,
        sampleCount: freezed == sampleCount
            ? _value.sampleCount
            : sampleCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        phlebotomyNo: freezed == phlebotomyNo
            ? _value.phlebotomyNo
            : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        lspCode: freezed == lspCode
            ? _value.lspCode
            : lspCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        samples: freezed == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<ManifestSample>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestItemImpl implements _ManifestItem {
  const _$ManifestItemImpl({
    @JsonKey(name: "manifest_no") required this.manifestNo,
    @JsonKey(name: "origin_id") required this.originId,
    @JsonKey(name: "destination_id") required this.destinationId,
    @JsonKey(name: "sample_type") required this.sampleType,
    @JsonKey(name: "sample_count") required this.sampleCount,
    @JsonKey(name: "phlebotomy_no") required this.phlebotomyNo,
    @JsonKey(name: "lsp_code") required this.lspCode,
    required this.temperature,
    @JsonKey(name: "user_id") required this.userId,
    required final List<ManifestSample>? samples,
  }) : _samples = samples;

  factory _$ManifestItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestItemImplFromJson(json);

  @override
  @JsonKey(name: "manifest_no")
  final String? manifestNo;
  @override
  @JsonKey(name: "origin_id")
  final String? originId;
  @override
  @JsonKey(name: "destination_id")
  final String? destinationId;
  @override
  @JsonKey(name: "sample_type")
  final String? sampleType;
  @override
  @JsonKey(name: "sample_count")
  final int? sampleCount;
  @override
  @JsonKey(name: "phlebotomy_no")
  final String? phlebotomyNo;
  @override
  @JsonKey(name: "lsp_code")
  final String? lspCode;
  @override
  final String? temperature;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  final List<ManifestSample>? _samples;
  @override
  List<ManifestSample>? get samples {
    final value = _samples;
    if (value == null) return null;
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManifestItem(manifestNo: $manifestNo, originId: $originId, destinationId: $destinationId, sampleType: $sampleType, sampleCount: $sampleCount, phlebotomyNo: $phlebotomyNo, lspCode: $lspCode, temperature: $temperature, userId: $userId, samples: $samples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestItemImpl &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.originId, originId) ||
                other.originId == originId) &&
            (identical(other.destinationId, destinationId) ||
                other.destinationId == destinationId) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.sampleCount, sampleCount) ||
                other.sampleCount == sampleCount) &&
            (identical(other.phlebotomyNo, phlebotomyNo) ||
                other.phlebotomyNo == phlebotomyNo) &&
            (identical(other.lspCode, lspCode) || other.lspCode == lspCode) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._samples, _samples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    manifestNo,
    originId,
    destinationId,
    sampleType,
    sampleCount,
    phlebotomyNo,
    lspCode,
    temperature,
    userId,
    const DeepCollectionEquality().hash(_samples),
  );

  /// Create a copy of ManifestItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestItemImplCopyWith<_$ManifestItemImpl> get copyWith =>
      __$$ManifestItemImplCopyWithImpl<_$ManifestItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestItemImplToJson(this);
  }
}

abstract class _ManifestItem implements ManifestItem {
  const factory _ManifestItem({
    @JsonKey(name: "manifest_no") required final String? manifestNo,
    @JsonKey(name: "origin_id") required final String? originId,
    @JsonKey(name: "destination_id") required final String? destinationId,
    @JsonKey(name: "sample_type") required final String? sampleType,
    @JsonKey(name: "sample_count") required final int? sampleCount,
    @JsonKey(name: "phlebotomy_no") required final String? phlebotomyNo,
    @JsonKey(name: "lsp_code") required final String? lspCode,
    required final String? temperature,
    @JsonKey(name: "user_id") required final String? userId,
    required final List<ManifestSample>? samples,
  }) = _$ManifestItemImpl;

  factory _ManifestItem.fromJson(Map<String, dynamic> json) =
      _$ManifestItemImpl.fromJson;

  @override
  @JsonKey(name: "manifest_no")
  String? get manifestNo;
  @override
  @JsonKey(name: "origin_id")
  String? get originId;
  @override
  @JsonKey(name: "destination_id")
  String? get destinationId;
  @override
  @JsonKey(name: "sample_type")
  String? get sampleType;
  @override
  @JsonKey(name: "sample_count")
  int? get sampleCount;
  @override
  @JsonKey(name: "phlebotomy_no")
  String? get phlebotomyNo;
  @override
  @JsonKey(name: "lsp_code")
  String? get lspCode;
  @override
  String? get temperature;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  List<ManifestSample>? get samples;

  /// Create a copy of ManifestItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestItemImplCopyWith<_$ManifestItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ManifestSample _$ManifestSampleFromJson(Map<String, dynamic> json) {
  return _ManifestSample.fromJson(json);
}

/// @nodoc
mixin _$ManifestSample {
  @JsonKey(name: "sample_code")
  String? get sampleCode => throw _privateConstructorUsedError;
  @JsonKey(name: "patient_code")
  String? get patientCode => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this ManifestSample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestSampleCopyWith<ManifestSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestSampleCopyWith<$Res> {
  factory $ManifestSampleCopyWith(
    ManifestSample value,
    $Res Function(ManifestSample) then,
  ) = _$ManifestSampleCopyWithImpl<$Res, ManifestSample>;
  @useResult
  $Res call({
    @JsonKey(name: "sample_code") String? sampleCode,
    @JsonKey(name: "patient_code") String? patientCode,
    String? age,
    String? gender,
  });
}

/// @nodoc
class _$ManifestSampleCopyWithImpl<$Res, $Val extends ManifestSample>
    implements $ManifestSampleCopyWith<$Res> {
  _$ManifestSampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = freezed,
    Object? patientCode = freezed,
    Object? age = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _value.copyWith(
            sampleCode: freezed == sampleCode
                ? _value.sampleCode
                : sampleCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientCode: freezed == patientCode
                ? _value.patientCode
                : patientCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestSampleImplCopyWith<$Res>
    implements $ManifestSampleCopyWith<$Res> {
  factory _$$ManifestSampleImplCopyWith(
    _$ManifestSampleImpl value,
    $Res Function(_$ManifestSampleImpl) then,
  ) = __$$ManifestSampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "sample_code") String? sampleCode,
    @JsonKey(name: "patient_code") String? patientCode,
    String? age,
    String? gender,
  });
}

/// @nodoc
class __$$ManifestSampleImplCopyWithImpl<$Res>
    extends _$ManifestSampleCopyWithImpl<$Res, _$ManifestSampleImpl>
    implements _$$ManifestSampleImplCopyWith<$Res> {
  __$$ManifestSampleImplCopyWithImpl(
    _$ManifestSampleImpl _value,
    $Res Function(_$ManifestSampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = freezed,
    Object? patientCode = freezed,
    Object? age = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$ManifestSampleImpl(
        sampleCode: freezed == sampleCode
            ? _value.sampleCode
            : sampleCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientCode: freezed == patientCode
            ? _value.patientCode
            : patientCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestSampleImpl implements _ManifestSample {
  const _$ManifestSampleImpl({
    @JsonKey(name: "sample_code") required this.sampleCode,
    @JsonKey(name: "patient_code") required this.patientCode,
    required this.age,
    required this.gender,
  });

  factory _$ManifestSampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestSampleImplFromJson(json);

  @override
  @JsonKey(name: "sample_code")
  final String? sampleCode;
  @override
  @JsonKey(name: "patient_code")
  final String? patientCode;
  @override
  final String? age;
  @override
  final String? gender;

  @override
  String toString() {
    return 'ManifestSample(sampleCode: $sampleCode, patientCode: $patientCode, age: $age, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestSampleImpl &&
            (identical(other.sampleCode, sampleCode) ||
                other.sampleCode == sampleCode) &&
            (identical(other.patientCode, patientCode) ||
                other.patientCode == patientCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sampleCode, patientCode, age, gender);

  /// Create a copy of ManifestSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestSampleImplCopyWith<_$ManifestSampleImpl> get copyWith =>
      __$$ManifestSampleImplCopyWithImpl<_$ManifestSampleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestSampleImplToJson(this);
  }
}

abstract class _ManifestSample implements ManifestSample {
  const factory _ManifestSample({
    @JsonKey(name: "sample_code") required final String? sampleCode,
    @JsonKey(name: "patient_code") required final String? patientCode,
    required final String? age,
    required final String? gender,
  }) = _$ManifestSampleImpl;

  factory _ManifestSample.fromJson(Map<String, dynamic> json) =
      _$ManifestSampleImpl.fromJson;

  @override
  @JsonKey(name: "sample_code")
  String? get sampleCode;
  @override
  @JsonKey(name: "patient_code")
  String? get patientCode;
  @override
  String? get age;
  @override
  String? get gender;

  /// Create a copy of ManifestSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestSampleImplCopyWith<_$ManifestSampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
