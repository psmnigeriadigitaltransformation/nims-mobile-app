// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_shipment_route_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateShipmentRouteRequest _$CreateShipmentRouteRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateShipmentRouteRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateShipmentRouteRequest {
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
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  List<Shipment> get shipment => throw _privateConstructorUsedError;
  Approval get approval => throw _privateConstructorUsedError;

  /// Serializes this CreateShipmentRouteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateShipmentRouteRequestCopyWith<CreateShipmentRouteRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShipmentRouteRequestCopyWith<$Res> {
  factory $CreateShipmentRouteRequestCopyWith(
    CreateShipmentRouteRequest value,
    $Res Function(CreateShipmentRouteRequest) then,
  ) =
      _$CreateShipmentRouteRequestCopyWithImpl<
        $Res,
        CreateShipmentRouteRequest
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'lsp_code') String lspCode,
    @JsonKey(name: 'rider_user_id') String riderUserId,
    String latitude,
    String longitude,
    List<Shipment> shipment,
    Approval approval,
  });

  $ApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class _$CreateShipmentRouteRequestCopyWithImpl<
  $Res,
  $Val extends CreateShipmentRouteRequest
>
    implements $CreateShipmentRouteRequestCopyWith<$Res> {
  _$CreateShipmentRouteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? lspCode = null,
    Object? riderUserId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? shipment = null,
    Object? approval = null,
  }) {
    return _then(
      _value.copyWith(
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
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as String,
            shipment: null == shipment
                ? _value.shipment
                : shipment // ignore: cast_nullable_to_non_nullable
                      as List<Shipment>,
            approval: null == approval
                ? _value.approval
                : approval // ignore: cast_nullable_to_non_nullable
                      as Approval,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApprovalCopyWith<$Res> get approval {
    return $ApprovalCopyWith<$Res>(_value.approval, (value) {
      return _then(_value.copyWith(approval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateShipmentRouteRequestImplCopyWith<$Res>
    implements $CreateShipmentRouteRequestCopyWith<$Res> {
  factory _$$CreateShipmentRouteRequestImplCopyWith(
    _$CreateShipmentRouteRequestImpl value,
    $Res Function(_$CreateShipmentRouteRequestImpl) then,
  ) = __$$CreateShipmentRouteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'lsp_code') String lspCode,
    @JsonKey(name: 'rider_user_id') String riderUserId,
    String latitude,
    String longitude,
    List<Shipment> shipment,
    Approval approval,
  });

  @override
  $ApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class __$$CreateShipmentRouteRequestImplCopyWithImpl<$Res>
    extends
        _$CreateShipmentRouteRequestCopyWithImpl<
          $Res,
          _$CreateShipmentRouteRequestImpl
        >
    implements _$$CreateShipmentRouteRequestImplCopyWith<$Res> {
  __$$CreateShipmentRouteRequestImplCopyWithImpl(
    _$CreateShipmentRouteRequestImpl _value,
    $Res Function(_$CreateShipmentRouteRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? lspCode = null,
    Object? riderUserId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? shipment = null,
    Object? approval = null,
  }) {
    return _then(
      _$CreateShipmentRouteRequestImpl(
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
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as String,
        shipment: null == shipment
            ? _value._shipment
            : shipment // ignore: cast_nullable_to_non_nullable
                  as List<Shipment>,
        approval: null == approval
            ? _value.approval
            : approval // ignore: cast_nullable_to_non_nullable
                  as Approval,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateShipmentRouteRequestImpl implements _CreateShipmentRouteRequest {
  const _$CreateShipmentRouteRequestImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'origin_facility_id') required this.originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required this.destinationFacilityId,
    @JsonKey(name: 'lsp_code') required this.lspCode,
    @JsonKey(name: 'rider_user_id') required this.riderUserId,
    required this.latitude,
    required this.longitude,
    required final List<Shipment> shipment,
    required this.approval,
  }) : _shipment = shipment;

  factory _$CreateShipmentRouteRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateShipmentRouteRequestImplFromJson(json);

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
  final String latitude;
  @override
  final String longitude;
  final List<Shipment> _shipment;
  @override
  List<Shipment> get shipment {
    if (_shipment is EqualUnmodifiableListView) return _shipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipment);
  }

  @override
  final Approval approval;

  @override
  String toString() {
    return 'CreateShipmentRouteRequest(routeNo: $routeNo, originFacilityId: $originFacilityId, destinationFacilityId: $destinationFacilityId, lspCode: $lspCode, riderUserId: $riderUserId, latitude: $latitude, longitude: $longitude, shipment: $shipment, approval: $approval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShipmentRouteRequestImpl &&
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
            const DeepCollectionEquality().equals(other._shipment, _shipment) &&
            (identical(other.approval, approval) ||
                other.approval == approval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    routeNo,
    originFacilityId,
    destinationFacilityId,
    lspCode,
    riderUserId,
    latitude,
    longitude,
    const DeepCollectionEquality().hash(_shipment),
    approval,
  );

  /// Create a copy of CreateShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShipmentRouteRequestImplCopyWith<_$CreateShipmentRouteRequestImpl>
  get copyWith =>
      __$$CreateShipmentRouteRequestImplCopyWithImpl<
        _$CreateShipmentRouteRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateShipmentRouteRequestImplToJson(this);
  }
}

abstract class _CreateShipmentRouteRequest
    implements CreateShipmentRouteRequest {
  const factory _CreateShipmentRouteRequest({
    @JsonKey(name: 'route_no') required final String routeNo,
    @JsonKey(name: 'origin_facility_id') required final String originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required final String destinationFacilityId,
    @JsonKey(name: 'lsp_code') required final String lspCode,
    @JsonKey(name: 'rider_user_id') required final String riderUserId,
    required final String latitude,
    required final String longitude,
    required final List<Shipment> shipment,
    required final Approval approval,
  }) = _$CreateShipmentRouteRequestImpl;

  factory _CreateShipmentRouteRequest.fromJson(Map<String, dynamic> json) =
      _$CreateShipmentRouteRequestImpl.fromJson;

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
  String get latitude;
  @override
  String get longitude;
  @override
  List<Shipment> get shipment;
  @override
  Approval get approval;

  /// Create a copy of CreateShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateShipmentRouteRequestImplCopyWith<_$CreateShipmentRouteRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Shipment _$ShipmentFromJson(Map<String, dynamic> json) {
  return _Shipment.fromJson(json);
}

/// @nodoc
mixin _$Shipment {
  @JsonKey(name: 'shipment_no')
  String get shipmentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_type')
  String get originType => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_type')
  String get destinationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_latitude')
  String get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_longitude')
  String get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_count')
  int get sampleCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_date')
  String get pickupDate => throw _privateConstructorUsedError;

  /// Serializes this Shipment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentCopyWith<Shipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentCopyWith<$Res> {
  factory $ShipmentCopyWith(Shipment value, $Res Function(Shipment) then) =
      _$ShipmentCopyWithImpl<$Res, Shipment>;
  @useResult
  $Res call({
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'destination_type') String destinationType,
    @JsonKey(name: 'pickup_latitude') String pickupLatitude,
    @JsonKey(name: 'pickup_longitude') String pickupLongitude,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'pickup_date') String pickupDate,
  });
}

/// @nodoc
class _$ShipmentCopyWithImpl<$Res, $Val extends Shipment>
    implements $ShipmentCopyWith<$Res> {
  _$ShipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? manifestNo = null,
    Object? originType = null,
    Object? destinationType = null,
    Object? pickupLatitude = null,
    Object? pickupLongitude = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? pickupDate = null,
  }) {
    return _then(
      _value.copyWith(
            shipmentNo: null == shipmentNo
                ? _value.shipmentNo
                : shipmentNo // ignore: cast_nullable_to_non_nullable
                      as String,
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            originType: null == originType
                ? _value.originType
                : originType // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationType: null == destinationType
                ? _value.destinationType
                : destinationType // ignore: cast_nullable_to_non_nullable
                      as String,
            pickupLatitude: null == pickupLatitude
                ? _value.pickupLatitude
                : pickupLatitude // ignore: cast_nullable_to_non_nullable
                      as String,
            pickupLongitude: null == pickupLongitude
                ? _value.pickupLongitude
                : pickupLongitude // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleType: null == sampleType
                ? _value.sampleType
                : sampleType // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleCount: null == sampleCount
                ? _value.sampleCount
                : sampleCount // ignore: cast_nullable_to_non_nullable
                      as int,
            pickupDate: null == pickupDate
                ? _value.pickupDate
                : pickupDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipmentImplCopyWith<$Res>
    implements $ShipmentCopyWith<$Res> {
  factory _$$ShipmentImplCopyWith(
    _$ShipmentImpl value,
    $Res Function(_$ShipmentImpl) then,
  ) = __$$ShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'destination_type') String destinationType,
    @JsonKey(name: 'pickup_latitude') String pickupLatitude,
    @JsonKey(name: 'pickup_longitude') String pickupLongitude,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'pickup_date') String pickupDate,
  });
}

/// @nodoc
class __$$ShipmentImplCopyWithImpl<$Res>
    extends _$ShipmentCopyWithImpl<$Res, _$ShipmentImpl>
    implements _$$ShipmentImplCopyWith<$Res> {
  __$$ShipmentImplCopyWithImpl(
    _$ShipmentImpl _value,
    $Res Function(_$ShipmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? manifestNo = null,
    Object? originType = null,
    Object? destinationType = null,
    Object? pickupLatitude = null,
    Object? pickupLongitude = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? pickupDate = null,
  }) {
    return _then(
      _$ShipmentImpl(
        shipmentNo: null == shipmentNo
            ? _value.shipmentNo
            : shipmentNo // ignore: cast_nullable_to_non_nullable
                  as String,
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        originType: null == originType
            ? _value.originType
            : originType // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationType: null == destinationType
            ? _value.destinationType
            : destinationType // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupLatitude: null == pickupLatitude
            ? _value.pickupLatitude
            : pickupLatitude // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupLongitude: null == pickupLongitude
            ? _value.pickupLongitude
            : pickupLongitude // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleType: null == sampleType
            ? _value.sampleType
            : sampleType // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleCount: null == sampleCount
            ? _value.sampleCount
            : sampleCount // ignore: cast_nullable_to_non_nullable
                  as int,
        pickupDate: null == pickupDate
            ? _value.pickupDate
            : pickupDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipmentImpl implements _Shipment {
  const _$ShipmentImpl({
    @JsonKey(name: 'shipment_no') required this.shipmentNo,
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    @JsonKey(name: 'origin_type') required this.originType,
    @JsonKey(name: 'destination_type') required this.destinationType,
    @JsonKey(name: 'pickup_latitude') required this.pickupLatitude,
    @JsonKey(name: 'pickup_longitude') required this.pickupLongitude,
    @JsonKey(name: 'sample_type') required this.sampleType,
    @JsonKey(name: 'sample_count') required this.sampleCount,
    @JsonKey(name: 'pickup_date') required this.pickupDate,
  });

  factory _$ShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentImplFromJson(json);

  @override
  @JsonKey(name: 'shipment_no')
  final String shipmentNo;
  @override
  @JsonKey(name: 'manifest_no')
  final String manifestNo;
  @override
  @JsonKey(name: 'origin_type')
  final String originType;
  @override
  @JsonKey(name: 'destination_type')
  final String destinationType;
  @override
  @JsonKey(name: 'pickup_latitude')
  final String pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  final String pickupLongitude;
  @override
  @JsonKey(name: 'sample_type')
  final String sampleType;
  @override
  @JsonKey(name: 'sample_count')
  final int sampleCount;
  @override
  @JsonKey(name: 'pickup_date')
  final String pickupDate;

  @override
  String toString() {
    return 'Shipment(shipmentNo: $shipmentNo, manifestNo: $manifestNo, originType: $originType, destinationType: $destinationType, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, sampleType: $sampleType, sampleCount: $sampleCount, pickupDate: $pickupDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentImpl &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.originType, originType) ||
                other.originType == originType) &&
            (identical(other.destinationType, destinationType) ||
                other.destinationType == destinationType) &&
            (identical(other.pickupLatitude, pickupLatitude) ||
                other.pickupLatitude == pickupLatitude) &&
            (identical(other.pickupLongitude, pickupLongitude) ||
                other.pickupLongitude == pickupLongitude) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.sampleCount, sampleCount) ||
                other.sampleCount == sampleCount) &&
            (identical(other.pickupDate, pickupDate) ||
                other.pickupDate == pickupDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    shipmentNo,
    manifestNo,
    originType,
    destinationType,
    pickupLatitude,
    pickupLongitude,
    sampleType,
    sampleCount,
    pickupDate,
  );

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      __$$ShipmentImplCopyWithImpl<_$ShipmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentImplToJson(this);
  }
}

abstract class _Shipment implements Shipment {
  const factory _Shipment({
    @JsonKey(name: 'shipment_no') required final String shipmentNo,
    @JsonKey(name: 'manifest_no') required final String manifestNo,
    @JsonKey(name: 'origin_type') required final String originType,
    @JsonKey(name: 'destination_type') required final String destinationType,
    @JsonKey(name: 'pickup_latitude') required final String pickupLatitude,
    @JsonKey(name: 'pickup_longitude') required final String pickupLongitude,
    @JsonKey(name: 'sample_type') required final String sampleType,
    @JsonKey(name: 'sample_count') required final int sampleCount,
    @JsonKey(name: 'pickup_date') required final String pickupDate,
  }) = _$ShipmentImpl;

  factory _Shipment.fromJson(Map<String, dynamic> json) =
      _$ShipmentImpl.fromJson;

  @override
  @JsonKey(name: 'shipment_no')
  String get shipmentNo;
  @override
  @JsonKey(name: 'manifest_no')
  String get manifestNo;
  @override
  @JsonKey(name: 'origin_type')
  String get originType;
  @override
  @JsonKey(name: 'destination_type')
  String get destinationType;
  @override
  @JsonKey(name: 'pickup_latitude')
  String get pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  String get pickupLongitude;
  @override
  @JsonKey(name: 'sample_type')
  String get sampleType;
  @override
  @JsonKey(name: 'sample_count')
  int get sampleCount;
  @override
  @JsonKey(name: 'pickup_date')
  String get pickupDate;

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Approval _$ApprovalFromJson(Map<String, dynamic> json) {
  return _Approval.fromJson(json);
}

/// @nodoc
mixin _$Approval {
  @JsonKey(name: 'approval_no')
  String get approvalNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_type')
  String get approvalType => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_date')
  String get approvalDate => throw _privateConstructorUsedError;

  /// Serializes this Approval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApprovalCopyWith<Approval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovalCopyWith<$Res> {
  factory $ApprovalCopyWith(Approval value, $Res Function(Approval) then) =
      _$ApprovalCopyWithImpl<$Res, Approval>;
  @useResult
  $Res call({
    @JsonKey(name: 'approval_no') String approvalNo,
    @JsonKey(name: 'approval_type') String approvalType,
    String fullname,
    String phone,
    String designation,
    String signature,
    @JsonKey(name: 'approval_date') String approvalDate,
  });
}

/// @nodoc
class _$ApprovalCopyWithImpl<$Res, $Val extends Approval>
    implements $ApprovalCopyWith<$Res> {
  _$ApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvalNo = null,
    Object? approvalType = null,
    Object? fullname = null,
    Object? phone = null,
    Object? designation = null,
    Object? signature = null,
    Object? approvalDate = null,
  }) {
    return _then(
      _value.copyWith(
            approvalNo: null == approvalNo
                ? _value.approvalNo
                : approvalNo // ignore: cast_nullable_to_non_nullable
                      as String,
            approvalType: null == approvalType
                ? _value.approvalType
                : approvalType // ignore: cast_nullable_to_non_nullable
                      as String,
            fullname: null == fullname
                ? _value.fullname
                : fullname // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            designation: null == designation
                ? _value.designation
                : designation // ignore: cast_nullable_to_non_nullable
                      as String,
            signature: null == signature
                ? _value.signature
                : signature // ignore: cast_nullable_to_non_nullable
                      as String,
            approvalDate: null == approvalDate
                ? _value.approvalDate
                : approvalDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApprovalImplCopyWith<$Res>
    implements $ApprovalCopyWith<$Res> {
  factory _$$ApprovalImplCopyWith(
    _$ApprovalImpl value,
    $Res Function(_$ApprovalImpl) then,
  ) = __$$ApprovalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'approval_no') String approvalNo,
    @JsonKey(name: 'approval_type') String approvalType,
    String fullname,
    String phone,
    String designation,
    String signature,
    @JsonKey(name: 'approval_date') String approvalDate,
  });
}

/// @nodoc
class __$$ApprovalImplCopyWithImpl<$Res>
    extends _$ApprovalCopyWithImpl<$Res, _$ApprovalImpl>
    implements _$$ApprovalImplCopyWith<$Res> {
  __$$ApprovalImplCopyWithImpl(
    _$ApprovalImpl _value,
    $Res Function(_$ApprovalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvalNo = null,
    Object? approvalType = null,
    Object? fullname = null,
    Object? phone = null,
    Object? designation = null,
    Object? signature = null,
    Object? approvalDate = null,
  }) {
    return _then(
      _$ApprovalImpl(
        approvalNo: null == approvalNo
            ? _value.approvalNo
            : approvalNo // ignore: cast_nullable_to_non_nullable
                  as String,
        approvalType: null == approvalType
            ? _value.approvalType
            : approvalType // ignore: cast_nullable_to_non_nullable
                  as String,
        fullname: null == fullname
            ? _value.fullname
            : fullname // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        designation: null == designation
            ? _value.designation
            : designation // ignore: cast_nullable_to_non_nullable
                  as String,
        signature: null == signature
            ? _value.signature
            : signature // ignore: cast_nullable_to_non_nullable
                  as String,
        approvalDate: null == approvalDate
            ? _value.approvalDate
            : approvalDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovalImpl implements _Approval {
  const _$ApprovalImpl({
    @JsonKey(name: 'approval_no') required this.approvalNo,
    @JsonKey(name: 'approval_type') required this.approvalType,
    required this.fullname,
    required this.phone,
    required this.designation,
    required this.signature,
    @JsonKey(name: 'approval_date') required this.approvalDate,
  });

  factory _$ApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovalImplFromJson(json);

  @override
  @JsonKey(name: 'approval_no')
  final String approvalNo;
  @override
  @JsonKey(name: 'approval_type')
  final String approvalType;
  @override
  final String fullname;
  @override
  final String phone;
  @override
  final String designation;
  @override
  final String signature;
  @override
  @JsonKey(name: 'approval_date')
  final String approvalDate;

  @override
  String toString() {
    return 'Approval(approvalNo: $approvalNo, approvalType: $approvalType, fullname: $fullname, phone: $phone, designation: $designation, signature: $signature, approvalDate: $approvalDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovalImpl &&
            (identical(other.approvalNo, approvalNo) ||
                other.approvalNo == approvalNo) &&
            (identical(other.approvalType, approvalType) ||
                other.approvalType == approvalType) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.approvalDate, approvalDate) ||
                other.approvalDate == approvalDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    approvalNo,
    approvalType,
    fullname,
    phone,
    designation,
    signature,
    approvalDate,
  );

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovalImplCopyWith<_$ApprovalImpl> get copyWith =>
      __$$ApprovalImplCopyWithImpl<_$ApprovalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovalImplToJson(this);
  }
}

abstract class _Approval implements Approval {
  const factory _Approval({
    @JsonKey(name: 'approval_no') required final String approvalNo,
    @JsonKey(name: 'approval_type') required final String approvalType,
    required final String fullname,
    required final String phone,
    required final String designation,
    required final String signature,
    @JsonKey(name: 'approval_date') required final String approvalDate,
  }) = _$ApprovalImpl;

  factory _Approval.fromJson(Map<String, dynamic> json) =
      _$ApprovalImpl.fromJson;

  @override
  @JsonKey(name: 'approval_no')
  String get approvalNo;
  @override
  @JsonKey(name: 'approval_type')
  String get approvalType;
  @override
  String get fullname;
  @override
  String get phone;
  @override
  String get designation;
  @override
  String get signature;
  @override
  @JsonKey(name: 'approval_date')
  String get approvalDate;

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApprovalImplCopyWith<_$ApprovalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
