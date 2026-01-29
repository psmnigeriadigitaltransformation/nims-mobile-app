// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_shipment_details_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResultShipmentDetailsScreenState {
  Shipment get shipment => throw _privateConstructorUsedError;
  List<LabResult> get results => throw _privateConstructorUsedError;
  ShipmentRoute? get route => throw _privateConstructorUsedError;
  Approval? get pickupApproval => throw _privateConstructorUsedError;
  Approval? get deliveryApproval => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultShipmentDetailsScreenStateCopyWith<ResultShipmentDetailsScreenState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultShipmentDetailsScreenStateCopyWith<$Res> {
  factory $ResultShipmentDetailsScreenStateCopyWith(
    ResultShipmentDetailsScreenState value,
    $Res Function(ResultShipmentDetailsScreenState) then,
  ) =
      _$ResultShipmentDetailsScreenStateCopyWithImpl<
        $Res,
        ResultShipmentDetailsScreenState
      >;
  @useResult
  $Res call({
    Shipment shipment,
    List<LabResult> results,
    ShipmentRoute? route,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    bool isLoading,
  });

  $ShipmentCopyWith<$Res> get shipment;
  $ShipmentRouteCopyWith<$Res>? get route;
  $ApprovalCopyWith<$Res>? get pickupApproval;
  $ApprovalCopyWith<$Res>? get deliveryApproval;
}

/// @nodoc
class _$ResultShipmentDetailsScreenStateCopyWithImpl<
  $Res,
  $Val extends ResultShipmentDetailsScreenState
>
    implements $ResultShipmentDetailsScreenStateCopyWith<$Res> {
  _$ResultShipmentDetailsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipment = null,
    Object? results = null,
    Object? route = freezed,
    Object? pickupApproval = freezed,
    Object? deliveryApproval = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            shipment: null == shipment
                ? _value.shipment
                : shipment // ignore: cast_nullable_to_non_nullable
                      as Shipment,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<LabResult>,
            route: freezed == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as ShipmentRoute?,
            pickupApproval: freezed == pickupApproval
                ? _value.pickupApproval
                : pickupApproval // ignore: cast_nullable_to_non_nullable
                      as Approval?,
            deliveryApproval: freezed == deliveryApproval
                ? _value.deliveryApproval
                : deliveryApproval // ignore: cast_nullable_to_non_nullable
                      as Approval?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipmentCopyWith<$Res> get shipment {
    return $ShipmentCopyWith<$Res>(_value.shipment, (value) {
      return _then(_value.copyWith(shipment: value) as $Val);
    });
  }

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipmentRouteCopyWith<$Res>? get route {
    if (_value.route == null) {
      return null;
    }

    return $ShipmentRouteCopyWith<$Res>(_value.route!, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApprovalCopyWith<$Res>? get pickupApproval {
    if (_value.pickupApproval == null) {
      return null;
    }

    return $ApprovalCopyWith<$Res>(_value.pickupApproval!, (value) {
      return _then(_value.copyWith(pickupApproval: value) as $Val);
    });
  }

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApprovalCopyWith<$Res>? get deliveryApproval {
    if (_value.deliveryApproval == null) {
      return null;
    }

    return $ApprovalCopyWith<$Res>(_value.deliveryApproval!, (value) {
      return _then(_value.copyWith(deliveryApproval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultShipmentDetailsScreenStateImplCopyWith<$Res>
    implements $ResultShipmentDetailsScreenStateCopyWith<$Res> {
  factory _$$ResultShipmentDetailsScreenStateImplCopyWith(
    _$ResultShipmentDetailsScreenStateImpl value,
    $Res Function(_$ResultShipmentDetailsScreenStateImpl) then,
  ) = __$$ResultShipmentDetailsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Shipment shipment,
    List<LabResult> results,
    ShipmentRoute? route,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    bool isLoading,
  });

  @override
  $ShipmentCopyWith<$Res> get shipment;
  @override
  $ShipmentRouteCopyWith<$Res>? get route;
  @override
  $ApprovalCopyWith<$Res>? get pickupApproval;
  @override
  $ApprovalCopyWith<$Res>? get deliveryApproval;
}

/// @nodoc
class __$$ResultShipmentDetailsScreenStateImplCopyWithImpl<$Res>
    extends
        _$ResultShipmentDetailsScreenStateCopyWithImpl<
          $Res,
          _$ResultShipmentDetailsScreenStateImpl
        >
    implements _$$ResultShipmentDetailsScreenStateImplCopyWith<$Res> {
  __$$ResultShipmentDetailsScreenStateImplCopyWithImpl(
    _$ResultShipmentDetailsScreenStateImpl _value,
    $Res Function(_$ResultShipmentDetailsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipment = null,
    Object? results = null,
    Object? route = freezed,
    Object? pickupApproval = freezed,
    Object? deliveryApproval = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$ResultShipmentDetailsScreenStateImpl(
        shipment: null == shipment
            ? _value.shipment
            : shipment // ignore: cast_nullable_to_non_nullable
                  as Shipment,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<LabResult>,
        route: freezed == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as ShipmentRoute?,
        pickupApproval: freezed == pickupApproval
            ? _value.pickupApproval
            : pickupApproval // ignore: cast_nullable_to_non_nullable
                  as Approval?,
        deliveryApproval: freezed == deliveryApproval
            ? _value.deliveryApproval
            : deliveryApproval // ignore: cast_nullable_to_non_nullable
                  as Approval?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ResultShipmentDetailsScreenStateImpl
    implements _ResultShipmentDetailsScreenState {
  const _$ResultShipmentDetailsScreenStateImpl({
    required this.shipment,
    final List<LabResult> results = const [],
    this.route,
    this.pickupApproval,
    this.deliveryApproval,
    this.isLoading = true,
  }) : _results = results;

  @override
  final Shipment shipment;
  final List<LabResult> _results;
  @override
  @JsonKey()
  List<LabResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final ShipmentRoute? route;
  @override
  final Approval? pickupApproval;
  @override
  final Approval? deliveryApproval;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ResultShipmentDetailsScreenState(shipment: $shipment, results: $results, route: $route, pickupApproval: $pickupApproval, deliveryApproval: $deliveryApproval, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultShipmentDetailsScreenStateImpl &&
            (identical(other.shipment, shipment) ||
                other.shipment == shipment) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.pickupApproval, pickupApproval) ||
                other.pickupApproval == pickupApproval) &&
            (identical(other.deliveryApproval, deliveryApproval) ||
                other.deliveryApproval == deliveryApproval) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    shipment,
    const DeepCollectionEquality().hash(_results),
    route,
    pickupApproval,
    deliveryApproval,
    isLoading,
  );

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultShipmentDetailsScreenStateImplCopyWith<
    _$ResultShipmentDetailsScreenStateImpl
  >
  get copyWith =>
      __$$ResultShipmentDetailsScreenStateImplCopyWithImpl<
        _$ResultShipmentDetailsScreenStateImpl
      >(this, _$identity);
}

abstract class _ResultShipmentDetailsScreenState
    implements ResultShipmentDetailsScreenState {
  const factory _ResultShipmentDetailsScreenState({
    required final Shipment shipment,
    final List<LabResult> results,
    final ShipmentRoute? route,
    final Approval? pickupApproval,
    final Approval? deliveryApproval,
    final bool isLoading,
  }) = _$ResultShipmentDetailsScreenStateImpl;

  @override
  Shipment get shipment;
  @override
  List<LabResult> get results;
  @override
  ShipmentRoute? get route;
  @override
  Approval? get pickupApproval;
  @override
  Approval? get deliveryApproval;
  @override
  bool get isLoading;

  /// Create a copy of ResultShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultShipmentDetailsScreenStateImplCopyWith<
    _$ResultShipmentDetailsScreenStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
