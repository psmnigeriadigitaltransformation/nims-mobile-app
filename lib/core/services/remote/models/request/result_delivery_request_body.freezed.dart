// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_delivery_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResultDeliveryRequest _$ResultDeliveryRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ResultDeliveryRequest.fromJson(json);
}

/// @nodoc
mixin _$ResultDeliveryRequest {
  @JsonKey(name: 'route_no')
  String get routeNo => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  ResultDeliveryShipment get shipment => throw _privateConstructorUsedError;
  List<String> get samples => throw _privateConstructorUsedError;
  ResultDeliveryApproval get approval => throw _privateConstructorUsedError;

  /// Serializes this ResultDeliveryRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDeliveryRequestCopyWith<ResultDeliveryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDeliveryRequestCopyWith<$Res> {
  factory $ResultDeliveryRequestCopyWith(
    ResultDeliveryRequest value,
    $Res Function(ResultDeliveryRequest) then,
  ) = _$ResultDeliveryRequestCopyWithImpl<$Res, ResultDeliveryRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    String latitude,
    String longitude,
    ResultDeliveryShipment shipment,
    List<String> samples,
    ResultDeliveryApproval approval,
  });

  $ResultDeliveryShipmentCopyWith<$Res> get shipment;
  $ResultDeliveryApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class _$ResultDeliveryRequestCopyWithImpl<
  $Res,
  $Val extends ResultDeliveryRequest
>
    implements $ResultDeliveryRequestCopyWith<$Res> {
  _$ResultDeliveryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
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
                      as ResultDeliveryShipment,
            samples: null == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            approval: null == approval
                ? _value.approval
                : approval // ignore: cast_nullable_to_non_nullable
                      as ResultDeliveryApproval,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultDeliveryShipmentCopyWith<$Res> get shipment {
    return $ResultDeliveryShipmentCopyWith<$Res>(_value.shipment, (value) {
      return _then(_value.copyWith(shipment: value) as $Val);
    });
  }

  /// Create a copy of ResultDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultDeliveryApprovalCopyWith<$Res> get approval {
    return $ResultDeliveryApprovalCopyWith<$Res>(_value.approval, (value) {
      return _then(_value.copyWith(approval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultDeliveryRequestImplCopyWith<$Res>
    implements $ResultDeliveryRequestCopyWith<$Res> {
  factory _$$ResultDeliveryRequestImplCopyWith(
    _$ResultDeliveryRequestImpl value,
    $Res Function(_$ResultDeliveryRequestImpl) then,
  ) = __$$ResultDeliveryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    String latitude,
    String longitude,
    ResultDeliveryShipment shipment,
    List<String> samples,
    ResultDeliveryApproval approval,
  });

  @override
  $ResultDeliveryShipmentCopyWith<$Res> get shipment;
  @override
  $ResultDeliveryApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class __$$ResultDeliveryRequestImplCopyWithImpl<$Res>
    extends
        _$ResultDeliveryRequestCopyWithImpl<$Res, _$ResultDeliveryRequestImpl>
    implements _$$ResultDeliveryRequestImplCopyWith<$Res> {
  __$$ResultDeliveryRequestImplCopyWithImpl(
    _$ResultDeliveryRequestImpl _value,
    $Res Function(_$ResultDeliveryRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? shipment = null,
    Object? samples = null,
    Object? approval = null,
  }) {
    return _then(
      _$ResultDeliveryRequestImpl(
        routeNo: null == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
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
                  as ResultDeliveryShipment,
        samples: null == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        approval: null == approval
            ? _value.approval
            : approval // ignore: cast_nullable_to_non_nullable
                  as ResultDeliveryApproval,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDeliveryRequestImpl implements _ResultDeliveryRequest {
  const _$ResultDeliveryRequestImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    required this.latitude,
    required this.longitude,
    required this.shipment,
    required final List<String> samples,
    required this.approval,
  }) : _samples = samples;

  factory _$ResultDeliveryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDeliveryRequestImplFromJson(json);

  @override
  @JsonKey(name: 'route_no')
  final String routeNo;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final ResultDeliveryShipment shipment;
  final List<String> _samples;
  @override
  List<String> get samples {
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_samples);
  }

  @override
  final ResultDeliveryApproval approval;

  @override
  String toString() {
    return 'ResultDeliveryRequest(routeNo: $routeNo, latitude: $latitude, longitude: $longitude, shipment: $shipment, samples: $samples, approval: $approval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDeliveryRequestImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
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
    latitude,
    longitude,
    shipment,
    const DeepCollectionEquality().hash(_samples),
    approval,
  );

  /// Create a copy of ResultDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDeliveryRequestImplCopyWith<_$ResultDeliveryRequestImpl>
  get copyWith =>
      __$$ResultDeliveryRequestImplCopyWithImpl<_$ResultDeliveryRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDeliveryRequestImplToJson(this);
  }
}

abstract class _ResultDeliveryRequest implements ResultDeliveryRequest {
  const factory _ResultDeliveryRequest({
    @JsonKey(name: 'route_no') required final String routeNo,
    required final String latitude,
    required final String longitude,
    required final ResultDeliveryShipment shipment,
    required final List<String> samples,
    required final ResultDeliveryApproval approval,
  }) = _$ResultDeliveryRequestImpl;

  factory _ResultDeliveryRequest.fromJson(Map<String, dynamic> json) =
      _$ResultDeliveryRequestImpl.fromJson;

  @override
  @JsonKey(name: 'route_no')
  String get routeNo;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  ResultDeliveryShipment get shipment;
  @override
  List<String> get samples;
  @override
  ResultDeliveryApproval get approval;

  /// Create a copy of ResultDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDeliveryRequestImplCopyWith<_$ResultDeliveryRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResultDeliveryShipment _$ResultDeliveryShipmentFromJson(
  Map<String, dynamic> json,
) {
  return _ResultDeliveryShipment.fromJson(json);
}

/// @nodoc
mixin _$ResultDeliveryShipment {
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
  @JsonKey(name: 'delivery_date')
  String get deliveryDate => throw _privateConstructorUsedError;

  /// Serializes this ResultDeliveryShipment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDeliveryShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDeliveryShipmentCopyWith<ResultDeliveryShipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDeliveryShipmentCopyWith<$Res> {
  factory $ResultDeliveryShipmentCopyWith(
    ResultDeliveryShipment value,
    $Res Function(ResultDeliveryShipment) then,
  ) = _$ResultDeliveryShipmentCopyWithImpl<$Res, ResultDeliveryShipment>;
  @useResult
  $Res call({
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'destination_type') String destinationType,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'delivery_date') String deliveryDate,
  });
}

/// @nodoc
class _$ResultDeliveryShipmentCopyWithImpl<
  $Res,
  $Val extends ResultDeliveryShipment
>
    implements $ResultDeliveryShipmentCopyWith<$Res> {
  _$ResultDeliveryShipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDeliveryShipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? originType = null,
    Object? destinationType = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? deliveryDate = null,
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
            deliveryDate: null == deliveryDate
                ? _value.deliveryDate
                : deliveryDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultDeliveryShipmentImplCopyWith<$Res>
    implements $ResultDeliveryShipmentCopyWith<$Res> {
  factory _$$ResultDeliveryShipmentImplCopyWith(
    _$ResultDeliveryShipmentImpl value,
    $Res Function(_$ResultDeliveryShipmentImpl) then,
  ) = __$$ResultDeliveryShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'origin_type') String originType,
    @JsonKey(name: 'destination_type') String destinationType,
    @JsonKey(name: 'sample_type') String sampleType,
    @JsonKey(name: 'sample_count') int sampleCount,
    @JsonKey(name: 'delivery_date') String deliveryDate,
  });
}

/// @nodoc
class __$$ResultDeliveryShipmentImplCopyWithImpl<$Res>
    extends
        _$ResultDeliveryShipmentCopyWithImpl<$Res, _$ResultDeliveryShipmentImpl>
    implements _$$ResultDeliveryShipmentImplCopyWith<$Res> {
  __$$ResultDeliveryShipmentImplCopyWithImpl(
    _$ResultDeliveryShipmentImpl _value,
    $Res Function(_$ResultDeliveryShipmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultDeliveryShipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipmentNo = null,
    Object? originType = null,
    Object? destinationType = null,
    Object? sampleType = null,
    Object? sampleCount = null,
    Object? deliveryDate = null,
  }) {
    return _then(
      _$ResultDeliveryShipmentImpl(
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
        deliveryDate: null == deliveryDate
            ? _value.deliveryDate
            : deliveryDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDeliveryShipmentImpl implements _ResultDeliveryShipment {
  const _$ResultDeliveryShipmentImpl({
    @JsonKey(name: 'shipment_no') required this.shipmentNo,
    @JsonKey(name: 'origin_type') required this.originType,
    @JsonKey(name: 'destination_type') required this.destinationType,
    @JsonKey(name: 'sample_type') required this.sampleType,
    @JsonKey(name: 'sample_count') required this.sampleCount,
    @JsonKey(name: 'delivery_date') required this.deliveryDate,
  });

  factory _$ResultDeliveryShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDeliveryShipmentImplFromJson(json);

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
  @JsonKey(name: 'delivery_date')
  final String deliveryDate;

  @override
  String toString() {
    return 'ResultDeliveryShipment(shipmentNo: $shipmentNo, originType: $originType, destinationType: $destinationType, sampleType: $sampleType, sampleCount: $sampleCount, deliveryDate: $deliveryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDeliveryShipmentImpl &&
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
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
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
    deliveryDate,
  );

  /// Create a copy of ResultDeliveryShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDeliveryShipmentImplCopyWith<_$ResultDeliveryShipmentImpl>
  get copyWith =>
      __$$ResultDeliveryShipmentImplCopyWithImpl<_$ResultDeliveryShipmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDeliveryShipmentImplToJson(this);
  }
}

abstract class _ResultDeliveryShipment implements ResultDeliveryShipment {
  const factory _ResultDeliveryShipment({
    @JsonKey(name: 'shipment_no') required final String shipmentNo,
    @JsonKey(name: 'origin_type') required final String originType,
    @JsonKey(name: 'destination_type') required final String destinationType,
    @JsonKey(name: 'sample_type') required final String sampleType,
    @JsonKey(name: 'sample_count') required final int sampleCount,
    @JsonKey(name: 'delivery_date') required final String deliveryDate,
  }) = _$ResultDeliveryShipmentImpl;

  factory _ResultDeliveryShipment.fromJson(Map<String, dynamic> json) =
      _$ResultDeliveryShipmentImpl.fromJson;

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
  @JsonKey(name: 'delivery_date')
  String get deliveryDate;

  /// Create a copy of ResultDeliveryShipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDeliveryShipmentImplCopyWith<_$ResultDeliveryShipmentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResultDeliveryApproval _$ResultDeliveryApprovalFromJson(
  Map<String, dynamic> json,
) {
  return _ResultDeliveryApproval.fromJson(json);
}

/// @nodoc
mixin _$ResultDeliveryApproval {
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

  /// Serializes this ResultDeliveryApproval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDeliveryApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDeliveryApprovalCopyWith<ResultDeliveryApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDeliveryApprovalCopyWith<$Res> {
  factory $ResultDeliveryApprovalCopyWith(
    ResultDeliveryApproval value,
    $Res Function(ResultDeliveryApproval) then,
  ) = _$ResultDeliveryApprovalCopyWithImpl<$Res, ResultDeliveryApproval>;
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
class _$ResultDeliveryApprovalCopyWithImpl<
  $Res,
  $Val extends ResultDeliveryApproval
>
    implements $ResultDeliveryApprovalCopyWith<$Res> {
  _$ResultDeliveryApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDeliveryApproval
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
abstract class _$$ResultDeliveryApprovalImplCopyWith<$Res>
    implements $ResultDeliveryApprovalCopyWith<$Res> {
  factory _$$ResultDeliveryApprovalImplCopyWith(
    _$ResultDeliveryApprovalImpl value,
    $Res Function(_$ResultDeliveryApprovalImpl) then,
  ) = __$$ResultDeliveryApprovalImplCopyWithImpl<$Res>;
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
class __$$ResultDeliveryApprovalImplCopyWithImpl<$Res>
    extends
        _$ResultDeliveryApprovalCopyWithImpl<$Res, _$ResultDeliveryApprovalImpl>
    implements _$$ResultDeliveryApprovalImplCopyWith<$Res> {
  __$$ResultDeliveryApprovalImplCopyWithImpl(
    _$ResultDeliveryApprovalImpl _value,
    $Res Function(_$ResultDeliveryApprovalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultDeliveryApproval
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
      _$ResultDeliveryApprovalImpl(
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
class _$ResultDeliveryApprovalImpl implements _ResultDeliveryApproval {
  const _$ResultDeliveryApprovalImpl({
    @JsonKey(name: 'approval_no') required this.approvalNo,
    @JsonKey(name: 'approval_type') required this.approvalType,
    required this.fullname,
    required this.phone,
    required this.designation,
    required this.signature,
    @JsonKey(name: 'approval_date') required this.approvalDate,
  });

  factory _$ResultDeliveryApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDeliveryApprovalImplFromJson(json);

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
    return 'ResultDeliveryApproval(approvalNo: $approvalNo, approvalType: $approvalType, fullname: $fullname, phone: $phone, designation: $designation, signature: $signature, approvalDate: $approvalDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDeliveryApprovalImpl &&
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

  /// Create a copy of ResultDeliveryApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDeliveryApprovalImplCopyWith<_$ResultDeliveryApprovalImpl>
  get copyWith =>
      __$$ResultDeliveryApprovalImplCopyWithImpl<_$ResultDeliveryApprovalImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDeliveryApprovalImplToJson(this);
  }
}

abstract class _ResultDeliveryApproval implements ResultDeliveryApproval {
  const factory _ResultDeliveryApproval({
    @JsonKey(name: 'approval_no') required final String approvalNo,
    @JsonKey(name: 'approval_type') required final String approvalType,
    required final String fullname,
    required final String phone,
    required final String designation,
    required final String signature,
    @JsonKey(name: 'approval_date') required final String approvalDate,
  }) = _$ResultDeliveryApprovalImpl;

  factory _ResultDeliveryApproval.fromJson(Map<String, dynamic> json) =
      _$ResultDeliveryApprovalImpl.fromJson;

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

  /// Create a copy of ResultDeliveryApproval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDeliveryApprovalImplCopyWith<_$ResultDeliveryApprovalImpl>
  get copyWith => throw _privateConstructorUsedError;
}
