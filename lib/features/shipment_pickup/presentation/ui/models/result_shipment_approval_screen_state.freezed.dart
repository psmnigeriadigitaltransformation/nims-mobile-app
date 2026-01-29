// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_shipment_approval_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResultShipmentApprovalScreenState {
  MovementType get movementType => throw _privateConstructorUsedError;
  Facility get pickUpFacility => throw _privateConstructorUsedError;
  Facility get destinationFacility => throw _privateConstructorUsedError;
  List<Shipment> get shipments =>
      throw _privateConstructorUsedError; // Map of shipment_no to list of sample codes
  List<String> get shipmentSampleCodes => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  bool get isSavingShipmentRoute => throw _privateConstructorUsedError;
  Alert get alert => throw _privateConstructorUsedError;
  bool get showSuccessDialog => throw _privateConstructorUsedError;
  String get createdRouteNo => throw _privateConstructorUsedError;

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultShipmentApprovalScreenStateCopyWith<ResultShipmentApprovalScreenState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultShipmentApprovalScreenStateCopyWith<$Res> {
  factory $ResultShipmentApprovalScreenStateCopyWith(
    ResultShipmentApprovalScreenState value,
    $Res Function(ResultShipmentApprovalScreenState) then,
  ) =
      _$ResultShipmentApprovalScreenStateCopyWithImpl<
        $Res,
        ResultShipmentApprovalScreenState
      >;
  @useResult
  $Res call({
    MovementType movementType,
    Facility pickUpFacility,
    Facility destinationFacility,
    List<Shipment> shipments,
    List<String> shipmentSampleCodes,
    String fullName,
    String phoneNumber,
    String designation,
    String signature,
    bool isSavingShipmentRoute,
    Alert alert,
    bool showSuccessDialog,
    String createdRouteNo,
  });

  $MovementTypeCopyWith<$Res> get movementType;
  $FacilityCopyWith<$Res> get pickUpFacility;
  $FacilityCopyWith<$Res> get destinationFacility;
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class _$ResultShipmentApprovalScreenStateCopyWithImpl<
  $Res,
  $Val extends ResultShipmentApprovalScreenState
>
    implements $ResultShipmentApprovalScreenStateCopyWith<$Res> {
  _$ResultShipmentApprovalScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movementType = null,
    Object? pickUpFacility = null,
    Object? destinationFacility = null,
    Object? shipments = null,
    Object? shipmentSampleCodes = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? designation = null,
    Object? signature = null,
    Object? isSavingShipmentRoute = null,
    Object? alert = null,
    Object? showSuccessDialog = null,
    Object? createdRouteNo = null,
  }) {
    return _then(
      _value.copyWith(
            movementType: null == movementType
                ? _value.movementType
                : movementType // ignore: cast_nullable_to_non_nullable
                      as MovementType,
            pickUpFacility: null == pickUpFacility
                ? _value.pickUpFacility
                : pickUpFacility // ignore: cast_nullable_to_non_nullable
                      as Facility,
            destinationFacility: null == destinationFacility
                ? _value.destinationFacility
                : destinationFacility // ignore: cast_nullable_to_non_nullable
                      as Facility,
            shipments: null == shipments
                ? _value.shipments
                : shipments // ignore: cast_nullable_to_non_nullable
                      as List<Shipment>,
            shipmentSampleCodes: null == shipmentSampleCodes
                ? _value.shipmentSampleCodes
                : shipmentSampleCodes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            designation: null == designation
                ? _value.designation
                : designation // ignore: cast_nullable_to_non_nullable
                      as String,
            signature: null == signature
                ? _value.signature
                : signature // ignore: cast_nullable_to_non_nullable
                      as String,
            isSavingShipmentRoute: null == isSavingShipmentRoute
                ? _value.isSavingShipmentRoute
                : isSavingShipmentRoute // ignore: cast_nullable_to_non_nullable
                      as bool,
            alert: null == alert
                ? _value.alert
                : alert // ignore: cast_nullable_to_non_nullable
                      as Alert,
            showSuccessDialog: null == showSuccessDialog
                ? _value.showSuccessDialog
                : showSuccessDialog // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdRouteNo: null == createdRouteNo
                ? _value.createdRouteNo
                : createdRouteNo // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovementTypeCopyWith<$Res> get movementType {
    return $MovementTypeCopyWith<$Res>(_value.movementType, (value) {
      return _then(_value.copyWith(movementType: value) as $Val);
    });
  }

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res> get pickUpFacility {
    return $FacilityCopyWith<$Res>(_value.pickUpFacility, (value) {
      return _then(_value.copyWith(pickUpFacility: value) as $Val);
    });
  }

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res> get destinationFacility {
    return $FacilityCopyWith<$Res>(_value.destinationFacility, (value) {
      return _then(_value.copyWith(destinationFacility: value) as $Val);
    });
  }

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlertCopyWith<$Res> get alert {
    return $AlertCopyWith<$Res>(_value.alert, (value) {
      return _then(_value.copyWith(alert: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultShipmentApprovalScreenStateImplCopyWith<$Res>
    implements $ResultShipmentApprovalScreenStateCopyWith<$Res> {
  factory _$$ResultShipmentApprovalScreenStateImplCopyWith(
    _$ResultShipmentApprovalScreenStateImpl value,
    $Res Function(_$ResultShipmentApprovalScreenStateImpl) then,
  ) = __$$ResultShipmentApprovalScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MovementType movementType,
    Facility pickUpFacility,
    Facility destinationFacility,
    List<Shipment> shipments,
    List<String> shipmentSampleCodes,
    String fullName,
    String phoneNumber,
    String designation,
    String signature,
    bool isSavingShipmentRoute,
    Alert alert,
    bool showSuccessDialog,
    String createdRouteNo,
  });

  @override
  $MovementTypeCopyWith<$Res> get movementType;
  @override
  $FacilityCopyWith<$Res> get pickUpFacility;
  @override
  $FacilityCopyWith<$Res> get destinationFacility;
  @override
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class __$$ResultShipmentApprovalScreenStateImplCopyWithImpl<$Res>
    extends
        _$ResultShipmentApprovalScreenStateCopyWithImpl<
          $Res,
          _$ResultShipmentApprovalScreenStateImpl
        >
    implements _$$ResultShipmentApprovalScreenStateImplCopyWith<$Res> {
  __$$ResultShipmentApprovalScreenStateImplCopyWithImpl(
    _$ResultShipmentApprovalScreenStateImpl _value,
    $Res Function(_$ResultShipmentApprovalScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movementType = null,
    Object? pickUpFacility = null,
    Object? destinationFacility = null,
    Object? shipments = null,
    Object? shipmentSampleCodes = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? designation = null,
    Object? signature = null,
    Object? isSavingShipmentRoute = null,
    Object? alert = null,
    Object? showSuccessDialog = null,
    Object? createdRouteNo = null,
  }) {
    return _then(
      _$ResultShipmentApprovalScreenStateImpl(
        movementType: null == movementType
            ? _value.movementType
            : movementType // ignore: cast_nullable_to_non_nullable
                  as MovementType,
        pickUpFacility: null == pickUpFacility
            ? _value.pickUpFacility
            : pickUpFacility // ignore: cast_nullable_to_non_nullable
                  as Facility,
        destinationFacility: null == destinationFacility
            ? _value.destinationFacility
            : destinationFacility // ignore: cast_nullable_to_non_nullable
                  as Facility,
        shipments: null == shipments
            ? _value._shipments
            : shipments // ignore: cast_nullable_to_non_nullable
                  as List<Shipment>,
        shipmentSampleCodes: null == shipmentSampleCodes
            ? _value._shipmentSampleCodes
            : shipmentSampleCodes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        designation: null == designation
            ? _value.designation
            : designation // ignore: cast_nullable_to_non_nullable
                  as String,
        signature: null == signature
            ? _value.signature
            : signature // ignore: cast_nullable_to_non_nullable
                  as String,
        isSavingShipmentRoute: null == isSavingShipmentRoute
            ? _value.isSavingShipmentRoute
            : isSavingShipmentRoute // ignore: cast_nullable_to_non_nullable
                  as bool,
        alert: null == alert
            ? _value.alert
            : alert // ignore: cast_nullable_to_non_nullable
                  as Alert,
        showSuccessDialog: null == showSuccessDialog
            ? _value.showSuccessDialog
            : showSuccessDialog // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdRouteNo: null == createdRouteNo
            ? _value.createdRouteNo
            : createdRouteNo // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResultShipmentApprovalScreenStateImpl
    extends _ResultShipmentApprovalScreenState {
  const _$ResultShipmentApprovalScreenStateImpl({
    required this.movementType,
    required this.pickUpFacility,
    required this.destinationFacility,
    required final List<Shipment> shipments,
    final List<String> shipmentSampleCodes = const [],
    this.fullName = "",
    this.phoneNumber = "",
    this.designation = "",
    this.signature = "",
    this.isSavingShipmentRoute = false,
    this.alert = const Alert(message: "", show: false),
    this.showSuccessDialog = false,
    this.createdRouteNo = "",
  }) : _shipments = shipments,
       _shipmentSampleCodes = shipmentSampleCodes,
       super._();

  @override
  final MovementType movementType;
  @override
  final Facility pickUpFacility;
  @override
  final Facility destinationFacility;
  final List<Shipment> _shipments;
  @override
  List<Shipment> get shipments {
    if (_shipments is EqualUnmodifiableListView) return _shipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipments);
  }

  // Map of shipment_no to list of sample codes
  final List<String> _shipmentSampleCodes;
  // Map of shipment_no to list of sample codes
  @override
  @JsonKey()
  List<String> get shipmentSampleCodes {
    if (_shipmentSampleCodes is EqualUnmodifiableListView)
      return _shipmentSampleCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipmentSampleCodes);
  }

  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String designation;
  @override
  @JsonKey()
  final String signature;
  @override
  @JsonKey()
  final bool isSavingShipmentRoute;
  @override
  @JsonKey()
  final Alert alert;
  @override
  @JsonKey()
  final bool showSuccessDialog;
  @override
  @JsonKey()
  final String createdRouteNo;

  @override
  String toString() {
    return 'ResultShipmentApprovalScreenState(movementType: $movementType, pickUpFacility: $pickUpFacility, destinationFacility: $destinationFacility, shipments: $shipments, shipmentSampleCodes: $shipmentSampleCodes, fullName: $fullName, phoneNumber: $phoneNumber, designation: $designation, signature: $signature, isSavingShipmentRoute: $isSavingShipmentRoute, alert: $alert, showSuccessDialog: $showSuccessDialog, createdRouteNo: $createdRouteNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultShipmentApprovalScreenStateImpl &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(other.pickUpFacility, pickUpFacility) ||
                other.pickUpFacility == pickUpFacility) &&
            (identical(other.destinationFacility, destinationFacility) ||
                other.destinationFacility == destinationFacility) &&
            const DeepCollectionEquality().equals(
              other._shipments,
              _shipments,
            ) &&
            const DeepCollectionEquality().equals(
              other._shipmentSampleCodes,
              _shipmentSampleCodes,
            ) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.isSavingShipmentRoute, isSavingShipmentRoute) ||
                other.isSavingShipmentRoute == isSavingShipmentRoute) &&
            (identical(other.alert, alert) || other.alert == alert) &&
            (identical(other.showSuccessDialog, showSuccessDialog) ||
                other.showSuccessDialog == showSuccessDialog) &&
            (identical(other.createdRouteNo, createdRouteNo) ||
                other.createdRouteNo == createdRouteNo));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    movementType,
    pickUpFacility,
    destinationFacility,
    const DeepCollectionEquality().hash(_shipments),
    const DeepCollectionEquality().hash(_shipmentSampleCodes),
    fullName,
    phoneNumber,
    designation,
    signature,
    isSavingShipmentRoute,
    alert,
    showSuccessDialog,
    createdRouteNo,
  );

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultShipmentApprovalScreenStateImplCopyWith<
    _$ResultShipmentApprovalScreenStateImpl
  >
  get copyWith =>
      __$$ResultShipmentApprovalScreenStateImplCopyWithImpl<
        _$ResultShipmentApprovalScreenStateImpl
      >(this, _$identity);
}

abstract class _ResultShipmentApprovalScreenState
    extends ResultShipmentApprovalScreenState {
  const factory _ResultShipmentApprovalScreenState({
    required final MovementType movementType,
    required final Facility pickUpFacility,
    required final Facility destinationFacility,
    required final List<Shipment> shipments,
    final List<String> shipmentSampleCodes,
    final String fullName,
    final String phoneNumber,
    final String designation,
    final String signature,
    final bool isSavingShipmentRoute,
    final Alert alert,
    final bool showSuccessDialog,
    final String createdRouteNo,
  }) = _$ResultShipmentApprovalScreenStateImpl;
  const _ResultShipmentApprovalScreenState._() : super._();

  @override
  MovementType get movementType;
  @override
  Facility get pickUpFacility;
  @override
  Facility get destinationFacility;
  @override
  List<Shipment> get shipments; // Map of shipment_no to list of sample codes
  @override
  List<String> get shipmentSampleCodes;
  @override
  String get fullName;
  @override
  String get phoneNumber;
  @override
  String get designation;
  @override
  String get signature;
  @override
  bool get isSavingShipmentRoute;
  @override
  Alert get alert;
  @override
  bool get showSuccessDialog;
  @override
  String get createdRouteNo;

  /// Create a copy of ResultShipmentApprovalScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultShipmentApprovalScreenStateImplCopyWith<
    _$ResultShipmentApprovalScreenStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
