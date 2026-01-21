// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specimen_delivery_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SpecimenDeliveryRequest _$SpecimenDeliveryRequestFromJson(
  Map<String, dynamic> json,
) {
  return _SpecimenDeliveryRequest.fromJson(json);
}

/// @nodoc
mixin _$SpecimenDeliveryRequest {
  @JsonKey(name: 'route_no')
  String get routeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipment_no')
  String get shipmentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String get manifestNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  String get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  String get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  String get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_type')
  String get destinationType => throw _privateConstructorUsedError;
  SpecimenDeliveryApproval get approval => throw _privateConstructorUsedError;

  /// Serializes this SpecimenDeliveryRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecimenDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecimenDeliveryRequestCopyWith<SpecimenDeliveryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecimenDeliveryRequestCopyWith<$Res> {
  factory $SpecimenDeliveryRequestCopyWith(
    SpecimenDeliveryRequest value,
    $Res Function(SpecimenDeliveryRequest) then,
  ) = _$SpecimenDeliveryRequestCopyWithImpl<$Res, SpecimenDeliveryRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'latitude') String latitude,
    @JsonKey(name: 'longitude') String longitude,
    @JsonKey(name: 'delivery_date') String deliveryDate,
    @JsonKey(name: 'destination_type') String destinationType,
    SpecimenDeliveryApproval approval,
  });

  $SpecimenDeliveryApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class _$SpecimenDeliveryRequestCopyWithImpl<
  $Res,
  $Val extends SpecimenDeliveryRequest
>
    implements $SpecimenDeliveryRequestCopyWith<$Res> {
  _$SpecimenDeliveryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecimenDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
    Object? shipmentNo = null,
    Object? manifestNo = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? deliveryDate = null,
    Object? destinationType = null,
    Object? approval = null,
  }) {
    return _then(
      _value.copyWith(
            routeNo: null == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String,
            shipmentNo: null == shipmentNo
                ? _value.shipmentNo
                : shipmentNo // ignore: cast_nullable_to_non_nullable
                      as String,
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryDate: null == deliveryDate
                ? _value.deliveryDate
                : deliveryDate // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationType: null == destinationType
                ? _value.destinationType
                : destinationType // ignore: cast_nullable_to_non_nullable
                      as String,
            approval: null == approval
                ? _value.approval
                : approval // ignore: cast_nullable_to_non_nullable
                      as SpecimenDeliveryApproval,
          )
          as $Val,
    );
  }

  /// Create a copy of SpecimenDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecimenDeliveryApprovalCopyWith<$Res> get approval {
    return $SpecimenDeliveryApprovalCopyWith<$Res>(_value.approval, (value) {
      return _then(_value.copyWith(approval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpecimenDeliveryRequestImplCopyWith<$Res>
    implements $SpecimenDeliveryRequestCopyWith<$Res> {
  factory _$$SpecimenDeliveryRequestImplCopyWith(
    _$SpecimenDeliveryRequestImpl value,
    $Res Function(_$SpecimenDeliveryRequestImpl) then,
  ) = __$$SpecimenDeliveryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'shipment_no') String shipmentNo,
    @JsonKey(name: 'manifest_no') String manifestNo,
    @JsonKey(name: 'latitude') String latitude,
    @JsonKey(name: 'longitude') String longitude,
    @JsonKey(name: 'delivery_date') String deliveryDate,
    @JsonKey(name: 'destination_type') String destinationType,
    SpecimenDeliveryApproval approval,
  });

  @override
  $SpecimenDeliveryApprovalCopyWith<$Res> get approval;
}

/// @nodoc
class __$$SpecimenDeliveryRequestImplCopyWithImpl<$Res>
    extends
        _$SpecimenDeliveryRequestCopyWithImpl<
          $Res,
          _$SpecimenDeliveryRequestImpl
        >
    implements _$$SpecimenDeliveryRequestImplCopyWith<$Res> {
  __$$SpecimenDeliveryRequestImplCopyWithImpl(
    _$SpecimenDeliveryRequestImpl _value,
    $Res Function(_$SpecimenDeliveryRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecimenDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = null,
    Object? shipmentNo = null,
    Object? manifestNo = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? deliveryDate = null,
    Object? destinationType = null,
    Object? approval = null,
  }) {
    return _then(
      _$SpecimenDeliveryRequestImpl(
        routeNo: null == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String,
        shipmentNo: null == shipmentNo
            ? _value.shipmentNo
            : shipmentNo // ignore: cast_nullable_to_non_nullable
                  as String,
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryDate: null == deliveryDate
            ? _value.deliveryDate
            : deliveryDate // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationType: null == destinationType
            ? _value.destinationType
            : destinationType // ignore: cast_nullable_to_non_nullable
                  as String,
        approval: null == approval
            ? _value.approval
            : approval // ignore: cast_nullable_to_non_nullable
                  as SpecimenDeliveryApproval,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecimenDeliveryRequestImpl implements _SpecimenDeliveryRequest {
  const _$SpecimenDeliveryRequestImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'shipment_no') required this.shipmentNo,
    @JsonKey(name: 'manifest_no') required this.manifestNo,
    @JsonKey(name: 'latitude') required this.latitude,
    @JsonKey(name: 'longitude') required this.longitude,
    @JsonKey(name: 'delivery_date') required this.deliveryDate,
    @JsonKey(name: 'destination_type') required this.destinationType,
    required this.approval,
  });

  factory _$SpecimenDeliveryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecimenDeliveryRequestImplFromJson(json);

  @override
  @JsonKey(name: 'route_no')
  final String routeNo;
  @override
  @JsonKey(name: 'shipment_no')
  final String shipmentNo;
  @override
  @JsonKey(name: 'manifest_no')
  final String manifestNo;
  @override
  @JsonKey(name: 'latitude')
  final String latitude;
  @override
  @JsonKey(name: 'longitude')
  final String longitude;
  @override
  @JsonKey(name: 'delivery_date')
  final String deliveryDate;
  @override
  @JsonKey(name: 'destination_type')
  final String destinationType;
  @override
  final SpecimenDeliveryApproval approval;

  @override
  String toString() {
    return 'SpecimenDeliveryRequest(routeNo: $routeNo, shipmentNo: $shipmentNo, manifestNo: $manifestNo, latitude: $latitude, longitude: $longitude, deliveryDate: $deliveryDate, destinationType: $destinationType, approval: $approval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecimenDeliveryRequestImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.destinationType, destinationType) ||
                other.destinationType == destinationType) &&
            (identical(other.approval, approval) ||
                other.approval == approval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    routeNo,
    shipmentNo,
    manifestNo,
    latitude,
    longitude,
    deliveryDate,
    destinationType,
    approval,
  );

  /// Create a copy of SpecimenDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecimenDeliveryRequestImplCopyWith<_$SpecimenDeliveryRequestImpl>
  get copyWith =>
      __$$SpecimenDeliveryRequestImplCopyWithImpl<
        _$SpecimenDeliveryRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecimenDeliveryRequestImplToJson(this);
  }
}

abstract class _SpecimenDeliveryRequest implements SpecimenDeliveryRequest {
  const factory _SpecimenDeliveryRequest({
    @JsonKey(name: 'route_no') required final String routeNo,
    @JsonKey(name: 'shipment_no') required final String shipmentNo,
    @JsonKey(name: 'manifest_no') required final String manifestNo,
    @JsonKey(name: 'latitude') required final String latitude,
    @JsonKey(name: 'longitude') required final String longitude,
    @JsonKey(name: 'delivery_date') required final String deliveryDate,
    @JsonKey(name: 'destination_type') required final String destinationType,
    required final SpecimenDeliveryApproval approval,
  }) = _$SpecimenDeliveryRequestImpl;

  factory _SpecimenDeliveryRequest.fromJson(Map<String, dynamic> json) =
      _$SpecimenDeliveryRequestImpl.fromJson;

  @override
  @JsonKey(name: 'route_no')
  String get routeNo;
  @override
  @JsonKey(name: 'shipment_no')
  String get shipmentNo;
  @override
  @JsonKey(name: 'manifest_no')
  String get manifestNo;
  @override
  @JsonKey(name: 'latitude')
  String get latitude;
  @override
  @JsonKey(name: 'longitude')
  String get longitude;
  @override
  @JsonKey(name: 'delivery_date')
  String get deliveryDate;
  @override
  @JsonKey(name: 'destination_type')
  String get destinationType;
  @override
  SpecimenDeliveryApproval get approval;

  /// Create a copy of SpecimenDeliveryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecimenDeliveryRequestImplCopyWith<_$SpecimenDeliveryRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SpecimenDeliveryApproval _$SpecimenDeliveryApprovalFromJson(
  Map<String, dynamic> json,
) {
  return _SpecimenDeliveryApproval.fromJson(json);
}

/// @nodoc
mixin _$SpecimenDeliveryApproval {
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

  /// Serializes this SpecimenDeliveryApproval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecimenDeliveryApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecimenDeliveryApprovalCopyWith<SpecimenDeliveryApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecimenDeliveryApprovalCopyWith<$Res> {
  factory $SpecimenDeliveryApprovalCopyWith(
    SpecimenDeliveryApproval value,
    $Res Function(SpecimenDeliveryApproval) then,
  ) = _$SpecimenDeliveryApprovalCopyWithImpl<$Res, SpecimenDeliveryApproval>;
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
class _$SpecimenDeliveryApprovalCopyWithImpl<
  $Res,
  $Val extends SpecimenDeliveryApproval
>
    implements $SpecimenDeliveryApprovalCopyWith<$Res> {
  _$SpecimenDeliveryApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecimenDeliveryApproval
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
abstract class _$$SpecimenDeliveryApprovalImplCopyWith<$Res>
    implements $SpecimenDeliveryApprovalCopyWith<$Res> {
  factory _$$SpecimenDeliveryApprovalImplCopyWith(
    _$SpecimenDeliveryApprovalImpl value,
    $Res Function(_$SpecimenDeliveryApprovalImpl) then,
  ) = __$$SpecimenDeliveryApprovalImplCopyWithImpl<$Res>;
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
class __$$SpecimenDeliveryApprovalImplCopyWithImpl<$Res>
    extends
        _$SpecimenDeliveryApprovalCopyWithImpl<
          $Res,
          _$SpecimenDeliveryApprovalImpl
        >
    implements _$$SpecimenDeliveryApprovalImplCopyWith<$Res> {
  __$$SpecimenDeliveryApprovalImplCopyWithImpl(
    _$SpecimenDeliveryApprovalImpl _value,
    $Res Function(_$SpecimenDeliveryApprovalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecimenDeliveryApproval
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
      _$SpecimenDeliveryApprovalImpl(
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
class _$SpecimenDeliveryApprovalImpl implements _SpecimenDeliveryApproval {
  const _$SpecimenDeliveryApprovalImpl({
    @JsonKey(name: 'approval_no') required this.approvalNo,
    @JsonKey(name: 'approval_type') required this.approvalType,
    required this.fullname,
    required this.phone,
    required this.designation,
    required this.signature,
    @JsonKey(name: 'approval_date') required this.approvalDate,
  });

  factory _$SpecimenDeliveryApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecimenDeliveryApprovalImplFromJson(json);

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
    return 'SpecimenDeliveryApproval(approvalNo: $approvalNo, approvalType: $approvalType, fullname: $fullname, phone: $phone, designation: $designation, signature: $signature, approvalDate: $approvalDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecimenDeliveryApprovalImpl &&
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

  /// Create a copy of SpecimenDeliveryApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecimenDeliveryApprovalImplCopyWith<_$SpecimenDeliveryApprovalImpl>
  get copyWith =>
      __$$SpecimenDeliveryApprovalImplCopyWithImpl<
        _$SpecimenDeliveryApprovalImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecimenDeliveryApprovalImplToJson(this);
  }
}

abstract class _SpecimenDeliveryApproval implements SpecimenDeliveryApproval {
  const factory _SpecimenDeliveryApproval({
    @JsonKey(name: 'approval_no') required final String approvalNo,
    @JsonKey(name: 'approval_type') required final String approvalType,
    required final String fullname,
    required final String phone,
    required final String designation,
    required final String signature,
    @JsonKey(name: 'approval_date') required final String approvalDate,
  }) = _$SpecimenDeliveryApprovalImpl;

  factory _SpecimenDeliveryApproval.fromJson(Map<String, dynamic> json) =
      _$SpecimenDeliveryApprovalImpl.fromJson;

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

  /// Create a copy of SpecimenDeliveryApproval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecimenDeliveryApprovalImplCopyWith<_$SpecimenDeliveryApprovalImpl>
  get copyWith => throw _privateConstructorUsedError;
}
