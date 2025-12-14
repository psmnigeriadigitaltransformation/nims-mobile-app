// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_manifest_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateManifestRequest _$UpdateManifestRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateManifestRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateManifestRequest {
  @JsonKey(name: 'manifest_no')
  String get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_facility_id')
  String get originFacilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_id')
  String get destinationFacilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'phlebotomy_no')
  String get phlebotomyNo => throw _privateConstructorUsedError;
  String get temperature => throw _privateConstructorUsedError;

  /// Serializes this UpdateManifestRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateManifestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateManifestRequestCopyWith<UpdateManifestRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateManifestRequestCopyWith<$Res> {
  factory $UpdateManifestRequestCopyWith(
    UpdateManifestRequest value,
    $Res Function(UpdateManifestRequest) then,
  ) = _$UpdateManifestRequestCopyWithImpl<$Res, UpdateManifestRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'phlebotomy_no') String phlebotomyNo,
    String temperature,
  });
}

/// @nodoc
class _$UpdateManifestRequestCopyWithImpl<
  $Res,
  $Val extends UpdateManifestRequest
>
    implements $UpdateManifestRequestCopyWith<$Res> {
  _$UpdateManifestRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateManifestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? sampleType = null,
    Object? phlebotomyNo = null,
    Object? temperature = null,
  }) {
    return _then(
      _value.copyWith(
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            originFacilityId: null == originFacilityId
                ? _value.originFacilityId
                : originFacilityId // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationFacilityId: null == destinationFacilityId
                ? _value.destinationFacilityId
                : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleType: null == sampleType
                ? _value.sampleType
                : sampleType // ignore: cast_nullable_to_non_nullable
                      as String,
            phlebotomyNo: null == phlebotomyNo
                ? _value.phlebotomyNo
                : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                      as String,
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateManifestRequestImplCopyWith<$Res>
    implements $UpdateManifestRequestCopyWith<$Res> {
  factory _$$UpdateManifestRequestImplCopyWith(
    _$UpdateManifestRequestImpl value,
    $Res Function(_$UpdateManifestRequestImpl) then,
  ) = __$$UpdateManifestRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'phlebotomy_no') String phlebotomyNo,
    String temperature,
  });
}

/// @nodoc
class __$$UpdateManifestRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateManifestRequestCopyWithImpl<$Res, _$UpdateManifestRequestImpl>
    implements _$$UpdateManifestRequestImplCopyWith<$Res> {
  __$$UpdateManifestRequestImplCopyWithImpl(
    _$UpdateManifestRequestImpl _value,
    $Res Function(_$UpdateManifestRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateManifestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? sampleType = null,
    Object? phlebotomyNo = null,
    Object? temperature = null,
  }) {
    return _then(
      _$UpdateManifestRequestImpl(
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        originFacilityId: null == originFacilityId
            ? _value.originFacilityId
            : originFacilityId // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationFacilityId: null == destinationFacilityId
            ? _value.destinationFacilityId
            : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleType: null == sampleType
            ? _value.sampleType
            : sampleType // ignore: cast_nullable_to_non_nullable
                  as String,
        phlebotomyNo: null == phlebotomyNo
            ? _value.phlebotomyNo
            : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                  as String,
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateManifestRequestImpl implements _UpdateManifestRequest {
  const _$UpdateManifestRequestImpl({
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    @JsonKey(name: 'origin_facility_id') required this.originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required this.destinationFacilityId,
    @JsonKey(name: 'sample_type') required this.sampleType,
    @JsonKey(name: 'phlebotomy_no') required this.phlebotomyNo,
    required this.temperature,
  });

  factory _$UpdateManifestRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateManifestRequestImplFromJson(json);

  @override
  @JsonKey(name: 'manifest_no')
  final String manifestNo;
  @override
  @JsonKey(name: 'origin_facility_id')
  final String originFacilityId;
  @override
  @JsonKey(name: 'destination_facility_id')
  final String destinationFacilityId;
  @override
  @JsonKey(name: 'sample_type')
  final String sampleType;
  @override
  @JsonKey(name: 'phlebotomy_no')
  final String phlebotomyNo;
  @override
  final String temperature;

  @override
  String toString() {
    return 'UpdateManifestRequest(manifestNo: $manifestNo, originFacilityId: $originFacilityId, destinationFacilityId: $destinationFacilityId, sampleType: $sampleType, phlebotomyNo: $phlebotomyNo, temperature: $temperature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateManifestRequestImpl &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.originFacilityId, originFacilityId) ||
                other.originFacilityId == originFacilityId) &&
            (identical(other.destinationFacilityId, destinationFacilityId) ||
                other.destinationFacilityId == destinationFacilityId) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.phlebotomyNo, phlebotomyNo) ||
                other.phlebotomyNo == phlebotomyNo) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    manifestNo,
    originFacilityId,
    destinationFacilityId,
    sampleType,
    phlebotomyNo,
    temperature,
  );

  /// Create a copy of UpdateManifestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateManifestRequestImplCopyWith<_$UpdateManifestRequestImpl>
  get copyWith =>
      __$$UpdateManifestRequestImplCopyWithImpl<_$UpdateManifestRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateManifestRequestImplToJson(this);
  }
}

abstract class _UpdateManifestRequest implements UpdateManifestRequest {
  const factory _UpdateManifestRequest({
    @JsonKey(name: 'manifest_no') required final String manifestNo,
    @JsonKey(name: 'origin_facility_id') required final String originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required final String destinationFacilityId,
    @JsonKey(name: 'sample_type') required final String sampleType,
    @JsonKey(name: 'phlebotomy_no') required final String phlebotomyNo,
    required final String temperature,
  }) = _$UpdateManifestRequestImpl;

  factory _UpdateManifestRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateManifestRequestImpl.fromJson;

  @override
  @JsonKey(name: 'manifest_no')
  String get manifestNo;
  @override
  @JsonKey(name: 'origin_facility_id')
  String get originFacilityId;
  @override
  @JsonKey(name: 'destination_facility_id')
  String get destinationFacilityId;
  @override
  @JsonKey(name: 'sample_type')
  String get sampleType;
  @override
  @JsonKey(name: 'phlebotomy_no')
  String get phlebotomyNo;
  @override
  String get temperature;

  /// Create a copy of UpdateManifestRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateManifestRequestImplCopyWith<_$UpdateManifestRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
