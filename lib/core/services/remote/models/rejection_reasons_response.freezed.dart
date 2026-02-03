// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rejection_reasons_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RejectionReasonsResponse _$RejectionReasonsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RejectionReasonsResponse.fromJson(json);
}

/// @nodoc
mixin _$RejectionReasonsResponse {
  @JsonKey(name: "result_code")
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<RejectionReasonItem>? get data => throw _privateConstructorUsedError;

  /// Serializes this RejectionReasonsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RejectionReasonsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectionReasonsResponseCopyWith<RejectionReasonsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectionReasonsResponseCopyWith<$Res> {
  factory $RejectionReasonsResponseCopyWith(
    RejectionReasonsResponse value,
    $Res Function(RejectionReasonsResponse) then,
  ) = _$RejectionReasonsResponseCopyWithImpl<$Res, RejectionReasonsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<RejectionReasonItem>? data,
  });
}

/// @nodoc
class _$RejectionReasonsResponseCopyWithImpl<
  $Res,
  $Val extends RejectionReasonsResponse
>
    implements $RejectionReasonsResponseCopyWith<$Res> {
  _$RejectionReasonsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectionReasonsResponse
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
                      as List<RejectionReasonItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RejectionReasonsResponseImplCopyWith<$Res>
    implements $RejectionReasonsResponseCopyWith<$Res> {
  factory _$$RejectionReasonsResponseImplCopyWith(
    _$RejectionReasonsResponseImpl value,
    $Res Function(_$RejectionReasonsResponseImpl) then,
  ) = __$$RejectionReasonsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<RejectionReasonItem>? data,
  });
}

/// @nodoc
class __$$RejectionReasonsResponseImplCopyWithImpl<$Res>
    extends
        _$RejectionReasonsResponseCopyWithImpl<
          $Res,
          _$RejectionReasonsResponseImpl
        >
    implements _$$RejectionReasonsResponseImplCopyWith<$Res> {
  __$$RejectionReasonsResponseImplCopyWithImpl(
    _$RejectionReasonsResponseImpl _value,
    $Res Function(_$RejectionReasonsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RejectionReasonsResponse
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
      _$RejectionReasonsResponseImpl(
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
                  as List<RejectionReasonItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RejectionReasonsResponseImpl implements _RejectionReasonsResponse {
  const _$RejectionReasonsResponseImpl({
    @JsonKey(name: "result_code") required this.resultCode,
    required this.status,
    required this.message,
    required final List<RejectionReasonItem>? data,
  }) : _data = data;

  factory _$RejectionReasonsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectionReasonsResponseImplFromJson(json);

  @override
  @JsonKey(name: "result_code")
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  final List<RejectionReasonItem>? _data;
  @override
  List<RejectionReasonItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RejectionReasonsResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectionReasonsResponseImpl &&
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

  /// Create a copy of RejectionReasonsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectionReasonsResponseImplCopyWith<_$RejectionReasonsResponseImpl>
  get copyWith =>
      __$$RejectionReasonsResponseImplCopyWithImpl<
        _$RejectionReasonsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectionReasonsResponseImplToJson(this);
  }
}

abstract class _RejectionReasonsResponse implements RejectionReasonsResponse {
  const factory _RejectionReasonsResponse({
    @JsonKey(name: "result_code") required final int? resultCode,
    required final String? status,
    required final String? message,
    required final List<RejectionReasonItem>? data,
  }) = _$RejectionReasonsResponseImpl;

  factory _RejectionReasonsResponse.fromJson(Map<String, dynamic> json) =
      _$RejectionReasonsResponseImpl.fromJson;

  @override
  @JsonKey(name: "result_code")
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  List<RejectionReasonItem>? get data;

  /// Create a copy of RejectionReasonsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectionReasonsResponseImplCopyWith<_$RejectionReasonsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RejectionReasonItem _$RejectionReasonItemFromJson(Map<String, dynamic> json) {
  return _RejectionReasonItem.fromJson(json);
}

/// @nodoc
mixin _$RejectionReasonItem {
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this RejectionReasonItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RejectionReasonItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectionReasonItemCopyWith<RejectionReasonItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectionReasonItemCopyWith<$Res> {
  factory $RejectionReasonItemCopyWith(
    RejectionReasonItem value,
    $Res Function(RejectionReasonItem) then,
  ) = _$RejectionReasonItemCopyWithImpl<$Res, RejectionReasonItem>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class _$RejectionReasonItemCopyWithImpl<$Res, $Val extends RejectionReasonItem>
    implements $RejectionReasonItemCopyWith<$Res> {
  _$RejectionReasonItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectionReasonItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _value.copyWith(
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RejectionReasonItemImplCopyWith<$Res>
    implements $RejectionReasonItemCopyWith<$Res> {
  factory _$$RejectionReasonItemImplCopyWith(
    _$RejectionReasonItemImpl value,
    $Res Function(_$RejectionReasonItemImpl) then,
  ) = __$$RejectionReasonItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$RejectionReasonItemImplCopyWithImpl<$Res>
    extends _$RejectionReasonItemCopyWithImpl<$Res, _$RejectionReasonItemImpl>
    implements _$$RejectionReasonItemImplCopyWith<$Res> {
  __$$RejectionReasonItemImplCopyWithImpl(
    _$RejectionReasonItemImpl _value,
    $Res Function(_$RejectionReasonItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RejectionReasonItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _$RejectionReasonItemImpl(
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RejectionReasonItemImpl implements _RejectionReasonItem {
  const _$RejectionReasonItemImpl({required this.reason});

  factory _$RejectionReasonItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectionReasonItemImplFromJson(json);

  @override
  final String? reason;

  @override
  String toString() {
    return 'RejectionReasonItem(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectionReasonItemImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of RejectionReasonItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectionReasonItemImplCopyWith<_$RejectionReasonItemImpl> get copyWith =>
      __$$RejectionReasonItemImplCopyWithImpl<_$RejectionReasonItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectionReasonItemImplToJson(this);
  }
}

abstract class _RejectionReasonItem implements RejectionReasonItem {
  const factory _RejectionReasonItem({required final String? reason}) =
      _$RejectionReasonItemImpl;

  factory _RejectionReasonItem.fromJson(Map<String, dynamic> json) =
      _$RejectionReasonItemImpl.fromJson;

  @override
  String? get reason;

  /// Create a copy of RejectionReasonItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectionReasonItemImplCopyWith<_$RejectionReasonItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
