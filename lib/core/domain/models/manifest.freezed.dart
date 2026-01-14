// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Manifest _$ManifestFromJson(Map<String, dynamic> json) {
  return _Manifest.fromJson(json);
}

/// @nodoc
mixin _$Manifest {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_id')
  String get originId => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_id')
  String get destinationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_count')
  int get sampleCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'phlebotomy_no')
  String get phlebotomyNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_code')
  String get lspCode => throw _privateConstructorUsedError;
  String? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'originating_facility_name')
  String get originatingFacilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_name')
  String get destinationFacilityName => throw _privateConstructorUsedError;

  /// Serializes this Manifest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Manifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestCopyWith<Manifest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestCopyWith<$Res> {
  factory $ManifestCopyWith(Manifest value, $Res Function(Manifest) then) =
      _$ManifestCopyWithImpl<$Res, Manifest>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_id') String originId,
    @JsonKey(name: 'destination_id') String destinationId,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'phlebotomy_no') String phlebotomyNo,
    @JsonKey(name: 'lsp_code') String lspCode,
    String? temperature,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'originating_facility_name') String originatingFacilityName,
    @JsonKey(name: 'destination_facility_name') String destinationFacilityName,
  });
}

/// @nodoc
class _$ManifestCopyWithImpl<$Res, $Val extends Manifest>
    implements $ManifestCopyWith<$Res> {
  _$ManifestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Manifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? manifestNo = null,
    Object? originId = null,
    Object? destinationId = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? phlebotomyNo = null,
    Object? lspCode = null,
    Object? temperature = freezed,
    Object? userId = null,
    Object? originatingFacilityName = null,
    Object? destinationFacilityName = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            originId: null == originId
                ? _value.originId
                : originId // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationId: null == destinationId
                ? _value.destinationId
                : destinationId // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleType: null == sampleType
                ? _value.sampleType
                : sampleType // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleCount: null == sampleCount
                ? _value.sampleCount
                : sampleCount // ignore: cast_nullable_to_non_nullable
                      as int,
            phlebotomyNo: null == phlebotomyNo
                ? _value.phlebotomyNo
                : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                      as String,
            lspCode: null == lspCode
                ? _value.lspCode
                : lspCode // ignore: cast_nullable_to_non_nullable
                      as String,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            originatingFacilityName: null == originatingFacilityName
                ? _value.originatingFacilityName
                : originatingFacilityName // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationFacilityName: null == destinationFacilityName
                ? _value.destinationFacilityName
                : destinationFacilityName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestImplCopyWith<$Res>
    implements $ManifestCopyWith<$Res> {
  factory _$$ManifestImplCopyWith(
    _$ManifestImpl value,
    $Res Function(_$ManifestImpl) then,
  ) = __$$ManifestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_id') String originId,
    @JsonKey(name: 'destination_id') String destinationId,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'phlebotomy_no') String phlebotomyNo,
    @JsonKey(name: 'lsp_code') String lspCode,
    String? temperature,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'originating_facility_name') String originatingFacilityName,
    @JsonKey(name: 'destination_facility_name') String destinationFacilityName,
  });
}

/// @nodoc
class __$$ManifestImplCopyWithImpl<$Res>
    extends _$ManifestCopyWithImpl<$Res, _$ManifestImpl>
    implements _$$ManifestImplCopyWith<$Res> {
  __$$ManifestImplCopyWithImpl(
    _$ManifestImpl _value,
    $Res Function(_$ManifestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Manifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? manifestNo = null,
    Object? originId = null,
    Object? destinationId = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? phlebotomyNo = null,
    Object? lspCode = null,
    Object? temperature = freezed,
    Object? userId = null,
    Object? originatingFacilityName = null,
    Object? destinationFacilityName = null,
  }) {
    return _then(
      _$ManifestImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        originId: null == originId
            ? _value.originId
            : originId // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationId: null == destinationId
            ? _value.destinationId
            : destinationId // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleType: null == sampleType
            ? _value.sampleType
            : sampleType // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleCount: null == sampleCount
            ? _value.sampleCount
            : sampleCount // ignore: cast_nullable_to_non_nullable
                  as int,
        phlebotomyNo: null == phlebotomyNo
            ? _value.phlebotomyNo
            : phlebotomyNo // ignore: cast_nullable_to_non_nullable
                  as String,
        lspCode: null == lspCode
            ? _value.lspCode
            : lspCode // ignore: cast_nullable_to_non_nullable
                  as String,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        originatingFacilityName: null == originatingFacilityName
            ? _value.originatingFacilityName
            : originatingFacilityName // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationFacilityName: null == destinationFacilityName
            ? _value.destinationFacilityName
            : destinationFacilityName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestImpl implements _Manifest {
  const _$ManifestImpl({
    this.id,
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    @JsonKey(name: 'origin_id') required this.originId,
    @JsonKey(name: 'destination_id') required this.destinationId,
    @JsonKey(name: 'sample_type') required this.sampleType,
    @JsonKey(name: 'sample_count') required this.sampleCount,
    @JsonKey(name: 'phlebotomy_no') required this.phlebotomyNo,
    @JsonKey(name: 'lsp_code') required this.lspCode,
    this.temperature,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'originating_facility_name')
    required this.originatingFacilityName,
    @JsonKey(name: 'destination_facility_name')
    required this.destinationFacilityName,
  });

  factory _$ManifestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'manifest_no')
  final String manifestNo;
  @override
  @JsonKey(name: 'origin_id')
  final String originId;
  @override
  @JsonKey(name: 'destination_id')
  final String destinationId;
  @override
  @JsonKey(name: 'sample_type')
  final String sampleType;
  @override
  @JsonKey(name: 'sample_count')
  final int sampleCount;
  @override
  @JsonKey(name: 'phlebotomy_no')
  final String phlebotomyNo;
  @override
  @JsonKey(name: 'lsp_code')
  final String lspCode;
  @override
  final String? temperature;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'originating_facility_name')
  final String originatingFacilityName;
  @override
  @JsonKey(name: 'destination_facility_name')
  final String destinationFacilityName;

  @override
  String toString() {
    return 'Manifest(id: $id, manifestNo: $manifestNo, originId: $originId, destinationId: $destinationId, sampleType: $sampleType, sampleCount: $sampleCount, phlebotomyNo: $phlebotomyNo, lspCode: $lspCode, temperature: $temperature, userId: $userId, originatingFacilityName: $originatingFacilityName, destinationFacilityName: $destinationFacilityName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(
                  other.originatingFacilityName,
                  originatingFacilityName,
                ) ||
                other.originatingFacilityName == originatingFacilityName) &&
            (identical(
                  other.destinationFacilityName,
                  destinationFacilityName,
                ) ||
                other.destinationFacilityName == destinationFacilityName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    manifestNo,
    originId,
    destinationId,
    sampleType,
    sampleCount,
    phlebotomyNo,
    lspCode,
    temperature,
    userId,
    originatingFacilityName,
    destinationFacilityName,
  );

  /// Create a copy of Manifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestImplCopyWith<_$ManifestImpl> get copyWith =>
      __$$ManifestImplCopyWithImpl<_$ManifestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestImplToJson(this);
  }
}

abstract class _Manifest implements Manifest {
  const factory _Manifest({
    final int? id,
    @JsonKey(name: 'manifest_no') required final String manifestNo,
    @JsonKey(name: 'origin_id') required final String originId,
    @JsonKey(name: 'destination_id') required final String destinationId,
    @JsonKey(name: 'sample_type') required final String sampleType,
    @JsonKey(name: 'sample_count') required final int sampleCount,
    @JsonKey(name: 'phlebotomy_no') required final String phlebotomyNo,
    @JsonKey(name: 'lsp_code') required final String lspCode,
    final String? temperature,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'originating_facility_name')
    required final String originatingFacilityName,
    @JsonKey(name: 'destination_facility_name')
    required final String destinationFacilityName,
  }) = _$ManifestImpl;

  factory _Manifest.fromJson(Map<String, dynamic> json) =
      _$ManifestImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'manifest_no')
  String get manifestNo;
  @override
  @JsonKey(name: 'origin_id')
  String get originId;
  @override
  @JsonKey(name: 'destination_id')
  String get destinationId;
  @override
  @JsonKey(name: 'sample_type')
  String get sampleType;
  @override
  @JsonKey(name: 'sample_count')
  int get sampleCount;
  @override
  @JsonKey(name: 'phlebotomy_no')
  String get phlebotomyNo;
  @override
  @JsonKey(name: 'lsp_code')
  String get lspCode;
  @override
  String? get temperature;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'originating_facility_name')
  String get originatingFacilityName;
  @override
  @JsonKey(name: 'destination_facility_name')
  String get destinationFacilityName;

  /// Create a copy of Manifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestImplCopyWith<_$ManifestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
