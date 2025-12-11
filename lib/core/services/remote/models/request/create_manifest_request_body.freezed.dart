// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_manifest_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ManifestRequestItem _$ManifestRequestItemFromJson(Map<String, dynamic> json) {
  return _ManifestRequestItem.fromJson(json);
}

/// @nodoc
mixin _$ManifestRequestItem {
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
  List<ManifestSampleRequest>? get samples =>
      throw _privateConstructorUsedError;

  /// Serializes this ManifestRequestItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestRequestItemCopyWith<ManifestRequestItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestRequestItemCopyWith<$Res> {
  factory $ManifestRequestItemCopyWith(
    ManifestRequestItem value,
    $Res Function(ManifestRequestItem) then,
  ) = _$ManifestRequestItemCopyWithImpl<$Res, ManifestRequestItem>;
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
    List<ManifestSampleRequest>? samples,
  });
}

/// @nodoc
class _$ManifestRequestItemCopyWithImpl<$Res, $Val extends ManifestRequestItem>
    implements $ManifestRequestItemCopyWith<$Res> {
  _$ManifestRequestItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestRequestItem
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
                      as List<ManifestSampleRequest>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManifestRequestItemImplCopyWith<$Res>
    implements $ManifestRequestItemCopyWith<$Res> {
  factory _$$ManifestRequestItemImplCopyWith(
    _$ManifestRequestItemImpl value,
    $Res Function(_$ManifestRequestItemImpl) then,
  ) = __$$ManifestRequestItemImplCopyWithImpl<$Res>;
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
    List<ManifestSampleRequest>? samples,
  });
}

/// @nodoc
class __$$ManifestRequestItemImplCopyWithImpl<$Res>
    extends _$ManifestRequestItemCopyWithImpl<$Res, _$ManifestRequestItemImpl>
    implements _$$ManifestRequestItemImplCopyWith<$Res> {
  __$$ManifestRequestItemImplCopyWithImpl(
    _$ManifestRequestItemImpl _value,
    $Res Function(_$ManifestRequestItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestRequestItem
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
      _$ManifestRequestItemImpl(
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
                  as List<ManifestSampleRequest>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManifestRequestItemImpl implements _ManifestRequestItem {
  const _$ManifestRequestItemImpl({
    @JsonKey(name: "manifest_no") required this.manifestNo,
    @JsonKey(name: "origin_id") required this.originId,
    @JsonKey(name: "destination_id") required this.destinationId,
    @JsonKey(name: "sample_type") required this.sampleType,
    @JsonKey(name: "sample_count") required this.sampleCount,
    @JsonKey(name: "phlebotomy_no") required this.phlebotomyNo,
    @JsonKey(name: "lsp_code") required this.lspCode,
    required this.temperature,
    @JsonKey(name: "user_id") required this.userId,
    required final List<ManifestSampleRequest>? samples,
  }) : _samples = samples;

  factory _$ManifestRequestItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestRequestItemImplFromJson(json);

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
  final List<ManifestSampleRequest>? _samples;
  @override
  List<ManifestSampleRequest>? get samples {
    final value = _samples;
    if (value == null) return null;
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManifestRequestItem(manifestNo: $manifestNo, originId: $originId, destinationId: $destinationId, sampleType: $sampleType, sampleCount: $sampleCount, phlebotomyNo: $phlebotomyNo, lspCode: $lspCode, temperature: $temperature, userId: $userId, samples: $samples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestRequestItemImpl &&
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

  /// Create a copy of ManifestRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestRequestItemImplCopyWith<_$ManifestRequestItemImpl> get copyWith =>
      __$$ManifestRequestItemImplCopyWithImpl<_$ManifestRequestItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestRequestItemImplToJson(this);
  }
}

abstract class _ManifestRequestItem implements ManifestRequestItem {
  const factory _ManifestRequestItem({
    @JsonKey(name: "manifest_no") required final String? manifestNo,
    @JsonKey(name: "origin_id") required final String? originId,
    @JsonKey(name: "destination_id") required final String? destinationId,
    @JsonKey(name: "sample_type") required final String? sampleType,
    @JsonKey(name: "sample_count") required final int? sampleCount,
    @JsonKey(name: "phlebotomy_no") required final String? phlebotomyNo,
    @JsonKey(name: "lsp_code") required final String? lspCode,
    required final String? temperature,
    @JsonKey(name: "user_id") required final String? userId,
    required final List<ManifestSampleRequest>? samples,
  }) = _$ManifestRequestItemImpl;

  factory _ManifestRequestItem.fromJson(Map<String, dynamic> json) =
      _$ManifestRequestItemImpl.fromJson;

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
  List<ManifestSampleRequest>? get samples;

  /// Create a copy of ManifestRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestRequestItemImplCopyWith<_$ManifestRequestItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ManifestSampleRequest _$ManifestSampleRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ManifestSampleRequest.fromJson(json);
}

/// @nodoc
mixin _$ManifestSampleRequest {
  @JsonKey(name: "sample_code")
  String? get sampleCode => throw _privateConstructorUsedError;
  @JsonKey(name: "patient_code")
  String? get patientCode => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this ManifestSampleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManifestSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestSampleRequestCopyWith<ManifestSampleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestSampleRequestCopyWith<$Res> {
  factory $ManifestSampleRequestCopyWith(
    ManifestSampleRequest value,
    $Res Function(ManifestSampleRequest) then,
  ) = _$ManifestSampleRequestCopyWithImpl<$Res, ManifestSampleRequest>;
  @useResult
  $Res call({
    @JsonKey(name: "sample_code") String? sampleCode,
    @JsonKey(name: "patient_code") String? patientCode,
    String? age,
    String? gender,
  });
}

/// @nodoc
class _$ManifestSampleRequestCopyWithImpl<
  $Res,
  $Val extends ManifestSampleRequest
>
    implements $ManifestSampleRequestCopyWith<$Res> {
  _$ManifestSampleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestSampleRequest
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
abstract class _$$ManifestSampleRequestImplCopyWith<$Res>
    implements $ManifestSampleRequestCopyWith<$Res> {
  factory _$$ManifestSampleRequestImplCopyWith(
    _$ManifestSampleRequestImpl value,
    $Res Function(_$ManifestSampleRequestImpl) then,
  ) = __$$ManifestSampleRequestImplCopyWithImpl<$Res>;
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
class __$$ManifestSampleRequestImplCopyWithImpl<$Res>
    extends
        _$ManifestSampleRequestCopyWithImpl<$Res, _$ManifestSampleRequestImpl>
    implements _$$ManifestSampleRequestImplCopyWith<$Res> {
  __$$ManifestSampleRequestImplCopyWithImpl(
    _$ManifestSampleRequestImpl _value,
    $Res Function(_$ManifestSampleRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestSampleRequest
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
      _$ManifestSampleRequestImpl(
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
class _$ManifestSampleRequestImpl implements _ManifestSampleRequest {
  const _$ManifestSampleRequestImpl({
    @JsonKey(name: "sample_code") required this.sampleCode,
    @JsonKey(name: "patient_code") required this.patientCode,
    required this.age,
    required this.gender,
  });

  factory _$ManifestSampleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManifestSampleRequestImplFromJson(json);

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
    return 'ManifestSampleRequest(sampleCode: $sampleCode, patientCode: $patientCode, age: $age, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestSampleRequestImpl &&
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

  /// Create a copy of ManifestSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestSampleRequestImplCopyWith<_$ManifestSampleRequestImpl>
  get copyWith =>
      __$$ManifestSampleRequestImplCopyWithImpl<_$ManifestSampleRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManifestSampleRequestImplToJson(this);
  }
}

abstract class _ManifestSampleRequest implements ManifestSampleRequest {
  const factory _ManifestSampleRequest({
    @JsonKey(name: "sample_code") required final String? sampleCode,
    @JsonKey(name: "patient_code") required final String? patientCode,
    required final String? age,
    required final String? gender,
  }) = _$ManifestSampleRequestImpl;

  factory _ManifestSampleRequest.fromJson(Map<String, dynamic> json) =
      _$ManifestSampleRequestImpl.fromJson;

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

  /// Create a copy of ManifestSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestSampleRequestImplCopyWith<_$ManifestSampleRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
