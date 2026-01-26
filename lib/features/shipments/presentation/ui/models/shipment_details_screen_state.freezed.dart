// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_details_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShipmentDetailsScreenState {
  Shipment get shipment => throw _privateConstructorUsedError;
  List<Sample> get samples => throw _privateConstructorUsedError;
  ShipmentRoute? get route => throw _privateConstructorUsedError;
  Approval? get pickupApproval => throw _privateConstructorUsedError;
  Approval? get deliveryApproval => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentDetailsScreenStateCopyWith<ShipmentDetailsScreenState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentDetailsScreenStateCopyWith<$Res> {
  factory $ShipmentDetailsScreenStateCopyWith(
    ShipmentDetailsScreenState value,
    $Res Function(ShipmentDetailsScreenState) then,
  ) =
      _$ShipmentDetailsScreenStateCopyWithImpl<
        $Res,
        ShipmentDetailsScreenState
      >;
  @useResult
  $Res call({
    Shipment shipment,
    List<Sample> samples,
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
class _$ShipmentDetailsScreenStateCopyWithImpl<
  $Res,
  $Val extends ShipmentDetailsScreenState
>
    implements $ShipmentDetailsScreenStateCopyWith<$Res> {
  _$ShipmentDetailsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipment = null,
    Object? samples = null,
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
            samples: null == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<Sample>,
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

  /// Create a copy of ShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipmentCopyWith<$Res> get shipment {
    return $ShipmentCopyWith<$Res>(_value.shipment, (value) {
      return _then(_value.copyWith(shipment: value) as $Val);
    });
  }

  /// Create a copy of ShipmentDetailsScreenState
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

  /// Create a copy of ShipmentDetailsScreenState
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

  /// Create a copy of ShipmentDetailsScreenState
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
abstract class _$$ShipmentDetailsScreenStateImplCopyWith<$Res>
    implements $ShipmentDetailsScreenStateCopyWith<$Res> {
  factory _$$ShipmentDetailsScreenStateImplCopyWith(
    _$ShipmentDetailsScreenStateImpl value,
    $Res Function(_$ShipmentDetailsScreenStateImpl) then,
  ) = __$$ShipmentDetailsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Shipment shipment,
    List<Sample> samples,
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
class __$$ShipmentDetailsScreenStateImplCopyWithImpl<$Res>
    extends
        _$ShipmentDetailsScreenStateCopyWithImpl<
          $Res,
          _$ShipmentDetailsScreenStateImpl
        >
    implements _$$ShipmentDetailsScreenStateImplCopyWith<$Res> {
  __$$ShipmentDetailsScreenStateImplCopyWithImpl(
    _$ShipmentDetailsScreenStateImpl _value,
    $Res Function(_$ShipmentDetailsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipment = null,
    Object? samples = null,
    Object? route = freezed,
    Object? pickupApproval = freezed,
    Object? deliveryApproval = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$ShipmentDetailsScreenStateImpl(
        shipment: null == shipment
            ? _value.shipment
            : shipment // ignore: cast_nullable_to_non_nullable
                  as Shipment,
        samples: null == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<Sample>,
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

class _$ShipmentDetailsScreenStateImpl implements _ShipmentDetailsScreenState {
  const _$ShipmentDetailsScreenStateImpl({
    required this.shipment,
    final List<Sample> samples = const [],
    this.route,
    this.pickupApproval,
    this.deliveryApproval,
    this.isLoading = true,
  }) : _samples = samples;

  @override
  final Shipment shipment;
  final List<Sample> _samples;
  @override
  @JsonKey()
  List<Sample> get samples {
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_samples);
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
    return 'ShipmentDetailsScreenState(shipment: $shipment, samples: $samples, route: $route, pickupApproval: $pickupApproval, deliveryApproval: $deliveryApproval, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentDetailsScreenStateImpl &&
            (identical(other.shipment, shipment) ||
                other.shipment == shipment) &&
            const DeepCollectionEquality().equals(other._samples, _samples) &&
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
    const DeepCollectionEquality().hash(_samples),
    route,
    pickupApproval,
    deliveryApproval,
    isLoading,
  );

  /// Create a copy of ShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentDetailsScreenStateImplCopyWith<_$ShipmentDetailsScreenStateImpl>
  get copyWith =>
      __$$ShipmentDetailsScreenStateImplCopyWithImpl<
        _$ShipmentDetailsScreenStateImpl
      >(this, _$identity);
}

abstract class _ShipmentDetailsScreenState
    implements ShipmentDetailsScreenState {
  const factory _ShipmentDetailsScreenState({
    required final Shipment shipment,
    final List<Sample> samples,
    final ShipmentRoute? route,
    final Approval? pickupApproval,
    final Approval? deliveryApproval,
    final bool isLoading,
  }) = _$ShipmentDetailsScreenStateImpl;

  @override
  Shipment get shipment;
  @override
  List<Sample> get samples;
  @override
  ShipmentRoute? get route;
  @override
  Approval? get pickupApproval;
  @override
  Approval? get deliveryApproval;
  @override
  bool get isLoading;

  /// Create a copy of ShipmentDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentDetailsScreenStateImplCopyWith<_$ShipmentDetailsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
