// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShipmentRoute _$ShipmentRouteFromJson(Map<String, dynamic> json) {
  return _ShipmentRoute.fromJson(json);
}

/// @nodoc
mixin _$ShipmentRoute {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_no')
  String get routeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_facility_id')
  String get originFacilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_id')
  String get destinationFacilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_code')
  String get lspCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'rider_user_id')
  String get riderUserId => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ShipmentRoute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipmentRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentRouteCopyWith<ShipmentRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentRouteCopyWith<$Res> {
  factory $ShipmentRouteCopyWith(
    ShipmentRoute value,
    $Res Function(ShipmentRoute) then,
  ) = _$ShipmentRouteCopyWithImpl<$Res, ShipmentRoute>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'lsp_code') String lspCode,
    @JsonKey(name: 'rider_user_id') String riderUserId,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class _$ShipmentRouteCopyWithImpl<$Res, $Val extends ShipmentRoute>
    implements $ShipmentRouteCopyWith<$Res> {
  _$ShipmentRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipmentRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? routeNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? lspCode = null,
    Object? riderUserId = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            routeNo: null == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String,
            originFacilityId: null == originFacilityId
                ? _value.originFacilityId
                : originFacilityId // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationFacilityId: null == destinationFacilityId
                ? _value.destinationFacilityId
                : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                      as String,
            lspCode: null == lspCode
                ? _value.lspCode
                : lspCode // ignore: cast_nullable_to_non_nullable
                      as String,
            riderUserId: null == riderUserId
                ? _value.riderUserId
                : riderUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipmentRouteImplCopyWith<$Res>
    implements $ShipmentRouteCopyWith<$Res> {
  factory _$$ShipmentRouteImplCopyWith(
    _$ShipmentRouteImpl value,
    $Res Function(_$ShipmentRouteImpl) then,
  ) = __$$ShipmentRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'lsp_code') String lspCode,
    @JsonKey(name: 'rider_user_id') String riderUserId,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class __$$ShipmentRouteImplCopyWithImpl<$Res>
    extends _$ShipmentRouteCopyWithImpl<$Res, _$ShipmentRouteImpl>
    implements _$$ShipmentRouteImplCopyWith<$Res> {
  __$$ShipmentRouteImplCopyWithImpl(
    _$ShipmentRouteImpl _value,
    $Res Function(_$ShipmentRouteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipmentRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? routeNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? lspCode = null,
    Object? riderUserId = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$ShipmentRouteImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        routeNo: null == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String,
        originFacilityId: null == originFacilityId
            ? _value.originFacilityId
            : originFacilityId // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationFacilityId: null == destinationFacilityId
            ? _value.destinationFacilityId
            : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                  as String,
        lspCode: null == lspCode
            ? _value.lspCode
            : lspCode // ignore: cast_nullable_to_non_nullable
                  as String,
        riderUserId: null == riderUserId
            ? _value.riderUserId
            : riderUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipmentRouteImpl implements _ShipmentRoute {
  const _$ShipmentRouteImpl({
    this.id,
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'origin_facility_id') required this.originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required this.destinationFacilityId,
    @JsonKey(name: 'lsp_code') required this.lspCode,
    @JsonKey(name: 'rider_user_id') required this.riderUserId,
    this.latitude,
    this.longitude,
    @JsonKey(name: 'created_at') this.createdAt,
  });

  factory _$ShipmentRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentRouteImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'route_no')
  final String routeNo;
  @override
  @JsonKey(name: 'origin_facility_id')
  final String originFacilityId;
  @override
  @JsonKey(name: 'destination_facility_id')
  final String destinationFacilityId;
  @override
  @JsonKey(name: 'lsp_code')
  final String lspCode;
  @override
  @JsonKey(name: 'rider_user_id')
  final String riderUserId;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'ShipmentRoute(id: $id, routeNo: $routeNo, originFacilityId: $originFacilityId, destinationFacilityId: $destinationFacilityId, lspCode: $lspCode, riderUserId: $riderUserId, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.originFacilityId, originFacilityId) ||
                other.originFacilityId == originFacilityId) &&
            (identical(other.destinationFacilityId, destinationFacilityId) ||
                other.destinationFacilityId == destinationFacilityId) &&
            (identical(other.lspCode, lspCode) || other.lspCode == lspCode) &&
            (identical(other.riderUserId, riderUserId) ||
                other.riderUserId == riderUserId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    routeNo,
    originFacilityId,
    destinationFacilityId,
    lspCode,
    riderUserId,
    latitude,
    longitude,
    createdAt,
  );

  /// Create a copy of ShipmentRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentRouteImplCopyWith<_$ShipmentRouteImpl> get copyWith =>
      __$$ShipmentRouteImplCopyWithImpl<_$ShipmentRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentRouteImplToJson(this);
  }
}

abstract class _ShipmentRoute implements ShipmentRoute {
  const factory _ShipmentRoute({
    final int? id,
    @JsonKey(name: 'route_no') required final String routeNo,
    @JsonKey(name: 'origin_facility_id') required final String originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required final String destinationFacilityId,
    @JsonKey(name: 'lsp_code') required final String lspCode,
    @JsonKey(name: 'rider_user_id') required final String riderUserId,
    final double? latitude,
    final double? longitude,
    @JsonKey(name: 'created_at') final String? createdAt,
  }) = _$ShipmentRouteImpl;

  factory _ShipmentRoute.fromJson(Map<String, dynamic> json) =
      _$ShipmentRouteImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'route_no')
  String get routeNo;
  @override
  @JsonKey(name: 'origin_facility_id')
  String get originFacilityId;
  @override
  @JsonKey(name: 'destination_facility_id')
  String get destinationFacilityId;
  @override
  @JsonKey(name: 'lsp_code')
  String get lspCode;
  @override
  @JsonKey(name: 'rider_user_id')
  String get riderUserId;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of ShipmentRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentRouteImplCopyWith<_$ShipmentRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
