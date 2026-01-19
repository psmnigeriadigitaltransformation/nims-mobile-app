// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_pickup_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResultPickupRequest _$ResultPickupRequestFromJson(Map<String, dynamic> json) {
  return _ResultPickupRequest.fromJson(json);
}

/// @nodoc
mixin _$ResultPickupRequest {
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
  String get temperature => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  ResultPickupShipment get shipment => throw _privateConstructorUsedError;
  List<String> get samples => throw _privateConstructorUsedError;
  ResultPickupApproval get approval => throw _privateConstructorUsedError;

  /// Serializes this ResultPickupRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultPickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickupRequestCopyWith<ResultPickupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickupRequestCopyWith<$Res> {
  factory $ResultPickupRequestCopyWith(
    ResultPickupRequest value,
    $Res Function(ResultPickupRequest) then,
  ) = _$ResultPickupRequestCopyWithImpl<$Res, ResultPickupRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'lsp_code') String lspCode,
    @JsonKey(name: 'rider_user_id') String riderUserId,
    String temperature,
    String latitude,
    String longitude,
    ResultPickupShipment shipment,
    List<String> samples,
    ResultPickupApproval approval,
  });

  $ResultPickupShipmentCopyWith<$Res> get shipment;
  $ResultPickupApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class _$ResultPickupRequestCopyWithImpl<$Res, $Val extends ResultPickupRequest>
    implements $ResultPickupRequestCopyWith<$Res> {
  _$ResultPickupRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? lspCode = null,
    Object? riderUserId = null,
    Object? temperature = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? shipment = null,
    Object? samples = null,
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
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
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
                      as ResultPickupShipment,
            samples: null == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            approval: null == approval
                ? _value.approval
                : approval // ignore: cast_nullable_to_non_nullable
                      as ResultPickupApproval,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultPickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultPickupShipmentCopyWith<$Res> get shipment {
    return $ResultPickupShipmentCopyWith<$Res>(_value.shipment, (value) {
      return _then(_value.copyWith(shipment: value) as $Val);
    });
  }

  /// Create a copy of ResultPickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultPickupApprovalCopyWith<$Res> get approval {
    return $ResultPickupApprovalCopyWith<$Res>(_value.approval, (value) {
      return _then(_value.copyWith(approval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultPickupRequestImplCopyWith<$Res>
    implements $ResultPickupRequestCopyWith<$Res> {
  factory _$$ResultPickupRequestImplCopyWith(
    _$ResultPickupRequestImpl value,
    $Res Function(_$ResultPickupRequestImpl) then,
  ) = __$$ResultPickupRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'origin_facility_id') String originFacilityId,
    @JsonKey(name: 'destination_facility_id') String destinationFacilityId,
    @JsonKey(name: 'lsp_code') String lspCode,
    @JsonKey(name: 'rider_user_id') String riderUserId,
    String temperature,
    String latitude,
    String longitude,
    ResultPickupShipment shipment,
    List<String> samples,
    ResultPickupApproval approval,
  });

  @override
  $ResultPickupShipmentCopyWith<$Res> get shipment;
  @override
  $ResultPickupApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class __$$ResultPickupRequestImplCopyWithImpl<$Res>
    extends _$ResultPickupRequestCopyWithImpl<$Res, _$ResultPickupRequestImpl>
    implements _$$ResultPickupRequestImplCopyWith<$Res> {
  __$$ResultPickupRequestImplCopyWithImpl(
    _$ResultPickupRequestImpl _value,
    $Res Function(_$ResultPickupRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
    Object? originFacilityId = null,
    Object? destinationFacilityId = null,
    Object? lspCode = null,
    Object? riderUserId = null,
    Object? temperature = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? shipment = null,
    Object? samples = null,
    Object? approval = null,
  }) {
    return _then(
      _$ResultPickupRequestImpl(
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
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
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
                  as ResultPickupShipment,
        samples: null == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        approval: null == approval
            ? _value.approval
            : approval // ignore: cast_nullable_to_non_nullable
                  as ResultPickupApproval,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultPickupRequestImpl implements _ResultPickupRequest {
  const _$ResultPickupRequestImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'origin_facility_id') required this.originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required this.destinationFacilityId,
    @JsonKey(name: 'lsp_code') required this.lspCode,
    @JsonKey(name: 'rider_user_id') required this.riderUserId,
    required this.temperature,
    required this.latitude,
    required this.longitude,
    required this.shipment,
    required final List<String> samples,
    required this.approval,
  }) : _samples = samples;

  factory _$ResultPickupRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultPickupRequestImplFromJson(json);

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
  final String temperature;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final ResultPickupShipment shipment;
  final List<String> _samples;
  @override
  List<String> get samples {
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_samples);
  }

  @override
  final ResultPickupApproval approval;

  @override
  String toString() {
    return 'ResultPickupRequest(routeNo: $routeNo, originFacilityId: $originFacilityId, destinationFacilityId: $destinationFacilityId, lspCode: $lspCode, riderUserId: $riderUserId, temperature: $temperature, latitude: $latitude, longitude: $longitude, shipment: $shipment, samples: $samples, approval: $approval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickupRequestImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.originFacilityId, originFacilityId) ||
                other.originFacilityId == originFacilityId) &&
            (identical(other.destinationFacilityId, destinationFacilityId) ||
                other.destinationFacilityId == destinationFacilityId) &&
            (identical(other.lspCode, lspCode) || other.lspCode == lspCode) &&
            (identical(other.riderUserId, riderUserId) ||
                other.riderUserId == riderUserId) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.shipment, shipment) ||
                other.shipment == shipment) &&
            const DeepCollectionEquality().equals(other._samples, _samples) &&
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
    temperature,
    latitude,
    longitude,
    shipment,
    const DeepCollectionEquality().hash(_samples),
    approval,
  );

  /// Create a copy of ResultPickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickupRequestImplCopyWith<_$ResultPickupRequestImpl> get copyWith =>
      __$$ResultPickupRequestImplCopyWithImpl<_$ResultPickupRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultPickupRequestImplToJson(this);
  }
}

abstract class _ResultPickupRequest implements ResultPickupRequest {
  const factory _ResultPickupRequest({
    @JsonKey(name: 'route_no') required final String routeNo,
    @JsonKey(name: 'origin_facility_id') required final String originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required final String destinationFacilityId,
    @JsonKey(name: 'lsp_code') required final String lspCode,
    @JsonKey(name: 'rider_user_id') required final String riderUserId,
    required final String temperature,
    required final String latitude,
    required final String longitude,
    required final ResultPickupShipment shipment,
    required final List<String> samples,
    required final ResultPickupApproval approval,
  }) = _$ResultPickupRequestImpl;

  factory _ResultPickupRequest.fromJson(Map<String, dynamic> json) =
      _$ResultPickupRequestImpl.fromJson;

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
  String get temperature;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  ResultPickupShipment get shipment;
  @override
  List<String> get samples;
  @override
  ResultPickupApproval get approval;

  /// Create a copy of ResultPickupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickupRequestImplCopyWith<_$ResultPickupRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultPickupShipment _$ResultPickupShipmentFromJson(Map<String, dynamic> json) {
  return _ResultPickupShipment.fromJson(json);
}

/// @nodoc
mixin _$ResultPickupShipment {
  @JsonKey(name: 'shipment_no')
  String get shipmentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_type')
  String get originType => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_type')
  String get destinationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_count')
  int get sampleCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_date')
  String get pickupDate => throw _privateConstructorUsedError;

  /// Serializes this ResultPickupShipment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultPickupShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickupShipmentCopyWith<ResultPickupShipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickupShipmentCopyWith<$Res> {
  factory $ResultPickupShipmentCopyWith(
    ResultPickupShipment value,
    $Res Function(ResultPickupShipment) then,
  ) = _$ResultPickupShipmentCopyWithImpl<$Res, ResultPickupShipment>;
  @useResult
  $Res call({
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'destination_type') String destinationType,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'pickup_date') String pickupDate,
  });
}

/// @nodoc
class _$ResultPickupShipmentCopyWithImpl<
  $Res,
  $Val extends ResultPickupShipment
>
    implements $ResultPickupShipmentCopyWith<$Res> {
  _$ResultPickupShipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickupShipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? originType = null,
    Object? destinationType = null,
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
            originType: null == originType
                ? _value.originType
                : originType // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationType: null == destinationType
                ? _value.destinationType
                : destinationType // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ResultPickupShipmentImplCopyWith<$Res>
    implements $ResultPickupShipmentCopyWith<$Res> {
  factory _$$ResultPickupShipmentImplCopyWith(
    _$ResultPickupShipmentImpl value,
    $Res Function(_$ResultPickupShipmentImpl) then,
  ) = __$$ResultPickupShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'destination_type') String destinationType,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'pickup_date') String pickupDate,
  });
}

/// @nodoc
class __$$ResultPickupShipmentImplCopyWithImpl<$Res>
    extends _$ResultPickupShipmentCopyWithImpl<$Res, _$ResultPickupShipmentImpl>
    implements _$$ResultPickupShipmentImplCopyWith<$Res> {
  __$$ResultPickupShipmentImplCopyWithImpl(
    _$ResultPickupShipmentImpl _value,
    $Res Function(_$ResultPickupShipmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickupShipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? originType = null,
    Object? destinationType = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? pickupDate = null,
  }) {
    return _then(
      _$ResultPickupShipmentImpl(
        shipmentNo: null == shipmentNo
            ? _value.shipmentNo
            : shipmentNo // ignore: cast_nullable_to_non_nullable
                  as String,
        originType: null == originType
            ? _value.originType
            : originType // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationType: null == destinationType
            ? _value.destinationType
            : destinationType // ignore: cast_nullable_to_non_nullable
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
class _$ResultPickupShipmentImpl implements _ResultPickupShipment {
  const _$ResultPickupShipmentImpl({
    @JsonKey(name: 'shipment_no') required this.shipmentNo,
    @JsonKey(name: 'origin_type') required this.originType,
    @JsonKey(name: 'destination_type') required this.destinationType,
    @JsonKey(name: 'sample_type') required this.sampleType,
    @JsonKey(name: 'sample_count') required this.sampleCount,
    @JsonKey(name: 'pickup_date') required this.pickupDate,
  });

  factory _$ResultPickupShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultPickupShipmentImplFromJson(json);

  @override
  @JsonKey(name: 'shipment_no')
  final String shipmentNo;
  @override
  @JsonKey(name: 'origin_type')
  final String originType;
  @override
  @JsonKey(name: 'destination_type')
  final String destinationType;
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
    return 'ResultPickupShipment(shipmentNo: $shipmentNo, originType: $originType, destinationType: $destinationType, sampleType: $sampleType, sampleCount: $sampleCount, pickupDate: $pickupDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickupShipmentImpl &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.originType, originType) ||
                other.originType == originType) &&
            (identical(other.destinationType, destinationType) ||
                other.destinationType == destinationType) &&
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
    originType,
    destinationType,
    sampleType,
    sampleCount,
    pickupDate,
  );

  /// Create a copy of ResultPickupShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickupShipmentImplCopyWith<_$ResultPickupShipmentImpl>
  get copyWith =>
      __$$ResultPickupShipmentImplCopyWithImpl<_$ResultPickupShipmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultPickupShipmentImplToJson(this);
  }
}

abstract class _ResultPickupShipment implements ResultPickupShipment {
  const factory _ResultPickupShipment({
    @JsonKey(name: 'shipment_no') required final String shipmentNo,
    @JsonKey(name: 'origin_type') required final String originType,
    @JsonKey(name: 'destination_type') required final String destinationType,
    @JsonKey(name: 'sample_type') required final String sampleType,
    @JsonKey(name: 'sample_count') required final int sampleCount,
    @JsonKey(name: 'pickup_date') required final String pickupDate,
  }) = _$ResultPickupShipmentImpl;

  factory _ResultPickupShipment.fromJson(Map<String, dynamic> json) =
      _$ResultPickupShipmentImpl.fromJson;

  @override
  @JsonKey(name: 'shipment_no')
  String get shipmentNo;
  @override
  @JsonKey(name: 'origin_type')
  String get originType;
  @override
  @JsonKey(name: 'destination_type')
  String get destinationType;
  @override
  @JsonKey(name: 'sample_type')
  String get sampleType;
  @override
  @JsonKey(name: 'sample_count')
  int get sampleCount;
  @override
  @JsonKey(name: 'pickup_date')
  String get pickupDate;

  /// Create a copy of ResultPickupShipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickupShipmentImplCopyWith<_$ResultPickupShipmentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResultPickupApproval _$ResultPickupApprovalFromJson(Map<String, dynamic> json) {
  return _ResultPickupApproval.fromJson(json);
}

/// @nodoc
mixin _$ResultPickupApproval {
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

  /// Serializes this ResultPickupApproval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultPickupApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickupApprovalCopyWith<ResultPickupApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickupApprovalCopyWith<$Res> {
  factory $ResultPickupApprovalCopyWith(
    ResultPickupApproval value,
    $Res Function(ResultPickupApproval) then,
  ) = _$ResultPickupApprovalCopyWithImpl<$Res, ResultPickupApproval>;
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
class _$ResultPickupApprovalCopyWithImpl<
  $Res,
  $Val extends ResultPickupApproval
>
    implements $ResultPickupApprovalCopyWith<$Res> {
  _$ResultPickupApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickupApproval
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
abstract class _$$ResultPickupApprovalImplCopyWith<$Res>
    implements $ResultPickupApprovalCopyWith<$Res> {
  factory _$$ResultPickupApprovalImplCopyWith(
    _$ResultPickupApprovalImpl value,
    $Res Function(_$ResultPickupApprovalImpl) then,
  ) = __$$ResultPickupApprovalImplCopyWithImpl<$Res>;
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
class __$$ResultPickupApprovalImplCopyWithImpl<$Res>
    extends _$ResultPickupApprovalCopyWithImpl<$Res, _$ResultPickupApprovalImpl>
    implements _$$ResultPickupApprovalImplCopyWith<$Res> {
  __$$ResultPickupApprovalImplCopyWithImpl(
    _$ResultPickupApprovalImpl _value,
    $Res Function(_$ResultPickupApprovalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickupApproval
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
      _$ResultPickupApprovalImpl(
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
class _$ResultPickupApprovalImpl implements _ResultPickupApproval {
  const _$ResultPickupApprovalImpl({
    @JsonKey(name: 'approval_no') required this.approvalNo,
    @JsonKey(name: 'approval_type') required this.approvalType,
    required this.fullname,
    required this.phone,
    required this.designation,
    required this.signature,
    @JsonKey(name: 'approval_date') required this.approvalDate,
  });

  factory _$ResultPickupApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultPickupApprovalImplFromJson(json);

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
    return 'ResultPickupApproval(approvalNo: $approvalNo, approvalType: $approvalType, fullname: $fullname, phone: $phone, designation: $designation, signature: $signature, approvalDate: $approvalDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickupApprovalImpl &&
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

  /// Create a copy of ResultPickupApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickupApprovalImplCopyWith<_$ResultPickupApprovalImpl>
  get copyWith =>
      __$$ResultPickupApprovalImplCopyWithImpl<_$ResultPickupApprovalImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultPickupApprovalImplToJson(this);
  }
}

abstract class _ResultPickupApproval implements ResultPickupApproval {
  const factory _ResultPickupApproval({
    @JsonKey(name: 'approval_no') required final String approvalNo,
    @JsonKey(name: 'approval_type') required final String approvalType,
    required final String fullname,
    required final String phone,
    required final String designation,
    required final String signature,
    @JsonKey(name: 'approval_date') required final String approvalDate,
  }) = _$ResultPickupApprovalImpl;

  factory _ResultPickupApproval.fromJson(Map<String, dynamic> json) =
      _$ResultPickupApprovalImpl.fromJson;

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

  /// Create a copy of ResultPickupApproval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickupApprovalImplCopyWith<_$ResultPickupApprovalImpl>
  get copyWith => throw _privateConstructorUsedError;
}
