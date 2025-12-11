// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) {
  return _LocationResponse.fromJson(json);
}

/// @nodoc
mixin _$LocationResponse {
  @JsonKey(name: "result_code")
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<LocationItem>? get data => throw _privateConstructorUsedError;

  /// Serializes this LocationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationResponseCopyWith<LocationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationResponseCopyWith<$Res> {
  factory $LocationResponseCopyWith(
    LocationResponse value,
    $Res Function(LocationResponse) then,
  ) = _$LocationResponseCopyWithImpl<$Res, LocationResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<LocationItem>? data,
  });
}

/// @nodoc
class _$LocationResponseCopyWithImpl<$Res, $Val extends LocationResponse>
    implements $LocationResponseCopyWith<$Res> {
  _$LocationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationResponse
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
                      as List<LocationItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationResponseImplCopyWith<$Res>
    implements $LocationResponseCopyWith<$Res> {
  factory _$$LocationResponseImplCopyWith(
    _$LocationResponseImpl value,
    $Res Function(_$LocationResponseImpl) then,
  ) = __$$LocationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "result_code") int? resultCode,
    String? status,
    String? message,
    List<LocationItem>? data,
  });
}

/// @nodoc
class __$$LocationResponseImplCopyWithImpl<$Res>
    extends _$LocationResponseCopyWithImpl<$Res, _$LocationResponseImpl>
    implements _$$LocationResponseImplCopyWith<$Res> {
  __$$LocationResponseImplCopyWithImpl(
    _$LocationResponseImpl _value,
    $Res Function(_$LocationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationResponse
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
      _$LocationResponseImpl(
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
                  as List<LocationItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationResponseImpl implements _LocationResponse {
  const _$LocationResponseImpl({
    @JsonKey(name: "result_code") required this.resultCode,
    required this.status,
    required this.message,
    required final List<LocationItem>? data,
  }) : _data = data;

  factory _$LocationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationResponseImplFromJson(json);

  @override
  @JsonKey(name: "result_code")
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  final List<LocationItem>? _data;
  @override
  List<LocationItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocationResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationResponseImpl &&
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

  /// Create a copy of LocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationResponseImplCopyWith<_$LocationResponseImpl> get copyWith =>
      __$$LocationResponseImplCopyWithImpl<_$LocationResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationResponseImplToJson(this);
  }
}

abstract class _LocationResponse implements LocationResponse {
  const factory _LocationResponse({
    @JsonKey(name: "result_code") required final int? resultCode,
    required final String? status,
    required final String? message,
    required final List<LocationItem>? data,
  }) = _$LocationResponseImpl;

  factory _LocationResponse.fromJson(Map<String, dynamic> json) =
      _$LocationResponseImpl.fromJson;

  @override
  @JsonKey(name: "result_code")
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  List<LocationItem>? get data;

  /// Create a copy of LocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationResponseImplCopyWith<_$LocationResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationItem _$LocationItemFromJson(Map<String, dynamic> json) {
  return _LocationItem.fromJson(json);
}

/// @nodoc
mixin _$LocationItem {
  String? get pick => throw _privateConstructorUsedError;
  @JsonKey(name: "location_id")
  int? get locationId => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;

  /// Serializes this LocationItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationItemCopyWith<LocationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationItemCopyWith<$Res> {
  factory $LocationItemCopyWith(
    LocationItem value,
    $Res Function(LocationItem) then,
  ) = _$LocationItemCopyWithImpl<$Res, LocationItem>;
  @useResult
  $Res call({
    String? pick,
    @JsonKey(name: "location_id") int? locationId,
    String? location,
    String? created,
  });
}

/// @nodoc
class _$LocationItemCopyWithImpl<$Res, $Val extends LocationItem>
    implements $LocationItemCopyWith<$Res> {
  _$LocationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? locationId = freezed,
    Object? location = freezed,
    Object? created = freezed,
  }) {
    return _then(
      _value.copyWith(
            pick: freezed == pick
                ? _value.pick
                : pick // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationId: freezed == locationId
                ? _value.locationId
                : locationId // ignore: cast_nullable_to_non_nullable
                      as int?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            created: freezed == created
                ? _value.created
                : created // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationItemImplCopyWith<$Res>
    implements $LocationItemCopyWith<$Res> {
  factory _$$LocationItemImplCopyWith(
    _$LocationItemImpl value,
    $Res Function(_$LocationItemImpl) then,
  ) = __$$LocationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? pick,
    @JsonKey(name: "location_id") int? locationId,
    String? location,
    String? created,
  });
}

/// @nodoc
class __$$LocationItemImplCopyWithImpl<$Res>
    extends _$LocationItemCopyWithImpl<$Res, _$LocationItemImpl>
    implements _$$LocationItemImplCopyWith<$Res> {
  __$$LocationItemImplCopyWithImpl(
    _$LocationItemImpl _value,
    $Res Function(_$LocationItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? locationId = freezed,
    Object? location = freezed,
    Object? created = freezed,
  }) {
    return _then(
      _$LocationItemImpl(
        pick: freezed == pick
            ? _value.pick
            : pick // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationId: freezed == locationId
            ? _value.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as int?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        created: freezed == created
            ? _value.created
            : created // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationItemImpl implements _LocationItem {
  const _$LocationItemImpl({
    required this.pick,
    @JsonKey(name: "location_id") required this.locationId,
    required this.location,
    required this.created,
  });

  factory _$LocationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationItemImplFromJson(json);

  @override
  final String? pick;
  @override
  @JsonKey(name: "location_id")
  final int? locationId;
  @override
  final String? location;
  @override
  final String? created;

  @override
  String toString() {
    return 'LocationItem(pick: $pick, locationId: $locationId, location: $location, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationItemImpl &&
            (identical(other.pick, pick) || other.pick == pick) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pick, locationId, location, created);

  /// Create a copy of LocationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationItemImplCopyWith<_$LocationItemImpl> get copyWith =>
      __$$LocationItemImplCopyWithImpl<_$LocationItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationItemImplToJson(this);
  }
}

abstract class _LocationItem implements LocationItem {
  const factory _LocationItem({
    required final String? pick,
    @JsonKey(name: "location_id") required final int? locationId,
    required final String? location,
    required final String? created,
  }) = _$LocationItemImpl;

  factory _LocationItem.fromJson(Map<String, dynamic> json) =
      _$LocationItemImpl.fromJson;

  @override
  String? get pick;
  @override
  @JsonKey(name: "location_id")
  int? get locationId;
  @override
  String? get location;
  @override
  String? get created;

  /// Create a copy of LocationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationItemImplCopyWith<_$LocationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
