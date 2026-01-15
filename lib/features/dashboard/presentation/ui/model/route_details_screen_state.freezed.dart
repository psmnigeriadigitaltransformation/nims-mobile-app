// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_details_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RouteDetailsScreenState {
  ShipmentRoute get route => throw _privateConstructorUsedError;
  List<Shipment> get shipments => throw _privateConstructorUsedError;
  Approval? get pickupApproval => throw _privateConstructorUsedError;
  Approval? get deliveryApproval => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of RouteDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteDetailsScreenStateCopyWith<RouteDetailsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDetailsScreenStateCopyWith<$Res> {
  factory $RouteDetailsScreenStateCopyWith(
    RouteDetailsScreenState value,
    $Res Function(RouteDetailsScreenState) then,
  ) = _$RouteDetailsScreenStateCopyWithImpl<$Res, RouteDetailsScreenState>;
  @useResult
  $Res call({
    ShipmentRoute route,
    List<Shipment> shipments,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    bool isLoading,
  });

  $ShipmentRouteCopyWith<$Res> get route;
  $ApprovalCopyWith<$Res>? get pickupApproval;
  $ApprovalCopyWith<$Res>? get deliveryApproval;
}

/// @nodoc
class _$RouteDetailsScreenStateCopyWithImpl<
  $Res,
  $Val extends RouteDetailsScreenState
>
    implements $RouteDetailsScreenStateCopyWith<$Res> {
  _$RouteDetailsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? shipments = null,
    Object? pickupApproval = freezed,
    Object? deliveryApproval = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            route: null == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as ShipmentRoute,
            shipments: null == shipments
                ? _value.shipments
                : shipments // ignore: cast_nullable_to_non_nullable
                      as List<Shipment>,
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

  /// Create a copy of RouteDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipmentRouteCopyWith<$Res> get route {
    return $ShipmentRouteCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }

  /// Create a copy of RouteDetailsScreenState
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

  /// Create a copy of RouteDetailsScreenState
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
abstract class _$$RouteDetailsScreenStateImplCopyWith<$Res>
    implements $RouteDetailsScreenStateCopyWith<$Res> {
  factory _$$RouteDetailsScreenStateImplCopyWith(
    _$RouteDetailsScreenStateImpl value,
    $Res Function(_$RouteDetailsScreenStateImpl) then,
  ) = __$$RouteDetailsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ShipmentRoute route,
    List<Shipment> shipments,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    bool isLoading,
  });

  @override
  $ShipmentRouteCopyWith<$Res> get route;
  @override
  $ApprovalCopyWith<$Res>? get pickupApproval;
  @override
  $ApprovalCopyWith<$Res>? get deliveryApproval;
}

/// @nodoc
class __$$RouteDetailsScreenStateImplCopyWithImpl<$Res>
    extends
        _$RouteDetailsScreenStateCopyWithImpl<
          $Res,
          _$RouteDetailsScreenStateImpl
        >
    implements _$$RouteDetailsScreenStateImplCopyWith<$Res> {
  __$$RouteDetailsScreenStateImplCopyWithImpl(
    _$RouteDetailsScreenStateImpl _value,
    $Res Function(_$RouteDetailsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? shipments = null,
    Object? pickupApproval = freezed,
    Object? deliveryApproval = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$RouteDetailsScreenStateImpl(
        route: null == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as ShipmentRoute,
        shipments: null == shipments
            ? _value._shipments
            : shipments // ignore: cast_nullable_to_non_nullable
                  as List<Shipment>,
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

class _$RouteDetailsScreenStateImpl implements _RouteDetailsScreenState {
  const _$RouteDetailsScreenStateImpl({
    required this.route,
    final List<Shipment> shipments = const [],
    this.pickupApproval,
    this.deliveryApproval,
    this.isLoading = true,
  }) : _shipments = shipments;

  @override
  final ShipmentRoute route;
  final List<Shipment> _shipments;
  @override
  @JsonKey()
  List<Shipment> get shipments {
    if (_shipments is EqualUnmodifiableListView) return _shipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipments);
  }

  @override
  final Approval? pickupApproval;
  @override
  final Approval? deliveryApproval;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'RouteDetailsScreenState(route: $route, shipments: $shipments, pickupApproval: $pickupApproval, deliveryApproval: $deliveryApproval, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDetailsScreenStateImpl &&
            (identical(other.route, route) || other.route == route) &&
            const DeepCollectionEquality().equals(
              other._shipments,
              _shipments,
            ) &&
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
    route,
    const DeepCollectionEquality().hash(_shipments),
    pickupApproval,
    deliveryApproval,
    isLoading,
  );

  /// Create a copy of RouteDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDetailsScreenStateImplCopyWith<_$RouteDetailsScreenStateImpl>
  get copyWith =>
      __$$RouteDetailsScreenStateImplCopyWithImpl<
        _$RouteDetailsScreenStateImpl
      >(this, _$identity);
}

abstract class _RouteDetailsScreenState implements RouteDetailsScreenState {
  const factory _RouteDetailsScreenState({
    required final ShipmentRoute route,
    final List<Shipment> shipments,
    final Approval? pickupApproval,
    final Approval? deliveryApproval,
    final bool isLoading,
  }) = _$RouteDetailsScreenStateImpl;

  @override
  ShipmentRoute get route;
  @override
  List<Shipment> get shipments;
  @override
  Approval? get pickupApproval;
  @override
  Approval? get deliveryApproval;
  @override
  bool get isLoading;

  /// Create a copy of RouteDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteDetailsScreenStateImplCopyWith<_$RouteDetailsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
