// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LabResult _$LabResultFromJson(Map<String, dynamic> json) {
  return _LabResult.fromJson(json);
}

/// @nodoc
mixin _$LabResult {
  @JsonKey(name: 'sample_code')
  String get sampleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_code')
  String get patientCode => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'facility_id')
  String get facilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_picked')
  int get isPicked => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_rejected')
  int get isRejected => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_sync_status')
  String? get rejectionSyncStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_date')
  String? get rejectionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_no')
  String? get routeNo => throw _privateConstructorUsedError;

  /// Serializes this LabResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LabResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabResultCopyWith<LabResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabResultCopyWith<$Res> {
  factory $LabResultCopyWith(LabResult value, $Res Function(LabResult) then) =
      _$LabResultCopyWithImpl<$Res, LabResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String sampleCode,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'patient_code') String patientCode,
    String age,
    String gender,
    @JsonKey(name: 'facility_id') String facilityId,
    @JsonKey(name: 'is_picked') int isPicked,
    @JsonKey(name: 'is_rejected') int isRejected,
    @JsonKey(name: 'rejection_sync_status') String? rejectionSyncStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'rejection_date') String? rejectionDate,
    @JsonKey(name: 'route_no') String? routeNo,
  });
}

/// @nodoc
class _$LabResultCopyWithImpl<$Res, $Val extends LabResult>
    implements $LabResultCopyWith<$Res> {
  _$LabResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LabResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = null,
    Object? manifestNo = null,
    Object? patientCode = null,
    Object? age = null,
    Object? gender = null,
    Object? facilityId = null,
    Object? isPicked = null,
    Object? isRejected = null,
    Object? rejectionSyncStatus = freezed,
    Object? rejectionReason = freezed,
    Object? rejectionDate = freezed,
    Object? routeNo = freezed,
  }) {
    return _then(
      _value.copyWith(
            sampleCode: null == sampleCode
                ? _value.sampleCode
                : sampleCode // ignore: cast_nullable_to_non_nullable
                      as String,
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            patientCode: null == patientCode
                ? _value.patientCode
                : patientCode // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
            facilityId: null == facilityId
                ? _value.facilityId
                : facilityId // ignore: cast_nullable_to_non_nullable
                      as String,
            isPicked: null == isPicked
                ? _value.isPicked
                : isPicked // ignore: cast_nullable_to_non_nullable
                      as int,
            isRejected: null == isRejected
                ? _value.isRejected
                : isRejected // ignore: cast_nullable_to_non_nullable
                      as int,
            rejectionSyncStatus: freezed == rejectionSyncStatus
                ? _value.rejectionSyncStatus
                : rejectionSyncStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            rejectionReason: freezed == rejectionReason
                ? _value.rejectionReason
                : rejectionReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            rejectionDate: freezed == rejectionDate
                ? _value.rejectionDate
                : rejectionDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            routeNo: freezed == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LabResultImplCopyWith<$Res>
    implements $LabResultCopyWith<$Res> {
  factory _$$LabResultImplCopyWith(
    _$LabResultImpl value,
    $Res Function(_$LabResultImpl) then,
  ) = __$$LabResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String sampleCode,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'patient_code') String patientCode,
    String age,
    String gender,
    @JsonKey(name: 'facility_id') String facilityId,
    @JsonKey(name: 'is_picked') int isPicked,
    @JsonKey(name: 'is_rejected') int isRejected,
    @JsonKey(name: 'rejection_sync_status') String? rejectionSyncStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'rejection_date') String? rejectionDate,
    @JsonKey(name: 'route_no') String? routeNo,
  });
}

/// @nodoc
class __$$LabResultImplCopyWithImpl<$Res>
    extends _$LabResultCopyWithImpl<$Res, _$LabResultImpl>
    implements _$$LabResultImplCopyWith<$Res> {
  __$$LabResultImplCopyWithImpl(
    _$LabResultImpl _value,
    $Res Function(_$LabResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LabResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = null,
    Object? manifestNo = null,
    Object? patientCode = null,
    Object? age = null,
    Object? gender = null,
    Object? facilityId = null,
    Object? isPicked = null,
    Object? isRejected = null,
    Object? rejectionSyncStatus = freezed,
    Object? rejectionReason = freezed,
    Object? rejectionDate = freezed,
    Object? routeNo = freezed,
  }) {
    return _then(
      _$LabResultImpl(
        sampleCode: null == sampleCode
            ? _value.sampleCode
            : sampleCode // ignore: cast_nullable_to_non_nullable
                  as String,
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        patientCode: null == patientCode
            ? _value.patientCode
            : patientCode // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
        facilityId: null == facilityId
            ? _value.facilityId
            : facilityId // ignore: cast_nullable_to_non_nullable
                  as String,
        isPicked: null == isPicked
            ? _value.isPicked
            : isPicked // ignore: cast_nullable_to_non_nullable
                  as int,
        isRejected: null == isRejected
            ? _value.isRejected
            : isRejected // ignore: cast_nullable_to_non_nullable
                  as int,
        rejectionSyncStatus: freezed == rejectionSyncStatus
            ? _value.rejectionSyncStatus
            : rejectionSyncStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        rejectionReason: freezed == rejectionReason
            ? _value.rejectionReason
            : rejectionReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        rejectionDate: freezed == rejectionDate
            ? _value.rejectionDate
            : rejectionDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        routeNo: freezed == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LabResultImpl implements _LabResult {
  const _$LabResultImpl({
    @JsonKey(name: 'sample_code') required this.sampleCode,
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    @JsonKey(name: 'patient_code') required this.patientCode,
    required this.age,
    required this.gender,
    @JsonKey(name: 'facility_id') required this.facilityId,
    @JsonKey(name: 'is_picked') this.isPicked = 0,
    @JsonKey(name: 'is_rejected') this.isRejected = 0,
    @JsonKey(name: 'rejection_sync_status') this.rejectionSyncStatus,
    @JsonKey(name: 'rejection_reason') this.rejectionReason,
    @JsonKey(name: 'rejection_date') this.rejectionDate,
    @JsonKey(name: 'route_no') this.routeNo,
  });

  factory _$LabResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabResultImplFromJson(json);

  @override
  @JsonKey(name: 'sample_code')
  final String sampleCode;
  @override
  @JsonKey(name: 'manifest_no')
  final String manifestNo;
  @override
  @JsonKey(name: 'patient_code')
  final String patientCode;
  @override
  final String age;
  @override
  final String gender;
  @override
  @JsonKey(name: 'facility_id')
  final String facilityId;
  @override
  @JsonKey(name: 'is_picked')
  final int isPicked;
  @override
  @JsonKey(name: 'is_rejected')
  final int isRejected;
  @override
  @JsonKey(name: 'rejection_sync_status')
  final String? rejectionSyncStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @override
  @JsonKey(name: 'rejection_date')
  final String? rejectionDate;
  @override
  @JsonKey(name: 'route_no')
  final String? routeNo;

  @override
  String toString() {
    return 'LabResult(sampleCode: $sampleCode, manifestNo: $manifestNo, patientCode: $patientCode, age: $age, gender: $gender, facilityId: $facilityId, isPicked: $isPicked, isRejected: $isRejected, rejectionSyncStatus: $rejectionSyncStatus, rejectionReason: $rejectionReason, rejectionDate: $rejectionDate, routeNo: $routeNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabResultImpl &&
            (identical(other.sampleCode, sampleCode) ||
                other.sampleCode == sampleCode) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.patientCode, patientCode) ||
                other.patientCode == patientCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.isPicked, isPicked) ||
                other.isPicked == isPicked) &&
            (identical(other.isRejected, isRejected) ||
                other.isRejected == isRejected) &&
            (identical(other.rejectionSyncStatus, rejectionSyncStatus) ||
                other.rejectionSyncStatus == rejectionSyncStatus) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.rejectionDate, rejectionDate) ||
                other.rejectionDate == rejectionDate) &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sampleCode,
    manifestNo,
    patientCode,
    age,
    gender,
    facilityId,
    isPicked,
    isRejected,
    rejectionSyncStatus,
    rejectionReason,
    rejectionDate,
    routeNo,
  );

  /// Create a copy of LabResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabResultImplCopyWith<_$LabResultImpl> get copyWith =>
      __$$LabResultImplCopyWithImpl<_$LabResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabResultImplToJson(this);
  }
}

abstract class _LabResult implements LabResult {
  const factory _LabResult({
    @JsonKey(name: 'sample_code') required final String sampleCode,
    @JsonKey(name: 'manifest_no') required final String manifestNo,
    @JsonKey(name: 'patient_code') required final String patientCode,
    required final String age,
    required final String gender,
    @JsonKey(name: 'facility_id') required final String facilityId,
    @JsonKey(name: 'is_picked') final int isPicked,
    @JsonKey(name: 'is_rejected') final int isRejected,
    @JsonKey(name: 'rejection_sync_status') final String? rejectionSyncStatus,
    @JsonKey(name: 'rejection_reason') final String? rejectionReason,
    @JsonKey(name: 'rejection_date') final String? rejectionDate,
    @JsonKey(name: 'route_no') final String? routeNo,
  }) = _$LabResultImpl;

  factory _LabResult.fromJson(Map<String, dynamic> json) =
      _$LabResultImpl.fromJson;

  @override
  @JsonKey(name: 'sample_code')
  String get sampleCode;
  @override
  @JsonKey(name: 'manifest_no')
  String get manifestNo;
  @override
  @JsonKey(name: 'patient_code')
  String get patientCode;
  @override
  String get age;
  @override
  String get gender;
  @override
  @JsonKey(name: 'facility_id')
  String get facilityId;
  @override
  @JsonKey(name: 'is_picked')
  int get isPicked;
  @override
  @JsonKey(name: 'is_rejected')
  int get isRejected;
  @override
  @JsonKey(name: 'rejection_sync_status')
  String? get rejectionSyncStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;
  @override
  @JsonKey(name: 'rejection_date')
  String? get rejectionDate;
  @override
  @JsonKey(name: 'route_no')
  String? get routeNo;

  /// Create a copy of LabResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabResultImplCopyWith<_$LabResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
