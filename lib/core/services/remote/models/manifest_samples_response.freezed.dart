// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manifest_samples_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ManifestSamplesResponse _$ManifestSamplesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ManifestSamplesResponse.fromJson(json);
}

/// @nodoc
mixin _$ManifestSamplesResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ManifestSampleItem>? get data => throw _privateConstructorUsedError;

  /// Serializes this ManifestSamplesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestSamplesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestSamplesResponseCopyWith<ManifestSamplesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestSamplesResponseCopyWith<$Res> {
  factory $ManifestSamplesResponseCopyWith(
    ManifestSamplesResponse value,
    $Res Function(ManifestSamplesResponse) then,
  ) = _$ManifestSamplesResponseCopyWithImpl<$Res, ManifestSamplesResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ManifestSampleItem>? data,
  });
}

/// @nodoc
class _$ManifestSamplesResponseCopyWithImpl<
  $Res,
  $Val extends ManifestSamplesResponse
>
    implements $ManifestSamplesResponseCopyWith<$Res> {
  _$ManifestSamplesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestSamplesResponse
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
                      as List<ManifestSampleItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestSamplesResponseImplCopyWith<$Res>
    implements $ManifestSamplesResponseCopyWith<$Res> {
  factory _$$ManifestSamplesResponseImplCopyWith(
    _$ManifestSamplesResponseImpl value,
    $Res Function(_$ManifestSamplesResponseImpl) then,
  ) = __$$ManifestSamplesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ManifestSampleItem>? data,
  });
}

/// @nodoc
class __$$ManifestSamplesResponseImplCopyWithImpl<$Res>
    extends
        _$ManifestSamplesResponseCopyWithImpl<
          $Res,
          _$ManifestSamplesResponseImpl
        >
    implements _$$ManifestSamplesResponseImplCopyWith<$Res> {
  __$$ManifestSamplesResponseImplCopyWithImpl(
    _$ManifestSamplesResponseImpl _value,
    $Res Function(_$ManifestSamplesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestSamplesResponse
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
      _$ManifestSamplesResponseImpl(
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
                  as List<ManifestSampleItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestSamplesResponseImpl implements _ManifestSamplesResponse {
  const _$ManifestSamplesResponseImpl({
    @JsonKey(name: 'result_code') this.resultCode,
    this.status,
    this.message,
    final List<ManifestSampleItem>? data,
  }) : _data = data;

  factory _$ManifestSamplesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestSamplesResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  final List<ManifestSampleItem>? _data;
  @override
  List<ManifestSampleItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManifestSamplesResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestSamplesResponseImpl &&
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

  /// Create a copy of ManifestSamplesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestSamplesResponseImplCopyWith<_$ManifestSamplesResponseImpl>
  get copyWith =>
      __$$ManifestSamplesResponseImplCopyWithImpl<
        _$ManifestSamplesResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestSamplesResponseImplToJson(this);
  }
}

abstract class _ManifestSamplesResponse implements ManifestSamplesResponse {
  const factory _ManifestSamplesResponse({
    @JsonKey(name: 'result_code') final int? resultCode,
    final String? status,
    final String? message,
    final List<ManifestSampleItem>? data,
  }) = _$ManifestSamplesResponseImpl;

  factory _ManifestSamplesResponse.fromJson(Map<String, dynamic> json) =
      _$ManifestSamplesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  List<ManifestSampleItem>? get data;

  /// Create a copy of ManifestSamplesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestSamplesResponseImplCopyWith<_$ManifestSamplesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ManifestSampleItem _$ManifestSampleItemFromJson(Map<String, dynamic> json) {
  return _ManifestSampleItem.fromJson(json);
}

/// @nodoc
mixin _$ManifestSampleItem {
  @JsonKey(name: 'manifest_no')
  String? get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'phlebotomy_no')
  String? get phlebotomyNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String? get sampleType => throw _privateConstructorUsedError;
  String? get stage => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_count')
  int? get sampleCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_facility_name')
  String? get originFacilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_facility_code')
  String? get originFacilityCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_facility_id')
  int? get originFacilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_name')
  String? get destinationFacilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_code')
  String? get destinationFacilityCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_id')
  int? get destinationFacilityId => throw _privateConstructorUsedError;
  List<ManifestSampleDetail>? get samples => throw _privateConstructorUsedError;

  /// Serializes this ManifestSampleItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestSampleItemCopyWith<ManifestSampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestSampleItemCopyWith<$Res> {
  factory $ManifestSampleItemCopyWith(
    ManifestSampleItem value,
    $Res Function(ManifestSampleItem) then,
  ) = _$ManifestSampleItemCopyWithImpl<$Res, ManifestSampleItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'manifest_no') String? manifestNo,
    @JsonKey(name: 'phlebotomy_no') String? phlebotomyNo,
    @JsonKey(name: 'sample_type') String? sampleType,
    String? stage,
    @JsonKey(name: 'sample_count') int? sampleCount,
    @JsonKey(name: 'origin_facility_name') String? originFacilityName,
    @JsonKey(name: 'origin_facility_code') String? originFacilityCode,
    @JsonKey(name: 'origin_facility_id') int? originFacilityId,
    @JsonKey(name: 'destination_facility_name') String? destinationFacilityName,
    @JsonKey(name: 'destination_facility_code') String? destinationFacilityCode,
    @JsonKey(name: 'destination_facility_id') int? destinationFacilityId,
    List<ManifestSampleDetail>? samples,
  });
}

/// @nodoc
class _$ManifestSampleItemCopyWithImpl<$Res, $Val extends ManifestSampleItem>
    implements $ManifestSampleItemCopyWith<$Res> {
  _$ManifestSampleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = freezed,
    Object? phlebotomyNo = freezed,
    Object? sampleType = freezed,
    Object? stage = freezed,
    Object? sampleCount = freezed,
    Object? originFacilityName = freezed,
    Object? originFacilityCode = freezed,
    Object? originFacilityId = freezed,
    Object? destinationFacilityName = freezed,
    Object? destinationFacilityCode = freezed,
    Object? destinationFacilityId = freezed,
    Object? samples = freezed,
  }) {
    return _then(
      _value.copyWith(
            manifestNo: freezed == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            phlebotomyNo: freezed == phlebotomyNo
                ? _value.phlebotomyNo
                : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            sampleType: freezed == sampleType
                ? _value.sampleType
                : sampleType // ignore: cast_nullable_to_non_nullable
                      as String?,
            stage: freezed == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as String?,
            sampleCount: freezed == sampleCount
                ? _value.sampleCount
                : sampleCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            originFacilityName: freezed == originFacilityName
                ? _value.originFacilityName
                : originFacilityName // ignore: cast_nullable_to_non_nullable
                      as String?,
            originFacilityCode: freezed == originFacilityCode
                ? _value.originFacilityCode
                : originFacilityCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            originFacilityId: freezed == originFacilityId
                ? _value.originFacilityId
                : originFacilityId // ignore: cast_nullable_to_non_nullable
                      as int?,
            destinationFacilityName: freezed == destinationFacilityName
                ? _value.destinationFacilityName
                : destinationFacilityName // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinationFacilityCode: freezed == destinationFacilityCode
                ? _value.destinationFacilityCode
                : destinationFacilityCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinationFacilityId: freezed == destinationFacilityId
                ? _value.destinationFacilityId
                : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                      as int?,
            samples: freezed == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<ManifestSampleDetail>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestSampleItemImplCopyWith<$Res>
    implements $ManifestSampleItemCopyWith<$Res> {
  factory _$$ManifestSampleItemImplCopyWith(
    _$ManifestSampleItemImpl value,
    $Res Function(_$ManifestSampleItemImpl) then,
  ) = __$$ManifestSampleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'manifest_no') String? manifestNo,
    @JsonKey(name: 'phlebotomy_no') String? phlebotomyNo,
    @JsonKey(name: 'sample_type') String? sampleType,
    String? stage,
    @JsonKey(name: 'sample_count') int? sampleCount,
    @JsonKey(name: 'origin_facility_name') String? originFacilityName,
    @JsonKey(name: 'origin_facility_code') String? originFacilityCode,
    @JsonKey(name: 'origin_facility_id') int? originFacilityId,
    @JsonKey(name: 'destination_facility_name') String? destinationFacilityName,
    @JsonKey(name: 'destination_facility_code') String? destinationFacilityCode,
    @JsonKey(name: 'destination_facility_id') int? destinationFacilityId,
    List<ManifestSampleDetail>? samples,
  });
}

/// @nodoc
class __$$ManifestSampleItemImplCopyWithImpl<$Res>
    extends _$ManifestSampleItemCopyWithImpl<$Res, _$ManifestSampleItemImpl>
    implements _$$ManifestSampleItemImplCopyWith<$Res> {
  __$$ManifestSampleItemImplCopyWithImpl(
    _$ManifestSampleItemImpl _value,
    $Res Function(_$ManifestSampleItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = freezed,
    Object? phlebotomyNo = freezed,
    Object? sampleType = freezed,
    Object? stage = freezed,
    Object? sampleCount = freezed,
    Object? originFacilityName = freezed,
    Object? originFacilityCode = freezed,
    Object? originFacilityId = freezed,
    Object? destinationFacilityName = freezed,
    Object? destinationFacilityCode = freezed,
    Object? destinationFacilityId = freezed,
    Object? samples = freezed,
  }) {
    return _then(
      _$ManifestSampleItemImpl(
        manifestNo: freezed == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        phlebotomyNo: freezed == phlebotomyNo
            ? _value.phlebotomyNo
            : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        sampleType: freezed == sampleType
            ? _value.sampleType
            : sampleType // ignore: cast_nullable_to_non_nullable
                  as String?,
        stage: freezed == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String?,
        sampleCount: freezed == sampleCount
            ? _value.sampleCount
            : sampleCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        originFacilityName: freezed == originFacilityName
            ? _value.originFacilityName
            : originFacilityName // ignore: cast_nullable_to_non_nullable
                  as String?,
        originFacilityCode: freezed == originFacilityCode
            ? _value.originFacilityCode
            : originFacilityCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        originFacilityId: freezed == originFacilityId
            ? _value.originFacilityId
            : originFacilityId // ignore: cast_nullable_to_non_nullable
                  as int?,
        destinationFacilityName: freezed == destinationFacilityName
            ? _value.destinationFacilityName
            : destinationFacilityName // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinationFacilityCode: freezed == destinationFacilityCode
            ? _value.destinationFacilityCode
            : destinationFacilityCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinationFacilityId: freezed == destinationFacilityId
            ? _value.destinationFacilityId
            : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                  as int?,
        samples: freezed == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<ManifestSampleDetail>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestSampleItemImpl implements _ManifestSampleItem {
  const _$ManifestSampleItemImpl({
    @JsonKey(name: 'manifest_no') this.manifestNo,
    @JsonKey(name: 'phlebotomy_no') this.phlebotomyNo,
    @JsonKey(name: 'sample_type') this.sampleType,
    this.stage,
    @JsonKey(name: 'sample_count') this.sampleCount,
    @JsonKey(name: 'origin_facility_name') this.originFacilityName,
    @JsonKey(name: 'origin_facility_code') this.originFacilityCode,
    @JsonKey(name: 'origin_facility_id') this.originFacilityId,
    @JsonKey(name: 'destination_facility_name') this.destinationFacilityName,
    @JsonKey(name: 'destination_facility_code') this.destinationFacilityCode,
    @JsonKey(name: 'destination_facility_id') this.destinationFacilityId,
    final List<ManifestSampleDetail>? samples,
  }) : _samples = samples;

  factory _$ManifestSampleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestSampleItemImplFromJson(json);

  @override
  @JsonKey(name: 'manifest_no')
  final String? manifestNo;
  @override
  @JsonKey(name: 'phlebotomy_no')
  final String? phlebotomyNo;
  @override
  @JsonKey(name: 'sample_type')
  final String? sampleType;
  @override
  final String? stage;
  @override
  @JsonKey(name: 'sample_count')
  final int? sampleCount;
  @override
  @JsonKey(name: 'origin_facility_name')
  final String? originFacilityName;
  @override
  @JsonKey(name: 'origin_facility_code')
  final String? originFacilityCode;
  @override
  @JsonKey(name: 'origin_facility_id')
  final int? originFacilityId;
  @override
  @JsonKey(name: 'destination_facility_name')
  final String? destinationFacilityName;
  @override
  @JsonKey(name: 'destination_facility_code')
  final String? destinationFacilityCode;
  @override
  @JsonKey(name: 'destination_facility_id')
  final int? destinationFacilityId;
  final List<ManifestSampleDetail>? _samples;
  @override
  List<ManifestSampleDetail>? get samples {
    final value = _samples;
    if (value == null) return null;
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManifestSampleItem(manifestNo: $manifestNo, phlebotomyNo: $phlebotomyNo, sampleType: $sampleType, stage: $stage, sampleCount: $sampleCount, originFacilityName: $originFacilityName, originFacilityCode: $originFacilityCode, originFacilityId: $originFacilityId, destinationFacilityName: $destinationFacilityName, destinationFacilityCode: $destinationFacilityCode, destinationFacilityId: $destinationFacilityId, samples: $samples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestSampleItemImpl &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.phlebotomyNo, phlebotomyNo) ||
                other.phlebotomyNo == phlebotomyNo) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.sampleCount, sampleCount) ||
                other.sampleCount == sampleCount) &&
            (identical(other.originFacilityName, originFacilityName) ||
                other.originFacilityName == originFacilityName) &&
            (identical(other.originFacilityCode, originFacilityCode) ||
                other.originFacilityCode == originFacilityCode) &&
            (identical(other.originFacilityId, originFacilityId) ||
                other.originFacilityId == originFacilityId) &&
            (identical(
                  other.destinationFacilityName,
                  destinationFacilityName,
                ) ||
                other.destinationFacilityName == destinationFacilityName) &&
            (identical(
                  other.destinationFacilityCode,
                  destinationFacilityCode,
                ) ||
                other.destinationFacilityCode == destinationFacilityCode) &&
            (identical(other.destinationFacilityId, destinationFacilityId) ||
                other.destinationFacilityId == destinationFacilityId) &&
            const DeepCollectionEquality().equals(other._samples, _samples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    manifestNo,
    phlebotomyNo,
    sampleType,
    stage,
    sampleCount,
    originFacilityName,
    originFacilityCode,
    originFacilityId,
    destinationFacilityName,
    destinationFacilityCode,
    destinationFacilityId,
    const DeepCollectionEquality().hash(_samples),
  );

  /// Create a copy of ManifestSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestSampleItemImplCopyWith<_$ManifestSampleItemImpl> get copyWith =>
      __$$ManifestSampleItemImplCopyWithImpl<_$ManifestSampleItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestSampleItemImplToJson(this);
  }
}

abstract class _ManifestSampleItem implements ManifestSampleItem {
  const factory _ManifestSampleItem({
    @JsonKey(name: 'manifest_no') final String? manifestNo,
    @JsonKey(name: 'phlebotomy_no') final String? phlebotomyNo,
    @JsonKey(name: 'sample_type') final String? sampleType,
    final String? stage,
    @JsonKey(name: 'sample_count') final int? sampleCount,
    @JsonKey(name: 'origin_facility_name') final String? originFacilityName,
    @JsonKey(name: 'origin_facility_code') final String? originFacilityCode,
    @JsonKey(name: 'origin_facility_id') final int? originFacilityId,
    @JsonKey(name: 'destination_facility_name')
    final String? destinationFacilityName,
    @JsonKey(name: 'destination_facility_code')
    final String? destinationFacilityCode,
    @JsonKey(name: 'destination_facility_id') final int? destinationFacilityId,
    final List<ManifestSampleDetail>? samples,
  }) = _$ManifestSampleItemImpl;

  factory _ManifestSampleItem.fromJson(Map<String, dynamic> json) =
      _$ManifestSampleItemImpl.fromJson;

  @override
  @JsonKey(name: 'manifest_no')
  String? get manifestNo;
  @override
  @JsonKey(name: 'phlebotomy_no')
  String? get phlebotomyNo;
  @override
  @JsonKey(name: 'sample_type')
  String? get sampleType;
  @override
  String? get stage;
  @override
  @JsonKey(name: 'sample_count')
  int? get sampleCount;
  @override
  @JsonKey(name: 'origin_facility_name')
  String? get originFacilityName;
  @override
  @JsonKey(name: 'origin_facility_code')
  String? get originFacilityCode;
  @override
  @JsonKey(name: 'origin_facility_id')
  int? get originFacilityId;
  @override
  @JsonKey(name: 'destination_facility_name')
  String? get destinationFacilityName;
  @override
  @JsonKey(name: 'destination_facility_code')
  String? get destinationFacilityCode;
  @override
  @JsonKey(name: 'destination_facility_id')
  int? get destinationFacilityId;
  @override
  List<ManifestSampleDetail>? get samples;

  /// Create a copy of ManifestSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestSampleItemImplCopyWith<_$ManifestSampleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ManifestSampleDetail _$ManifestSampleDetailFromJson(Map<String, dynamic> json) {
  return _ManifestSampleDetail.fromJson(json);
}

/// @nodoc
mixin _$ManifestSampleDetail {
  @JsonKey(name: 'sample_code')
  String? get sampleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_code')
  String? get patientCode => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this ManifestSampleDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestSampleDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestSampleDetailCopyWith<ManifestSampleDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestSampleDetailCopyWith<$Res> {
  factory $ManifestSampleDetailCopyWith(
    ManifestSampleDetail value,
    $Res Function(ManifestSampleDetail) then,
  ) = _$ManifestSampleDetailCopyWithImpl<$Res, ManifestSampleDetail>;
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String? sampleCode,
    @JsonKey(name: 'patient_code') String? patientCode,
    String? age,
    String? gender,
  });
}

/// @nodoc
class _$ManifestSampleDetailCopyWithImpl<
  $Res,
  $Val extends ManifestSampleDetail
>
    implements $ManifestSampleDetailCopyWith<$Res> {
  _$ManifestSampleDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestSampleDetail
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
abstract class _$$ManifestSampleDetailImplCopyWith<$Res>
    implements $ManifestSampleDetailCopyWith<$Res> {
  factory _$$ManifestSampleDetailImplCopyWith(
    _$ManifestSampleDetailImpl value,
    $Res Function(_$ManifestSampleDetailImpl) then,
  ) = __$$ManifestSampleDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String? sampleCode,
    @JsonKey(name: 'patient_code') String? patientCode,
    String? age,
    String? gender,
  });
}

/// @nodoc
class __$$ManifestSampleDetailImplCopyWithImpl<$Res>
    extends _$ManifestSampleDetailCopyWithImpl<$Res, _$ManifestSampleDetailImpl>
    implements _$$ManifestSampleDetailImplCopyWith<$Res> {
  __$$ManifestSampleDetailImplCopyWithImpl(
    _$ManifestSampleDetailImpl _value,
    $Res Function(_$ManifestSampleDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestSampleDetail
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
      _$ManifestSampleDetailImpl(
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
class _$ManifestSampleDetailImpl implements _ManifestSampleDetail {
  const _$ManifestSampleDetailImpl({
    @JsonKey(name: 'sample_code') this.sampleCode,
    @JsonKey(name: 'patient_code') this.patientCode,
    this.age,
    this.gender,
  });

  factory _$ManifestSampleDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestSampleDetailImplFromJson(json);

  @override
  @JsonKey(name: 'sample_code')
  final String? sampleCode;
  @override
  @JsonKey(name: 'patient_code')
  final String? patientCode;
  @override
  final String? age;
  @override
  final String? gender;

  @override
  String toString() {
    return 'ManifestSampleDetail(sampleCode: $sampleCode, patientCode: $patientCode, age: $age, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestSampleDetailImpl &&
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

  /// Create a copy of ManifestSampleDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestSampleDetailImplCopyWith<_$ManifestSampleDetailImpl>
  get copyWith =>
      __$$ManifestSampleDetailImplCopyWithImpl<_$ManifestSampleDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestSampleDetailImplToJson(this);
  }
}

abstract class _ManifestSampleDetail implements ManifestSampleDetail {
  const factory _ManifestSampleDetail({
    @JsonKey(name: 'sample_code') final String? sampleCode,
    @JsonKey(name: 'patient_code') final String? patientCode,
    final String? age,
    final String? gender,
  }) = _$ManifestSampleDetailImpl;

  factory _ManifestSampleDetail.fromJson(Map<String, dynamic> json) =
      _$ManifestSampleDetailImpl.fromJson;

  @override
  @JsonKey(name: 'sample_code')
  String? get sampleCode;
  @override
  @JsonKey(name: 'patient_code')
  String? get patientCode;
  @override
  String? get age;
  @override
  String? get gender;

  /// Create a copy of ManifestSampleDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestSampleDetailImplCopyWith<_$ManifestSampleDetailImpl>
  get copyWith => throw _privateConstructorUsedError;
}
