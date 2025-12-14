// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_sample_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateSampleRequest _$UpdateSampleRequestFromJson(Map<String, dynamic> json) {
  return _UpdateSampleRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateSampleRequest {
  @JsonKey(name: "sample_code")
  String get sampleCode => throw _privateConstructorUsedError;
  @JsonKey(name: "patient_code")
  String get patientCode => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;

  /// Serializes this UpdateSampleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSampleRequestCopyWith<UpdateSampleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSampleRequestCopyWith<$Res> {
  factory $UpdateSampleRequestCopyWith(
    UpdateSampleRequest value,
    $Res Function(UpdateSampleRequest) then,
  ) = _$UpdateSampleRequestCopyWithImpl<$Res, UpdateSampleRequest>;
  @useResult
  $Res call({
    @JsonKey(name: "sample_code") String sampleCode,
    @JsonKey(name: "patient_code") String patientCode,
    String age,
    String gender,
  });
}

/// @nodoc
class _$UpdateSampleRequestCopyWithImpl<$Res, $Val extends UpdateSampleRequest>
    implements $UpdateSampleRequestCopyWith<$Res> {
  _$UpdateSampleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = null,
    Object? patientCode = null,
    Object? age = null,
    Object? gender = null,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateSampleRequestImplCopyWith<$Res>
    implements $UpdateSampleRequestCopyWith<$Res> {
  factory _$$UpdateSampleRequestImplCopyWith(
    _$UpdateSampleRequestImpl value,
    $Res Function(_$UpdateSampleRequestImpl) then,
  ) = __$$UpdateSampleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "sample_code") String sampleCode,
    @JsonKey(name: "patient_code") String patientCode,
    String age,
    String gender,
  });
}

/// @nodoc
class __$$UpdateSampleRequestImplCopyWithImpl<$Res>
    extends _$UpdateSampleRequestCopyWithImpl<$Res, _$UpdateSampleRequestImpl>
    implements _$$UpdateSampleRequestImplCopyWith<$Res> {
  __$$UpdateSampleRequestImplCopyWithImpl(
    _$UpdateSampleRequestImpl _value,
    $Res Function(_$UpdateSampleRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = null,
    Object? patientCode = null,
    Object? age = null,
    Object? gender = null,
  }) {
    return _then(
      _$UpdateSampleRequestImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateSampleRequestImpl implements _UpdateSampleRequest {
  const _$UpdateSampleRequestImpl({
    @JsonKey(name: "sample_code") required this.sampleCode,
    @JsonKey(name: "patient_code") required this.patientCode,
    required this.age,
    required this.gender,
  });

  factory _$UpdateSampleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSampleRequestImplFromJson(json);

  @override
  @JsonKey(name: "sample_code")
  final String sampleCode;
  @override
  @JsonKey(name: "patient_code")
  final String patientCode;
  @override
  final String age;
  @override
  final String gender;

  @override
  String toString() {
    return 'UpdateSampleRequest(sampleCode: $sampleCode, patientCode: $patientCode, age: $age, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSampleRequestImpl &&
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

  /// Create a copy of UpdateSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSampleRequestImplCopyWith<_$UpdateSampleRequestImpl> get copyWith =>
      __$$UpdateSampleRequestImplCopyWithImpl<_$UpdateSampleRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSampleRequestImplToJson(this);
  }
}

abstract class _UpdateSampleRequest implements UpdateSampleRequest {
  const factory _UpdateSampleRequest({
    @JsonKey(name: "sample_code") required final String sampleCode,
    @JsonKey(name: "patient_code") required final String patientCode,
    required final String age,
    required final String gender,
  }) = _$UpdateSampleRequestImpl;

  factory _UpdateSampleRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateSampleRequestImpl.fromJson;

  @override
  @JsonKey(name: "sample_code")
  String get sampleCode;
  @override
  @JsonKey(name: "patient_code")
  String get patientCode;
  @override
  String get age;
  @override
  String get gender;

  /// Create a copy of UpdateSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSampleRequestImplCopyWith<_$UpdateSampleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
