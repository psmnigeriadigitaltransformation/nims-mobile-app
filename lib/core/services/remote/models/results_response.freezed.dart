// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResultsResponse _$ResultsResponseFromJson(Map<String, dynamic> json) {
  return _ResultsResponse.fromJson(json);
}

/// @nodoc
mixin _$ResultsResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ResultItem>? get data => throw _privateConstructorUsedError;

  /// Serializes this ResultsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultsResponseCopyWith<ResultsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsResponseCopyWith<$Res> {
  factory $ResultsResponseCopyWith(
    ResultsResponse value,
    $Res Function(ResultsResponse) then,
  ) = _$ResultsResponseCopyWithImpl<$Res, ResultsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ResultItem>? data,
  });
}

/// @nodoc
class _$ResultsResponseCopyWithImpl<$Res, $Val extends ResultsResponse>
    implements $ResultsResponseCopyWith<$Res> {
  _$ResultsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultsResponse
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
                      as List<ResultItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultsResponseImplCopyWith<$Res>
    implements $ResultsResponseCopyWith<$Res> {
  factory _$$ResultsResponseImplCopyWith(
    _$ResultsResponseImpl value,
    $Res Function(_$ResultsResponseImpl) then,
  ) = __$$ResultsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    List<ResultItem>? data,
  });
}

/// @nodoc
class __$$ResultsResponseImplCopyWithImpl<$Res>
    extends _$ResultsResponseCopyWithImpl<$Res, _$ResultsResponseImpl>
    implements _$$ResultsResponseImplCopyWith<$Res> {
  __$$ResultsResponseImplCopyWithImpl(
    _$ResultsResponseImpl _value,
    $Res Function(_$ResultsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultsResponse
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
      _$ResultsResponseImpl(
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
                  as List<ResultItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultsResponseImpl implements _ResultsResponse {
  const _$ResultsResponseImpl({
    @JsonKey(name: 'result_code') this.resultCode,
    this.status,
    this.message,
    final List<ResultItem>? data,
  }) : _data = data;

  factory _$ResultsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  final List<ResultItem>? _data;
  @override
  List<ResultItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultsResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultsResponseImpl &&
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

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultsResponseImplCopyWith<_$ResultsResponseImpl> get copyWith =>
      __$$ResultsResponseImplCopyWithImpl<_$ResultsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultsResponseImplToJson(this);
  }
}

abstract class _ResultsResponse implements ResultsResponse {
  const factory _ResultsResponse({
    @JsonKey(name: 'result_code') final int? resultCode,
    final String? status,
    final String? message,
    final List<ResultItem>? data,
  }) = _$ResultsResponseImpl;

  factory _ResultsResponse.fromJson(Map<String, dynamic> json) =
      _$ResultsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  List<ResultItem>? get data;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultsResponseImplCopyWith<_$ResultsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultItem _$ResultItemFromJson(Map<String, dynamic> json) {
  return _ResultItem.fromJson(json);
}

/// @nodoc
mixin _$ResultItem {
  @JsonKey(name: 'sample_code')
  String? get sampleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String? get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_code')
  String? get patientCode => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this ResultItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultItemCopyWith<ResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultItemCopyWith<$Res> {
  factory $ResultItemCopyWith(
    ResultItem value,
    $Res Function(ResultItem) then,
  ) = _$ResultItemCopyWithImpl<$Res, ResultItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String? sampleCode,
    @JsonKey(name: 'manifest_no') String? manifestNo,
    @JsonKey(name: 'patient_code') String? patientCode,
    String? age,
    String? gender,
  });
}

/// @nodoc
class _$ResultItemCopyWithImpl<$Res, $Val extends ResultItem>
    implements $ResultItemCopyWith<$Res> {
  _$ResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = freezed,
    Object? manifestNo = freezed,
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
            manifestNo: freezed == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ResultItemImplCopyWith<$Res>
    implements $ResultItemCopyWith<$Res> {
  factory _$$ResultItemImplCopyWith(
    _$ResultItemImpl value,
    $Res Function(_$ResultItemImpl) then,
  ) = __$$ResultItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'sample_code') String? sampleCode,
    @JsonKey(name: 'manifest_no') String? manifestNo,
    @JsonKey(name: 'patient_code') String? patientCode,
    String? age,
    String? gender,
  });
}

/// @nodoc
class __$$ResultItemImplCopyWithImpl<$Res>
    extends _$ResultItemCopyWithImpl<$Res, _$ResultItemImpl>
    implements _$$ResultItemImplCopyWith<$Res> {
  __$$ResultItemImplCopyWithImpl(
    _$ResultItemImpl _value,
    $Res Function(_$ResultItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleCode = freezed,
    Object? manifestNo = freezed,
    Object? patientCode = freezed,
    Object? age = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$ResultItemImpl(
        sampleCode: freezed == sampleCode
            ? _value.sampleCode
            : sampleCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        manifestNo: freezed == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
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
class _$ResultItemImpl implements _ResultItem {
  const _$ResultItemImpl({
    @JsonKey(name: 'sample_code') this.sampleCode,
    @JsonKey(name: 'manifest_no') this.manifestNo,
    @JsonKey(name: 'patient_code') this.patientCode,
    this.age,
    this.gender,
  });

  factory _$ResultItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultItemImplFromJson(json);

  @override
  @JsonKey(name: 'sample_code')
  final String? sampleCode;
  @override
  @JsonKey(name: 'manifest_no')
  final String? manifestNo;
  @override
  @JsonKey(name: 'patient_code')
  final String? patientCode;
  @override
  final String? age;
  @override
  final String? gender;

  @override
  String toString() {
    return 'ResultItem(sampleCode: $sampleCode, manifestNo: $manifestNo, patientCode: $patientCode, age: $age, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultItemImpl &&
            (identical(other.sampleCode, sampleCode) ||
                other.sampleCode == sampleCode) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.patientCode, patientCode) ||
                other.patientCode == patientCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender));
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
  );

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultItemImplCopyWith<_$ResultItemImpl> get copyWith =>
      __$$ResultItemImplCopyWithImpl<_$ResultItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultItemImplToJson(this);
  }
}

abstract class _ResultItem implements ResultItem {
  const factory _ResultItem({
    @JsonKey(name: 'sample_code') final String? sampleCode,
    @JsonKey(name: 'manifest_no') final String? manifestNo,
    @JsonKey(name: 'patient_code') final String? patientCode,
    final String? age,
    final String? gender,
  }) = _$ResultItemImpl;

  factory _ResultItem.fromJson(Map<String, dynamic> json) =
      _$ResultItemImpl.fromJson;

  @override
  @JsonKey(name: 'sample_code')
  String? get sampleCode;
  @override
  @JsonKey(name: 'manifest_no')
  String? get manifestNo;
  @override
  @JsonKey(name: 'patient_code')
  String? get patientCode;
  @override
  String? get age;
  @override
  String? get gender;

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultItemImplCopyWith<_$ResultItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
