// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return _Sample.fromJson(json);
}

/// @nodoc
mixin _$Sample {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_id')
  String get originId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_code')
  String get sampleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_code')
  String get patientCode => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_status')
  String get syncStatus => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;

  /// Serializes this Sample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleCopyWith<Sample> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleCopyWith<$Res> {
  factory $SampleCopyWith(Sample value, $Res Function(Sample) then) =
      _$SampleCopyWithImpl<$Res, Sample>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_id') String originId,
    @JsonKey(name: 'sample_code') String sampleCode,
    @JsonKey(name: 'patient_code') String patientCode,
    String age,
    String gender,
    String? comment,
    @JsonKey(name: 'sync_status') String syncStatus,
    String stage,
  });
}

/// @nodoc
class _$SampleCopyWithImpl<$Res, $Val extends Sample>
    implements $SampleCopyWith<$Res> {
  _$SampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? manifestNo = null,
    Object? originId = null,
    Object? sampleCode = null,
    Object? patientCode = null,
    Object? age = null,
    Object? gender = null,
    Object? comment = freezed,
    Object? syncStatus = null,
    Object? stage = null,
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
            sampleCode: null == sampleCode
                ? _value.sampleCode
                : sampleCode // ignore: cast_nullable_to_non_nullable
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
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            syncStatus: null == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SampleImplCopyWith<$Res> implements $SampleCopyWith<$Res> {
  factory _$$SampleImplCopyWith(
    _$SampleImpl value,
    $Res Function(_$SampleImpl) then,
  ) = __$$SampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_id') String originId,
    @JsonKey(name: 'sample_code') String sampleCode,
    @JsonKey(name: 'patient_code') String patientCode,
    String age,
    String gender,
    String? comment,
    @JsonKey(name: 'sync_status') String syncStatus,
    String stage,
  });
}

/// @nodoc
class __$$SampleImplCopyWithImpl<$Res>
    extends _$SampleCopyWithImpl<$Res, _$SampleImpl>
    implements _$$SampleImplCopyWith<$Res> {
  __$$SampleImplCopyWithImpl(
    _$SampleImpl _value,
    $Res Function(_$SampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? manifestNo = null,
    Object? originId = null,
    Object? sampleCode = null,
    Object? patientCode = null,
    Object? age = null,
    Object? gender = null,
    Object? comment = freezed,
    Object? syncStatus = null,
    Object? stage = null,
  }) {
    return _then(
      _$SampleImpl(
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
        sampleCode: null == sampleCode
            ? _value.sampleCode
            : sampleCode // ignore: cast_nullable_to_non_nullable
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
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncStatus: null == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleImpl implements _Sample {
  const _$SampleImpl({
    this.id,
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    @JsonKey(name: 'origin_id') required this.originId,
    @JsonKey(name: 'sample_code') required this.sampleCode,
    @JsonKey(name: 'patient_code') required this.patientCode,
    required this.age,
    required this.gender,
    this.comment,
    @JsonKey(name: 'sync_status') this.syncStatus = 'pending',
    this.stage = 'Order',
  });

  factory _$SampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'manifest_no')
  final String manifestNo;
  @override
  @JsonKey(name: 'origin_id')
  final String originId;
  @override
  @JsonKey(name: 'sample_code')
  final String sampleCode;
  @override
  @JsonKey(name: 'patient_code')
  final String patientCode;
  @override
  final String age;
  @override
  final String gender;
  @override
  final String? comment;
  @override
  @JsonKey(name: 'sync_status')
  final String syncStatus;
  @override
  @JsonKey()
  final String stage;

  @override
  String toString() {
    return 'Sample(id: $id, manifestNo: $manifestNo, originId: $originId, sampleCode: $sampleCode, patientCode: $patientCode, age: $age, gender: $gender, comment: $comment, syncStatus: $syncStatus, stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.originId, originId) ||
                other.originId == originId) &&
            (identical(other.sampleCode, sampleCode) ||
                other.sampleCode == sampleCode) &&
            (identical(other.patientCode, patientCode) ||
                other.patientCode == patientCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    manifestNo,
    originId,
    sampleCode,
    patientCode,
    age,
    gender,
    comment,
    syncStatus,
    stage,
  );

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleImplCopyWith<_$SampleImpl> get copyWith =>
      __$$SampleImplCopyWithImpl<_$SampleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleImplToJson(this);
  }
}

abstract class _Sample implements Sample {
  const factory _Sample({
    final int? id,
    @JsonKey(name: 'manifest_no') required final String manifestNo,
    @JsonKey(name: 'origin_id') required final String originId,
    @JsonKey(name: 'sample_code') required final String sampleCode,
    @JsonKey(name: 'patient_code') required final String patientCode,
    required final String age,
    required final String gender,
    final String? comment,
    @JsonKey(name: 'sync_status') final String syncStatus,
    final String stage,
  }) = _$SampleImpl;

  factory _Sample.fromJson(Map<String, dynamic> json) = _$SampleImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'manifest_no')
  String get manifestNo;
  @override
  @JsonKey(name: 'origin_id')
  String get originId;
  @override
  @JsonKey(name: 'sample_code')
  String get sampleCode;
  @override
  @JsonKey(name: 'patient_code')
  String get patientCode;
  @override
  String get age;
  @override
  String get gender;
  @override
  String? get comment;
  @override
  @JsonKey(name: 'sync_status')
  String get syncStatus;
  @override
  String get stage;

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleImplCopyWith<_$SampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
