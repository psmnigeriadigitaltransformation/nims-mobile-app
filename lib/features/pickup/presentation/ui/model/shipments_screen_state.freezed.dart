// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipments_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShipmentsScreenState {
  List<Facility> get facilities => throw _privateConstructorUsedError;
  List<Location> get locations => throw _privateConstructorUsedError;
  MovementType get movementType => throw _privateConstructorUsedError;
  List<Shipment> get shipments => throw _privateConstructorUsedError;
  Facility? get selectedDestinationFacility =>
      throw _privateConstructorUsedError;

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentsScreenStateCopyWith<ShipmentsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentsScreenStateCopyWith<$Res> {
  factory $ShipmentsScreenStateCopyWith(
    ShipmentsScreenState value,
    $Res Function(ShipmentsScreenState) then,
  ) = _$ShipmentsScreenStateCopyWithImpl<$Res, ShipmentsScreenState>;
  @useResult
  $Res call({
    List<Facility> facilities,
    List<Location> locations,
    MovementType movementType,
    List<Shipment> shipments,
    Facility? selectedDestinationFacility,
  });

  $MovementTypeCopyWith<$Res> get movementType;
  $FacilityCopyWith<$Res>? get selectedDestinationFacility;
}

/// @nodoc
class _$ShipmentsScreenStateCopyWithImpl<
  $Res,
  $Val extends ShipmentsScreenState
>
    implements $ShipmentsScreenStateCopyWith<$Res> {
  _$ShipmentsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? locations = null,
    Object? movementType = null,
    Object? shipments = null,
    Object? selectedDestinationFacility = freezed,
  }) {
    return _then(
      _value.copyWith(
            facilities: null == facilities
                ? _value.facilities
                : facilities // ignore: cast_nullable_to_non_nullable
                      as List<Facility>,
            locations: null == locations
                ? _value.locations
                : locations // ignore: cast_nullable_to_non_nullable
                      as List<Location>,
            movementType: null == movementType
                ? _value.movementType
                : movementType // ignore: cast_nullable_to_non_nullable
                      as MovementType,
            shipments: null == shipments
                ? _value.shipments
                : shipments // ignore: cast_nullable_to_non_nullable
                      as List<Shipment>,
            selectedDestinationFacility: freezed == selectedDestinationFacility
                ? _value.selectedDestinationFacility
                : selectedDestinationFacility // ignore: cast_nullable_to_non_nullable
                      as Facility?,
          )
          as $Val,
    );
  }

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovementTypeCopyWith<$Res> get movementType {
    return $MovementTypeCopyWith<$Res>(_value.movementType, (value) {
      return _then(_value.copyWith(movementType: value) as $Val);
    });
  }

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get selectedDestinationFacility {
    if (_value.selectedDestinationFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.selectedDestinationFacility!, (
      value,
    ) {
      return _then(_value.copyWith(selectedDestinationFacility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShipmentsScreenStateImplCopyWith<$Res>
    implements $ShipmentsScreenStateCopyWith<$Res> {
  factory _$$ShipmentsScreenStateImplCopyWith(
    _$ShipmentsScreenStateImpl value,
    $Res Function(_$ShipmentsScreenStateImpl) then,
  ) = __$$ShipmentsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Facility> facilities,
    List<Location> locations,
    MovementType movementType,
    List<Shipment> shipments,
    Facility? selectedDestinationFacility,
  });

  @override
  $MovementTypeCopyWith<$Res> get movementType;
  @override
  $FacilityCopyWith<$Res>? get selectedDestinationFacility;
}

/// @nodoc
class __$$ShipmentsScreenStateImplCopyWithImpl<$Res>
    extends _$ShipmentsScreenStateCopyWithImpl<$Res, _$ShipmentsScreenStateImpl>
    implements _$$ShipmentsScreenStateImplCopyWith<$Res> {
  __$$ShipmentsScreenStateImplCopyWithImpl(
    _$ShipmentsScreenStateImpl _value,
    $Res Function(_$ShipmentsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? locations = null,
    Object? movementType = null,
    Object? shipments = null,
    Object? selectedDestinationFacility = freezed,
  }) {
    return _then(
      _$ShipmentsScreenStateImpl(
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<Facility>,
        locations: null == locations
            ? _value._locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<Location>,
        movementType: null == movementType
            ? _value.movementType
            : movementType // ignore: cast_nullable_to_non_nullable
                  as MovementType,
        shipments: null == shipments
            ? _value._shipments
            : shipments // ignore: cast_nullable_to_non_nullable
                  as List<Shipment>,
        selectedDestinationFacility: freezed == selectedDestinationFacility
            ? _value.selectedDestinationFacility
            : selectedDestinationFacility // ignore: cast_nullable_to_non_nullable
                  as Facility?,
      ),
    );
  }
}

/// @nodoc

class _$ShipmentsScreenStateImpl extends _ShipmentsScreenState {
  const _$ShipmentsScreenStateImpl({
    required final List<Facility> facilities,
    required final List<Location> locations,
    required this.movementType,
    final List<Shipment> shipments = const [],
    this.selectedDestinationFacility,
  }) : _facilities = facilities,
       _locations = locations,
       _shipments = shipments,
       super._();

  final List<Facility> _facilities;
  @override
  List<Facility> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  final List<Location> _locations;
  @override
  List<Location> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  final MovementType movementType;
  final List<Shipment> _shipments;
  @override
  @JsonKey()
  List<Shipment> get shipments {
    if (_shipments is EqualUnmodifiableListView) return _shipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipments);
  }

  @override
  final Facility? selectedDestinationFacility;

  @override
  String toString() {
    return 'ShipmentsScreenState(facilities: $facilities, locations: $locations, movementType: $movementType, shipments: $shipments, selectedDestinationFacility: $selectedDestinationFacility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._facilities,
              _facilities,
            ) &&
            const DeepCollectionEquality().equals(
              other._locations,
              _locations,
            ) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            const DeepCollectionEquality().equals(
              other._shipments,
              _shipments,
            ) &&
            (identical(
                  other.selectedDestinationFacility,
                  selectedDestinationFacility,
                ) ||
                other.selectedDestinationFacility ==
                    selectedDestinationFacility));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_facilities),
    const DeepCollectionEquality().hash(_locations),
    movementType,
    const DeepCollectionEquality().hash(_shipments),
    selectedDestinationFacility,
  );

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentsScreenStateImplCopyWith<_$ShipmentsScreenStateImpl>
  get copyWith =>
      __$$ShipmentsScreenStateImplCopyWithImpl<_$ShipmentsScreenStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ShipmentsScreenState extends ShipmentsScreenState {
  const factory _ShipmentsScreenState({
    required final List<Facility> facilities,
    required final List<Location> locations,
    required final MovementType movementType,
    final List<Shipment> shipments,
    final Facility? selectedDestinationFacility,
  }) = _$ShipmentsScreenStateImpl;
  const _ShipmentsScreenState._() : super._();

  @override
  List<Facility> get facilities;
  @override
  List<Location> get locations;
  @override
  MovementType get movementType;
  @override
  List<Shipment> get shipments;
  @override
  Facility? get selectedDestinationFacility;

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentsScreenStateImplCopyWith<_$ShipmentsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
