// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_sample_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DeleteSampleRequest _$DeleteSampleRequestFromJson(Map<String, dynamic> json) {
  return _DeleteSampleRequest.fromJson(json);
}

/// @nodoc
mixin _$DeleteSampleRequest {
  @JsonKey(name: 'sample_code')
  String get manifestNo => throw _privateConstructorUsedError;

  /// Serializes this DeleteSampleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteSampleRequestCopyWith<DeleteSampleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteSampleRequestCopyWith<$Res> {
  factory $DeleteSampleRequestCopyWith(
    DeleteSampleRequest value,
    $Res Function(DeleteSampleRequest) then,
  ) = _$DeleteSampleRequestCopyWithImpl<$Res, DeleteSampleRequest>;
  @useResult
  $Res call({@JsonKey(name: 'sample_code') String manifestNo});
}

/// @nodoc
class _$DeleteSampleRequestCopyWithImpl<$Res, $Val extends DeleteSampleRequest>
    implements $DeleteSampleRequestCopyWith<$Res> {
  _$DeleteSampleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? manifestNo = null}) {
    return _then(
      _value.copyWith(
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeleteSampleRequestImplCopyWith<$Res>
    implements $DeleteSampleRequestCopyWith<$Res> {
  factory _$$DeleteSampleRequestImplCopyWith(
    _$DeleteSampleRequestImpl value,
    $Res Function(_$DeleteSampleRequestImpl) then,
  ) = __$$DeleteSampleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'sample_code') String manifestNo});
}

/// @nodoc
class __$$DeleteSampleRequestImplCopyWithImpl<$Res>
    extends _$DeleteSampleRequestCopyWithImpl<$Res, _$DeleteSampleRequestImpl>
    implements _$$DeleteSampleRequestImplCopyWith<$Res> {
  __$$DeleteSampleRequestImplCopyWithImpl(
    _$DeleteSampleRequestImpl _value,
    $Res Function(_$DeleteSampleRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? manifestNo = null}) {
    return _then(
      _$DeleteSampleRequestImpl(
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteSampleRequestImpl implements _DeleteSampleRequest {
  const _$DeleteSampleRequestImpl({
    @JsonKey(name: 'sample_code') required this.manifestNo,
  });

  factory _$DeleteSampleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteSampleRequestImplFromJson(json);

  @override
  @JsonKey(name: 'sample_code')
  final String manifestNo;

  @override
  String toString() {
    return 'DeleteSampleRequest(manifestNo: $manifestNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSampleRequestImpl &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, manifestNo);

  /// Create a copy of DeleteSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSampleRequestImplCopyWith<_$DeleteSampleRequestImpl> get copyWith =>
      __$$DeleteSampleRequestImplCopyWithImpl<_$DeleteSampleRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteSampleRequestImplToJson(this);
  }
}

abstract class _DeleteSampleRequest implements DeleteSampleRequest {
  const factory _DeleteSampleRequest({
    @JsonKey(name: 'sample_code') required final String manifestNo,
  }) = _$DeleteSampleRequestImpl;

  factory _DeleteSampleRequest.fromJson(Map<String, dynamic> json) =
      _$DeleteSampleRequestImpl.fromJson;

  @override
  @JsonKey(name: 'sample_code')
  String get manifestNo;

  /// Create a copy of DeleteSampleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSampleRequestImplCopyWith<_$DeleteSampleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
