// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Shipment _$ShipmentFromJson(Map<String, dynamic> json) {
  return _Shipment.fromJson(json);
}

/// @nodoc
mixin _$Shipment {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipment_no')
  String get shipmentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_no')
  String get routeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_id')
  String get originId => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_type')
  String get originType => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_facility_name')
  String get originFacilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_location_type')
  String get destinationLocationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_id')
  String get destinationFacilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_facility_name')
  String get destinationFacilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_latitude')
  double get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_longitude')
  double get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_count')
  int get sampleCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payload_type')
  String get payloadType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_date')
  String? get pickupDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  String? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_status')
  String get syncStatus => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;

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
    int? id,
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_id') String originId,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'origin_facility_name') String originFacilityName,
    @JsonKey(name: 'destination_location_type') String destinationLocationType,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'destination_facility_name') String destinationFacilityName,
    @JsonKey(name: 'pickup_latitude') double pickupLatitude,
    @JsonKey(name: 'pickup_longitude') double pickupLongitude,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'payload_type') String payloadType,
    @JsonKey(name: 'pickup_date') String? pickupDate,
    @JsonKey(name: 'delivery_date') String? deliveryDate,
    @JsonKey(name: 'sync_status') String syncStatus,
    String stage,
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
    Object? id = freezed,
    Object? shipmentNo = null,
    Object? routeNo = null,
    Object? manifestNo = null,
    Object? originId = null,
    Object? originType = null,
    Object? originFacilityName = null,
    Object? destinationLocationType = null,
    Object? destinationFacilityId = null,
    Object? destinationFacilityName = null,
    Object? pickupLatitude = null,
    Object? pickupLongitude = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? payloadType = null,
    Object? pickupDate = freezed,
    Object? deliveryDate = freezed,
    Object? syncStatus = null,
    Object? stage = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            shipmentNo: null == shipmentNo
                ? _value.shipmentNo
                : shipmentNo // ignore: cast_nullable_to_non_nullable
                      as String,
            routeNo: null == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String,
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            originId: null == originId
                ? _value.originId
                : originId // ignore: cast_nullable_to_non_nullable
                      as String,
            originType: null == originType
                ? _value.originType
                : originType // ignore: cast_nullable_to_non_nullable
                      as String,
            originFacilityName: null == originFacilityName
                ? _value.originFacilityName
                : originFacilityName // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationLocationType: null == destinationLocationType
                ? _value.destinationLocationType
                : destinationLocationType // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationFacilityId: null == destinationFacilityId
                ? _value.destinationFacilityId
                : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationFacilityName: null == destinationFacilityName
                ? _value.destinationFacilityName
                : destinationFacilityName // ignore: cast_nullable_to_non_nullable
                      as String,
            pickupLatitude: null == pickupLatitude
                ? _value.pickupLatitude
                : pickupLatitude // ignore: cast_nullable_to_non_nullable
                      as double,
            pickupLongitude: null == pickupLongitude
                ? _value.pickupLongitude
                : pickupLongitude // ignore: cast_nullable_to_non_nullable
                      as double,
            sampleType: null == sampleType
                ? _value.sampleType
                : sampleType // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleCount: null == sampleCount
                ? _value.sampleCount
                : sampleCount // ignore: cast_nullable_to_non_nullable
                      as int,
            payloadType: null == payloadType
                ? _value.payloadType
                : payloadType // ignore: cast_nullable_to_non_nullable
                      as String,
            pickupDate: freezed == pickupDate
                ? _value.pickupDate
                : pickupDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            deliveryDate: freezed == deliveryDate
                ? _value.deliveryDate
                : deliveryDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ShipmentImplCopyWith<$Res>
    implements $ShipmentCopyWith<$Res> {
  factory _$$ShipmentImplCopyWith(
    _$ShipmentImpl value,
    $Res Function(_$ShipmentImpl) then,
  ) = __$$ShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'origin_id') String originId,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'origin_facility_name') String originFacilityName,
    @JsonKey(name: 'destination_location_type') String destinationLocationType,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'destination_facility_name') String destinationFacilityName,
    @JsonKey(name: 'pickup_latitude') double pickupLatitude,
    @JsonKey(name: 'pickup_longitude') double pickupLongitude,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'payload_type') String payloadType,
    @JsonKey(name: 'pickup_date') String? pickupDate,
    @JsonKey(name: 'delivery_date') String? deliveryDate,
    @JsonKey(name: 'sync_status') String syncStatus,
    String stage,
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
    Object? id = freezed,
    Object? shipmentNo = null,
    Object? routeNo = null,
    Object? manifestNo = null,
    Object? originId = null,
    Object? originType = null,
    Object? originFacilityName = null,
    Object? destinationLocationType = null,
    Object? destinationFacilityId = null,
    Object? destinationFacilityName = null,
    Object? pickupLatitude = null,
    Object? pickupLongitude = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? payloadType = null,
    Object? pickupDate = freezed,
    Object? deliveryDate = freezed,
    Object? syncStatus = null,
    Object? stage = null,
  }) {
    return _then(
      _$ShipmentImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        shipmentNo: null == shipmentNo
            ? _value.shipmentNo
            : shipmentNo // ignore: cast_nullable_to_non_nullable
                  as String,
        routeNo: null == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String,
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        originId: null == originId
            ? _value.originId
            : originId // ignore: cast_nullable_to_non_nullable
                  as String,
        originType: null == originType
            ? _value.originType
            : originType // ignore: cast_nullable_to_non_nullable
                  as String,
        originFacilityName: null == originFacilityName
            ? _value.originFacilityName
            : originFacilityName // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationLocationType: null == destinationLocationType
            ? _value.destinationLocationType
            : destinationLocationType // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationFacilityId: null == destinationFacilityId
            ? _value.destinationFacilityId
            : destinationFacilityId // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationFacilityName: null == destinationFacilityName
            ? _value.destinationFacilityName
            : destinationFacilityName // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupLatitude: null == pickupLatitude
            ? _value.pickupLatitude
            : pickupLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        pickupLongitude: null == pickupLongitude
            ? _value.pickupLongitude
            : pickupLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
        sampleType: null == sampleType
            ? _value.sampleType
            : sampleType // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleCount: null == sampleCount
            ? _value.sampleCount
            : sampleCount // ignore: cast_nullable_to_non_nullable
                  as int,
        payloadType: null == payloadType
            ? _value.payloadType
            : payloadType // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupDate: freezed == pickupDate
            ? _value.pickupDate
            : pickupDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        deliveryDate: freezed == deliveryDate
            ? _value.deliveryDate
            : deliveryDate // ignore: cast_nullable_to_non_nullable
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
class _$ShipmentImpl implements _Shipment {
  const _$ShipmentImpl({
    this.id,
    @JsonKey(name: 'shipment_no') required this.shipmentNo,
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    @JsonKey(name: 'origin_id') required this.originId,
    @JsonKey(name: 'origin_type') required this.originType,
    @JsonKey(name: 'origin_facility_name') this.originFacilityName = '',
    @JsonKey(name: 'destination_location_type')
    required this.destinationLocationType,
    @JsonKey(name: 'destination_facility_id')
    required this.destinationFacilityId,
    @JsonKey(name: 'destination_facility_name')
    required this.destinationFacilityName,
    @JsonKey(name: 'pickup_latitude') required this.pickupLatitude,
    @JsonKey(name: 'pickup_longitude') required this.pickupLongitude,
    @JsonKey(name: 'sample_type') required this.sampleType,
    @JsonKey(name: 'sample_count') required this.sampleCount,
    @JsonKey(name: 'payload_type') this.payloadType = 'specimen',
    @JsonKey(name: 'pickup_date') this.pickupDate,
    @JsonKey(name: 'delivery_date') this.deliveryDate,
    @JsonKey(name: 'sync_status') this.syncStatus = 'pending',
    this.stage = 'Pending',
  });

  factory _$ShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'shipment_no')
  final String shipmentNo;
  @override
  @JsonKey(name: 'route_no')
  final String routeNo;
  @override
  @JsonKey(name: 'manifest_no')
  final String manifestNo;
  @override
  @JsonKey(name: 'origin_id')
  final String originId;
  @override
  @JsonKey(name: 'origin_type')
  final String originType;
  @override
  @JsonKey(name: 'origin_facility_name')
  final String originFacilityName;
  @override
  @JsonKey(name: 'destination_location_type')
  final String destinationLocationType;
  @override
  @JsonKey(name: 'destination_facility_id')
  final String destinationFacilityId;
  @override
  @JsonKey(name: 'destination_facility_name')
  final String destinationFacilityName;
  @override
  @JsonKey(name: 'pickup_latitude')
  final double pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  final double pickupLongitude;
  @override
  @JsonKey(name: 'sample_type')
  final String sampleType;
  @override
  @JsonKey(name: 'sample_count')
  final int sampleCount;
  @override
  @JsonKey(name: 'payload_type')
  final String payloadType;
  @override
  @JsonKey(name: 'pickup_date')
  final String? pickupDate;
  @override
  @JsonKey(name: 'delivery_date')
  final String? deliveryDate;
  @override
  @JsonKey(name: 'sync_status')
  final String syncStatus;
  @override
  @JsonKey()
  final String stage;

  @override
  String toString() {
    return 'Shipment(id: $id, shipmentNo: $shipmentNo, routeNo: $routeNo, manifestNo: $manifestNo, originId: $originId, originType: $originType, originFacilityName: $originFacilityName, destinationLocationType: $destinationLocationType, destinationFacilityId: $destinationFacilityId, destinationFacilityName: $destinationFacilityName, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, sampleType: $sampleType, sampleCount: $sampleCount, payloadType: $payloadType, pickupDate: $pickupDate, deliveryDate: $deliveryDate, syncStatus: $syncStatus, stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.originId, originId) ||
                other.originId == originId) &&
            (identical(other.originType, originType) ||
                other.originType == originType) &&
            (identical(other.originFacilityName, originFacilityName) ||
                other.originFacilityName == originFacilityName) &&
            (identical(
                  other.destinationLocationType,
                  destinationLocationType,
                ) ||
                other.destinationLocationType == destinationLocationType) &&
            (identical(other.destinationFacilityId, destinationFacilityId) ||
                other.destinationFacilityId == destinationFacilityId) &&
            (identical(
                  other.destinationFacilityName,
                  destinationFacilityName,
                ) ||
                other.destinationFacilityName == destinationFacilityName) &&
            (identical(other.pickupLatitude, pickupLatitude) ||
                other.pickupLatitude == pickupLatitude) &&
            (identical(other.pickupLongitude, pickupLongitude) ||
                other.pickupLongitude == pickupLongitude) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.sampleCount, sampleCount) ||
                other.sampleCount == sampleCount) &&
            (identical(other.payloadType, payloadType) ||
                other.payloadType == payloadType) &&
            (identical(other.pickupDate, pickupDate) ||
                other.pickupDate == pickupDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    shipmentNo,
    routeNo,
    manifestNo,
    originId,
    originType,
    originFacilityName,
    destinationLocationType,
    destinationFacilityId,
    destinationFacilityName,
    pickupLatitude,
    pickupLongitude,
    sampleType,
    sampleCount,
    payloadType,
    pickupDate,
    deliveryDate,
    syncStatus,
    stage,
  ]);

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
    final int? id,
    @JsonKey(name: 'shipment_no') required final String shipmentNo,
    @JsonKey(name: 'route_no') required final String routeNo,
    @JsonKey(name: 'manifest_no') required final String manifestNo,
    @JsonKey(name: 'origin_id') required final String originId,
    @JsonKey(name: 'origin_type') required final String originType,
    @JsonKey(name: 'origin_facility_name') final String originFacilityName,
    @JsonKey(name: 'destination_location_type')
    required final String destinationLocationType,
    @JsonKey(name: 'destination_facility_id')
    required final String destinationFacilityId,
    @JsonKey(name: 'destination_facility_name')
    required final String destinationFacilityName,
    @JsonKey(name: 'pickup_latitude') required final double pickupLatitude,
    @JsonKey(name: 'pickup_longitude') required final double pickupLongitude,
    @JsonKey(name: 'sample_type') required final String sampleType,
    @JsonKey(name: 'sample_count') required final int sampleCount,
    @JsonKey(name: 'payload_type') final String payloadType,
    @JsonKey(name: 'pickup_date') final String? pickupDate,
    @JsonKey(name: 'delivery_date') final String? deliveryDate,
    @JsonKey(name: 'sync_status') final String syncStatus,
    final String stage,
  }) = _$ShipmentImpl;

  factory _Shipment.fromJson(Map<String, dynamic> json) =
      _$ShipmentImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'shipment_no')
  String get shipmentNo;
  @override
  @JsonKey(name: 'route_no')
  String get routeNo;
  @override
  @JsonKey(name: 'manifest_no')
  String get manifestNo;
  @override
  @JsonKey(name: 'origin_id')
  String get originId;
  @override
  @JsonKey(name: 'origin_type')
  String get originType;
  @override
  @JsonKey(name: 'origin_facility_name')
  String get originFacilityName;
  @override
  @JsonKey(name: 'destination_location_type')
  String get destinationLocationType;
  @override
  @JsonKey(name: 'destination_facility_id')
  String get destinationFacilityId;
  @override
  @JsonKey(name: 'destination_facility_name')
  String get destinationFacilityName;
  @override
  @JsonKey(name: 'pickup_latitude')
  double get pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  double get pickupLongitude;
  @override
  @JsonKey(name: 'sample_type')
  String get sampleType;
  @override
  @JsonKey(name: 'sample_count')
  int get sampleCount;
  @override
  @JsonKey(name: 'payload_type')
  String get payloadType;
  @override
  @JsonKey(name: 'pickup_date')
  String? get pickupDate;
  @override
  @JsonKey(name: 'delivery_date')
  String? get deliveryDate;
  @override
  @JsonKey(name: 'sync_status')
  String get syncStatus;
  @override
  String get stage;

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
