// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_result_shipment_route_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateResultShipmentRouteRequest _$CreateResultShipmentRouteRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateResultShipmentRouteRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateResultShipmentRouteRequest {
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
  @JsonKey(name: 'shipment')
  ResultShipment get shipment => throw _privateConstructorUsedError;
  List<String> get samples => throw _privateConstructorUsedError;
  ResultShipmentApproval get approval => throw _privateConstructorUsedError;

  /// Serializes this CreateResultShipmentRouteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateResultShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateResultShipmentRouteRequestCopyWith<CreateResultShipmentRouteRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateResultShipmentRouteRequestCopyWith<$Res> {
  factory $CreateResultShipmentRouteRequestCopyWith(
    CreateResultShipmentRouteRequest value,
    $Res Function(CreateResultShipmentRouteRequest) then,
  ) =
      _$CreateResultShipmentRouteRequestCopyWithImpl<
        $Res,
        CreateResultShipmentRouteRequest
      >;
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
    @JsonKey(name: 'shipment') ResultShipment shipment,
    List<String> samples,
    ResultShipmentApproval approval,
  });

  $ResultShipmentCopyWith<$Res> get shipment;
  $ResultShipmentApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class _$CreateResultShipmentRouteRequestCopyWithImpl<
  $Res,
  $Val extends CreateResultShipmentRouteRequest
>
    implements $CreateResultShipmentRouteRequestCopyWith<$Res> {
  _$CreateResultShipmentRouteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateResultShipmentRouteRequest
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
                      as ResultShipment,
            samples: null == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            approval: null == approval
                ? _value.approval
                : approval // ignore: cast_nullable_to_non_nullable
                      as ResultShipmentApproval,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateResultShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultShipmentCopyWith<$Res> get shipment {
    return $ResultShipmentCopyWith<$Res>(_value.shipment, (value) {
      return _then(_value.copyWith(shipment: value) as $Val);
    });
  }

  /// Create a copy of CreateResultShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultShipmentApprovalCopyWith<$Res> get approval {
    return $ResultShipmentApprovalCopyWith<$Res>(_value.approval, (value) {
      return _then(_value.copyWith(approval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateResultShipmentRouteRequestImplCopyWith<$Res>
    implements $CreateResultShipmentRouteRequestCopyWith<$Res> {
  factory _$$CreateResultShipmentRouteRequestImplCopyWith(
    _$CreateResultShipmentRouteRequestImpl value,
    $Res Function(_$CreateResultShipmentRouteRequestImpl) then,
  ) = __$$CreateResultShipmentRouteRequestImplCopyWithImpl<$Res>;
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
    @JsonKey(name: 'shipment') ResultShipment shipment,
    List<String> samples,
    ResultShipmentApproval approval,
  });

  @override
  $ResultShipmentCopyWith<$Res> get shipment;
  @override
  $ResultShipmentApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class __$$CreateResultShipmentRouteRequestImplCopyWithImpl<$Res>
    extends
        _$CreateResultShipmentRouteRequestCopyWithImpl<
          $Res,
          _$CreateResultShipmentRouteRequestImpl
        >
    implements _$$CreateResultShipmentRouteRequestImplCopyWith<$Res> {
  __$$CreateResultShipmentRouteRequestImplCopyWithImpl(
    _$CreateResultShipmentRouteRequestImpl _value,
    $Res Function(_$CreateResultShipmentRouteRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateResultShipmentRouteRequest
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
      _$CreateResultShipmentRouteRequestImpl(
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
                  as ResultShipment,
        samples: null == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        approval: null == approval
            ? _value.approval
            : approval // ignore: cast_nullable_to_non_nullable
                  as ResultShipmentApproval,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateResultShipmentRouteRequestImpl
    implements _CreateResultShipmentRouteRequest {
  const _$CreateResultShipmentRouteRequestImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'origin_facility_id') required this.originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required this.destinationFacilityId,
    @JsonKey(name: 'lsp_code') required this.lspCode,
    @JsonKey(name: 'rider_user_id') required this.riderUserId,
    required this.temperature,
    required this.latitude,
    required this.longitude,
    @JsonKey(name: 'shipment') required this.shipment,
    required final List<String> samples,
    required this.approval,
  }) : _samples = samples;

  factory _$CreateResultShipmentRouteRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateResultShipmentRouteRequestImplFromJson(json);

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
  @JsonKey(name: 'shipment')
  final ResultShipment shipment;
  final List<String> _samples;
  @override
  List<String> get samples {
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_samples);
  }

  @override
  final ResultShipmentApproval approval;

  @override
  String toString() {
    return 'CreateResultShipmentRouteRequest(routeNo: $routeNo, originFacilityId: $originFacilityId, destinationFacilityId: $destinationFacilityId, lspCode: $lspCode, riderUserId: $riderUserId, temperature: $temperature, latitude: $latitude, longitude: $longitude, shipment: $shipment, samples: $samples, approval: $approval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateResultShipmentRouteRequestImpl &&
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

  /// Create a copy of CreateResultShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateResultShipmentRouteRequestImplCopyWith<
    _$CreateResultShipmentRouteRequestImpl
  >
  get copyWith =>
      __$$CreateResultShipmentRouteRequestImplCopyWithImpl<
        _$CreateResultShipmentRouteRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateResultShipmentRouteRequestImplToJson(this);
  }
}

abstract class _CreateResultShipmentRouteRequest
    implements CreateResultShipmentRouteRequest {
  const factory _CreateResultShipmentRouteRequest({
    @JsonKey(name: 'route_no') required final String routeNo,
    @JsonKey(name: 'origin_facility_id') required final String originFacilityId,
    @JsonKey(name: 'destination_facility_id')
    required final String destinationFacilityId,
    @JsonKey(name: 'lsp_code') required final String lspCode,
    @JsonKey(name: 'rider_user_id') required final String riderUserId,
    required final String temperature,
    required final String latitude,
    required final String longitude,
    @JsonKey(name: 'shipment') required final ResultShipment shipment,
    required final List<String> samples,
    required final ResultShipmentApproval approval,
  }) = _$CreateResultShipmentRouteRequestImpl;

  factory _CreateResultShipmentRouteRequest.fromJson(
    Map<String, dynamic> json,
  ) = _$CreateResultShipmentRouteRequestImpl.fromJson;

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
  @JsonKey(name: 'shipment')
  ResultShipment get shipment;
  @override
  List<String> get samples;
  @override
  ResultShipmentApproval get approval;

  /// Create a copy of CreateResultShipmentRouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateResultShipmentRouteRequestImplCopyWith<
    _$CreateResultShipmentRouteRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

ResultShipment _$ResultShipmentFromJson(Map<String, dynamic> json) {
  return _ResultShipment.fromJson(json);
}

/// @nodoc
mixin _$ResultShipment {
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

  /// Serializes this ResultShipment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultShipmentCopyWith<ResultShipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultShipmentCopyWith<$Res> {
  factory $ResultShipmentCopyWith(
    ResultShipment value,
    $Res Function(ResultShipment) then,
  ) = _$ResultShipmentCopyWithImpl<$Res, ResultShipment>;
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
class _$ResultShipmentCopyWithImpl<$Res, $Val extends ResultShipment>
    implements $ResultShipmentCopyWith<$Res> {
  _$ResultShipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultShipment
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
abstract class _$$ResultShipmentImplCopyWith<$Res>
    implements $ResultShipmentCopyWith<$Res> {
  factory _$$ResultShipmentImplCopyWith(
    _$ResultShipmentImpl value,
    $Res Function(_$ResultShipmentImpl) then,
  ) = __$$ResultShipmentImplCopyWithImpl<$Res>;
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
class __$$ResultShipmentImplCopyWithImpl<$Res>
    extends _$ResultShipmentCopyWithImpl<$Res, _$ResultShipmentImpl>
    implements _$$ResultShipmentImplCopyWith<$Res> {
  __$$ResultShipmentImplCopyWithImpl(
    _$ResultShipmentImpl _value,
    $Res Function(_$ResultShipmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultShipment
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
      _$ResultShipmentImpl(
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
class _$ResultShipmentImpl implements _ResultShipment {
  const _$ResultShipmentImpl({
    @JsonKey(name: 'shipment_no') required this.shipmentNo,
    @JsonKey(name: 'origin_type') required this.originType,
    @JsonKey(name: 'destination_type') required this.destinationType,
    @JsonKey(name: 'sample_type') required this.sampleType,
    @JsonKey(name: 'sample_count') required this.sampleCount,
    @JsonKey(name: 'pickup_date') required this.pickupDate,
  });

  factory _$ResultShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultShipmentImplFromJson(json);

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
    return 'ResultShipment(shipmentNo: $shipmentNo, originType: $originType, destinationType: $destinationType, sampleType: $sampleType, sampleCount: $sampleCount, pickupDate: $pickupDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultShipmentImpl &&
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

  /// Create a copy of ResultShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultShipmentImplCopyWith<_$ResultShipmentImpl> get copyWith =>
      __$$ResultShipmentImplCopyWithImpl<_$ResultShipmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultShipmentImplToJson(this);
  }
}

abstract class _ResultShipment implements ResultShipment {
  const factory _ResultShipment({
    @JsonKey(name: 'shipment_no') required final String shipmentNo,
    @JsonKey(name: 'origin_type') required final String originType,
    @JsonKey(name: 'destination_type') required final String destinationType,
    @JsonKey(name: 'sample_type') required final String sampleType,
    @JsonKey(name: 'sample_count') required final int sampleCount,
    @JsonKey(name: 'pickup_date') required final String pickupDate,
  }) = _$ResultShipmentImpl;

  factory _ResultShipment.fromJson(Map<String, dynamic> json) =
      _$ResultShipmentImpl.fromJson;

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

  /// Create a copy of ResultShipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultShipmentImplCopyWith<_$ResultShipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultShipmentApproval _$ResultShipmentApprovalFromJson(
  Map<String, dynamic> json,
) {
  return _ResultShipmentApproval.fromJson(json);
}

/// @nodoc
mixin _$ResultShipmentApproval {
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

  /// Serializes this ResultShipmentApproval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultShipmentApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultShipmentApprovalCopyWith<ResultShipmentApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultShipmentApprovalCopyWith<$Res> {
  factory $ResultShipmentApprovalCopyWith(
    ResultShipmentApproval value,
    $Res Function(ResultShipmentApproval) then,
  ) = _$ResultShipmentApprovalCopyWithImpl<$Res, ResultShipmentApproval>;
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
class _$ResultShipmentApprovalCopyWithImpl<
  $Res,
  $Val extends ResultShipmentApproval
>
    implements $ResultShipmentApprovalCopyWith<$Res> {
  _$ResultShipmentApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultShipmentApproval
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
abstract class _$$ResultShipmentApprovalImplCopyWith<$Res>
    implements $ResultShipmentApprovalCopyWith<$Res> {
  factory _$$ResultShipmentApprovalImplCopyWith(
    _$ResultShipmentApprovalImpl value,
    $Res Function(_$ResultShipmentApprovalImpl) then,
  ) = __$$ResultShipmentApprovalImplCopyWithImpl<$Res>;
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
class __$$ResultShipmentApprovalImplCopyWithImpl<$Res>
    extends
        _$ResultShipmentApprovalCopyWithImpl<$Res, _$ResultShipmentApprovalImpl>
    implements _$$ResultShipmentApprovalImplCopyWith<$Res> {
  __$$ResultShipmentApprovalImplCopyWithImpl(
    _$ResultShipmentApprovalImpl _value,
    $Res Function(_$ResultShipmentApprovalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultShipmentApproval
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
      _$ResultShipmentApprovalImpl(
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
class _$ResultShipmentApprovalImpl implements _ResultShipmentApproval {
  const _$ResultShipmentApprovalImpl({
    @JsonKey(name: 'approval_no') required this.approvalNo,
    @JsonKey(name: 'approval_type') required this.approvalType,
    required this.fullname,
    required this.phone,
    required this.designation,
    required this.signature,
    @JsonKey(name: 'approval_date') required this.approvalDate,
  });

  factory _$ResultShipmentApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultShipmentApprovalImplFromJson(json);

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
    return 'ResultShipmentApproval(approvalNo: $approvalNo, approvalType: $approvalType, fullname: $fullname, phone: $phone, designation: $designation, signature: $signature, approvalDate: $approvalDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultShipmentApprovalImpl &&
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

  /// Create a copy of ResultShipmentApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultShipmentApprovalImplCopyWith<_$ResultShipmentApprovalImpl>
  get copyWith =>
      __$$ResultShipmentApprovalImplCopyWithImpl<_$ResultShipmentApprovalImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultShipmentApprovalImplToJson(this);
  }
}

abstract class _ResultShipmentApproval implements ResultShipmentApproval {
  const factory _ResultShipmentApproval({
    @JsonKey(name: 'approval_no') required final String approvalNo,
    @JsonKey(name: 'approval_type') required final String approvalType,
    required final String fullname,
    required final String phone,
    required final String designation,
    required final String signature,
    @JsonKey(name: 'approval_date') required final String approvalDate,
  }) = _$ResultShipmentApprovalImpl;

  factory _ResultShipmentApproval.fromJson(Map<String, dynamic> json) =
      _$ResultShipmentApprovalImpl.fromJson;

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

  /// Create a copy of ResultShipmentApproval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultShipmentApprovalImplCopyWith<_$ResultShipmentApprovalImpl>
  get copyWith => throw _privateConstructorUsedError;
}
