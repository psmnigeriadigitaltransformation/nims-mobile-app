// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_types_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model',
);

SampleTypesResponse _$SampleTypesResponseFromJson(Map<String, dynamic> json) {
  return _SampleTypesResponse.fromJson(json);
}

/// @nodoc
mixin _$SampleTypesResponse {
  @JsonKey(name: "result_code")
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<SampleTypeItem>? get data => throw _privateConstructorUsedError;

  /// Serializes this SampleTypesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SampleTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleTypesResponseCopyWith<SampleTypesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleTypesResponseCopyWith<$Res> {
  factory $SampleTypesResponseCopyWith(
    SampleTypesResponse value,
    $Res Function(SampleTypesResponse) then,
  ) = _$SampleTypesResponseCopyWithImpl<$Res, SampleTypesResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<SampleTypeItem>? data,
  });
}

/// @nodoc
class _$SampleTypesResponseCopyWithImpl<$Res, $Val extends SampleTypesResponse>
    implements $SampleTypesResponseCopyWith<$Res> {
  _$SampleTypesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SampleTypesResponse
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
                      as List<SampleTypeItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SampleTypesResponseImplCopyWith<$Res>
    implements $SampleTypesResponseCopyWith<$Res> {
  factory _$$SampleTypesResponseImplCopyWith(
    _$SampleTypesResponseImpl value,
    $Res Function(_$SampleTypesResponseImpl) then,
  ) = __$$SampleTypesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<SampleTypeItem>? data,
  });
}

/// @nodoc
class __$$SampleTypesResponseImplCopyWithImpl<$Res>
    extends _$SampleTypesResponseCopyWithImpl<$Res, _$SampleTypesResponseImpl>
    implements _$$SampleTypesResponseImplCopyWith<$Res> {
  __$$SampleTypesResponseImplCopyWithImpl(
    _$SampleTypesResponseImpl _value,
    $Res Function(_$SampleTypesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SampleTypesResponse
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
      _$SampleTypesResponseImpl(
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
                  as List<SampleTypeItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleTypesResponseImpl implements _SampleTypesResponse {
  const _$SampleTypesResponseImpl({
    @JsonKey(name: "result_code") required this.resultCode,
    required this.status,
    required this.message,
    required final List<SampleTypeItem>? data,
  }) : _data = data;

  factory _$SampleTypesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleTypesResponseImplFromJson(json);

  @override
  @JsonKey(name: "result_code")
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  final List<SampleTypeItem>? _data;
  @override
  List<SampleTypeItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SampleTypesResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleTypesResponseImpl &&
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

  /// Create a copy of SampleTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleTypesResponseImplCopyWith<_$SampleTypesResponseImpl> get copyWith =>
      __$$SampleTypesResponseImplCopyWithImpl<_$SampleTypesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleTypesResponseImplToJson(this);
  }
}

abstract class _SampleTypesResponse implements SampleTypesResponse {
  const factory _SampleTypesResponse({
    @JsonKey(name: "result_code") required final int? resultCode,
    required final String? status,
    required final String? message,
    required final List<SampleTypeItem>? data,
  }) = _$SampleTypesResponseImpl;

  factory _SampleTypesResponse.fromJson(Map<String, dynamic> json) =
      _$SampleTypesResponseImpl.fromJson;

  @override
  @JsonKey(name: "result_code")
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  List<SampleTypeItem>? get data;

  /// Create a copy of SampleTypesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleTypesResponseImplCopyWith<_$SampleTypesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SampleTypeItem _$SampleTypeItemFromJson(Map<String, dynamic> json) {
  return _SampleTypeItem.fromJson(json);
}

/// @nodoc
mixin _$SampleTypeItem {
  String? get pick => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullname")
  String? get fullName => throw _privateConstructorUsedError;

  /// Serializes this SampleTypeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SampleTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleTypeItemCopyWith<SampleTypeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleTypeItemCopyWith<$Res> {
  factory $SampleTypeItemCopyWith(
    SampleTypeItem value,
    $Res Function(SampleTypeItem) then,
  ) = _$SampleTypeItemCopyWithImpl<$Res, SampleTypeItem>;
  @useResult
  $Res call({
    String? pick,
    int? id,
    @JsonKey(name: "fullname") String? fullName,
  });
}

/// @nodoc
class _$SampleTypeItemCopyWithImpl<$Res, $Val extends SampleTypeItem>
    implements $SampleTypeItemCopyWith<$Res> {
  _$SampleTypeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SampleTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? id = freezed,
    Object? fullName = freezed,
  }) {
    return _then(
      _value.copyWith(
            pick: freezed == pick
                ? _value.pick
                : pick // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SampleTypeItemImplCopyWith<$Res>
    implements $SampleTypeItemCopyWith<$Res> {
  factory _$$SampleTypeItemImplCopyWith(
    _$SampleTypeItemImpl value,
    $Res Function(_$SampleTypeItemImpl) then,
  ) = __$$SampleTypeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? pick,
    int? id,
    @JsonKey(name: "fullname") String? fullName,
  });
}

/// @nodoc
class __$$SampleTypeItemImplCopyWithImpl<$Res>
    extends _$SampleTypeItemCopyWithImpl<$Res, _$SampleTypeItemImpl>
    implements _$$SampleTypeItemImplCopyWith<$Res> {
  __$$SampleTypeItemImplCopyWithImpl(
    _$SampleTypeItemImpl _value,
    $Res Function(_$SampleTypeItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SampleTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? id = freezed,
    Object? fullName = freezed,
  }) {
    return _then(
      _$SampleTypeItemImpl(
        pick: freezed == pick
            ? _value.pick
            : pick // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleTypeItemImpl implements _SampleTypeItem {
  const _$SampleTypeItemImpl({
    required this.pick,
    required this.id,
    @JsonKey(name: "fullname") required this.fullName,
  });

  factory _$SampleTypeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleTypeItemImplFromJson(json);

  @override
  final String? pick;
  @override
  final int? id;
  @override
  @JsonKey(name: "fullname")
  final String? fullName;

  @override
  String toString() {
    return 'SampleTypeItem(pick: $pick, id: $id, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleTypeItemImpl &&
            (identical(other.pick, pick) || other.pick == pick) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pick, id, fullName);

  /// Create a copy of SampleTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleTypeItemImplCopyWith<_$SampleTypeItemImpl> get copyWith =>
      __$$SampleTypeItemImplCopyWithImpl<_$SampleTypeItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleTypeItemImplToJson(this);
  }
}

abstract class _SampleTypeItem implements SampleTypeItem {
  const factory _SampleTypeItem({
    required final String? pick,
    required final int? id,
    @JsonKey(name: "fullname") required final String? fullName,
  }) = _$SampleTypeItemImpl;

  factory _SampleTypeItem.fromJson(Map<String, dynamic> json) =
      _$SampleTypeItemImpl.fromJson;

  @override
  String? get pick;
  @override
  int? get id;
  @override
  @JsonKey(name: "fullname")
  String? get fullName;

  /// Create a copy of SampleTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleTypeItemImplCopyWith<_$SampleTypeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
