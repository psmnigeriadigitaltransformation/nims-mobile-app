// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specimen_shipments_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SpecimenShipmentScreenState {
  List<Facility> get facilities => throw _privateConstructorUsedError;
  List<Location> get locations => throw _privateConstructorUsedError;
  MovementType? get movementType => throw _privateConstructorUsedError;
  List<Shipment> get shipments => throw _privateConstructorUsedError;
  Facility? get selectedDestinationFacility =>
      throw _privateConstructorUsedError;
  List<ETokenData> get usedETokens => throw _privateConstructorUsedError;
  Lsp? get lsp => throw _privateConstructorUsedError;

  /// Maps facilityId to all its types (for auto-detection when facility has multiple types)
  Map<int, List<String>> get facilityTypesMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of SpecimenShipmentScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecimenShipmentScreenStateCopyWith<SpecimenShipmentScreenState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecimenShipmentScreenStateCopyWith<$Res> {
  factory $SpecimenShipmentScreenStateCopyWith(
    SpecimenShipmentScreenState value,
    $Res Function(SpecimenShipmentScreenState) then,
  ) =
      _$SpecimenShipmentScreenStateCopyWithImpl<
        $Res,
        SpecimenShipmentScreenState
      >;
  @useResult
  $Res call({
    List<Facility> facilities,
    List<Location> locations,
    MovementType? movementType,
    List<Shipment> shipments,
    Facility? selectedDestinationFacility,
    List<ETokenData> usedETokens,
    Lsp? lsp,
    Map<int, List<String>> facilityTypesMap,
  });

  $MovementTypeCopyWith<$Res>? get movementType;
  $FacilityCopyWith<$Res>? get selectedDestinationFacility;
  $LspCopyWith<$Res>? get lsp;
}

/// @nodoc
class _$SpecimenShipmentScreenStateCopyWithImpl<
  $Res,
  $Val extends SpecimenShipmentScreenState
>
    implements $SpecimenShipmentScreenStateCopyWith<$Res> {
  _$SpecimenShipmentScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecimenShipmentScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? locations = null,
    Object? movementType = freezed,
    Object? shipments = null,
    Object? selectedDestinationFacility = freezed,
    Object? usedETokens = null,
    Object? lsp = freezed,
    Object? facilityTypesMap = null,
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
            movementType: freezed == movementType
                ? _value.movementType
                : movementType // ignore: cast_nullable_to_non_nullable
                      as MovementType?,
            shipments: null == shipments
                ? _value.shipments
                : shipments // ignore: cast_nullable_to_non_nullable
                      as List<Shipment>,
            selectedDestinationFacility: freezed == selectedDestinationFacility
                ? _value.selectedDestinationFacility
                : selectedDestinationFacility // ignore: cast_nullable_to_non_nullable
                      as Facility?,
            usedETokens: null == usedETokens
                ? _value.usedETokens
                : usedETokens // ignore: cast_nullable_to_non_nullable
                      as List<ETokenData>,
            lsp: freezed == lsp
                ? _value.lsp
                : lsp // ignore: cast_nullable_to_non_nullable
                      as Lsp?,
            facilityTypesMap: null == facilityTypesMap
                ? _value.facilityTypesMap
                : facilityTypesMap // ignore: cast_nullable_to_non_nullable
                      as Map<int, List<String>>,
          )
          as $Val,
    );
  }

  /// Create a copy of SpecimenShipmentScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovementTypeCopyWith<$Res>? get movementType {
    if (_value.movementType == null) {
      return null;
    }

    return $MovementTypeCopyWith<$Res>(_value.movementType!, (value) {
      return _then(_value.copyWith(movementType: value) as $Val);
    });
  }

  /// Create a copy of SpecimenShipmentScreenState
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

  /// Create a copy of SpecimenShipmentScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LspCopyWith<$Res>? get lsp {
    if (_value.lsp == null) {
      return null;
    }

    return $LspCopyWith<$Res>(_value.lsp!, (value) {
      return _then(_value.copyWith(lsp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpecimenShipmentsScreenStateImplCopyWith<$Res>
    implements $SpecimenShipmentScreenStateCopyWith<$Res> {
  factory _$$SpecimenShipmentsScreenStateImplCopyWith(
    _$SpecimenShipmentsScreenStateImpl value,
    $Res Function(_$SpecimenShipmentsScreenStateImpl) then,
  ) = __$$SpecimenShipmentsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Facility> facilities,
    List<Location> locations,
    MovementType? movementType,
    List<Shipment> shipments,
    Facility? selectedDestinationFacility,
    List<ETokenData> usedETokens,
    Lsp? lsp,
    Map<int, List<String>> facilityTypesMap,
  });

  @override
  $MovementTypeCopyWith<$Res>? get movementType;
  @override
  $FacilityCopyWith<$Res>? get selectedDestinationFacility;
  @override
  $LspCopyWith<$Res>? get lsp;
}

/// @nodoc
class __$$SpecimenShipmentsScreenStateImplCopyWithImpl<$Res>
    extends
        _$SpecimenShipmentScreenStateCopyWithImpl<
          $Res,
          _$SpecimenShipmentsScreenStateImpl
        >
    implements _$$SpecimenShipmentsScreenStateImplCopyWith<$Res> {
  __$$SpecimenShipmentsScreenStateImplCopyWithImpl(
    _$SpecimenShipmentsScreenStateImpl _value,
    $Res Function(_$SpecimenShipmentsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecimenShipmentScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? locations = null,
    Object? movementType = freezed,
    Object? shipments = null,
    Object? selectedDestinationFacility = freezed,
    Object? usedETokens = null,
    Object? lsp = freezed,
    Object? facilityTypesMap = null,
  }) {
    return _then(
      _$SpecimenShipmentsScreenStateImpl(
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<Facility>,
        locations: null == locations
            ? _value._locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<Location>,
        movementType: freezed == movementType
            ? _value.movementType
            : movementType // ignore: cast_nullable_to_non_nullable
                  as MovementType?,
        shipments: null == shipments
            ? _value._shipments
            : shipments // ignore: cast_nullable_to_non_nullable
                  as List<Shipment>,
        selectedDestinationFacility: freezed == selectedDestinationFacility
            ? _value.selectedDestinationFacility
            : selectedDestinationFacility // ignore: cast_nullable_to_non_nullable
                  as Facility?,
        usedETokens: null == usedETokens
            ? _value._usedETokens
            : usedETokens // ignore: cast_nullable_to_non_nullable
                  as List<ETokenData>,
        lsp: freezed == lsp
            ? _value.lsp
            : lsp // ignore: cast_nullable_to_non_nullable
                  as Lsp?,
        facilityTypesMap: null == facilityTypesMap
            ? _value._facilityTypesMap
            : facilityTypesMap // ignore: cast_nullable_to_non_nullable
                  as Map<int, List<String>>,
      ),
    );
  }
}

/// @nodoc

class _$SpecimenShipmentsScreenStateImpl extends _SpecimenShipmentsScreenState {
  const _$SpecimenShipmentsScreenStateImpl({
    required final List<Facility> facilities,
    required final List<Location> locations,
    this.movementType,
    final List<Shipment> shipments = const [],
    this.selectedDestinationFacility,
    final List<ETokenData> usedETokens = const [],
    this.lsp,
    final Map<int, List<String>> facilityTypesMap = const {},
  }) : _facilities = facilities,
       _locations = locations,
       _shipments = shipments,
       _usedETokens = usedETokens,
       _facilityTypesMap = facilityTypesMap,
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
  final MovementType? movementType;
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
  final List<ETokenData> _usedETokens;
  @override
  @JsonKey()
  List<ETokenData> get usedETokens {
    if (_usedETokens is EqualUnmodifiableListView) return _usedETokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedETokens);
  }

  @override
  final Lsp? lsp;

  /// Maps facilityId to all its types (for auto-detection when facility has multiple types)
  final Map<int, List<String>> _facilityTypesMap;

  /// Maps facilityId to all its types (for auto-detection when facility has multiple types)
  @override
  @JsonKey()
  Map<int, List<String>> get facilityTypesMap {
    if (_facilityTypesMap is EqualUnmodifiableMapView) return _facilityTypesMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_facilityTypesMap);
  }

  @override
  String toString() {
    return 'SpecimenShipmentScreenState(facilities: $facilities, locations: $locations, movementType: $movementType, shipments: $shipments, selectedDestinationFacility: $selectedDestinationFacility, usedETokens: $usedETokens, lsp: $lsp, facilityTypesMap: $facilityTypesMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecimenShipmentsScreenStateImpl &&
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
                    selectedDestinationFacility) &&
            const DeepCollectionEquality().equals(
              other._usedETokens,
              _usedETokens,
            ) &&
            (identical(other.lsp, lsp) || other.lsp == lsp) &&
            const DeepCollectionEquality().equals(
              other._facilityTypesMap,
              _facilityTypesMap,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_facilities),
    const DeepCollectionEquality().hash(_locations),
    movementType,
    const DeepCollectionEquality().hash(_shipments),
    selectedDestinationFacility,
    const DeepCollectionEquality().hash(_usedETokens),
    lsp,
    const DeepCollectionEquality().hash(_facilityTypesMap),
  );

  /// Create a copy of SpecimenShipmentScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecimenShipmentsScreenStateImplCopyWith<
    _$SpecimenShipmentsScreenStateImpl
  >
  get copyWith =>
      __$$SpecimenShipmentsScreenStateImplCopyWithImpl<
        _$SpecimenShipmentsScreenStateImpl
      >(this, _$identity);
}

abstract class _SpecimenShipmentsScreenState
    extends SpecimenShipmentScreenState {
  const factory _SpecimenShipmentsScreenState({
    required final List<Facility> facilities,
    required final List<Location> locations,
    final MovementType? movementType,
    final List<Shipment> shipments,
    final Facility? selectedDestinationFacility,
    final List<ETokenData> usedETokens,
    final Lsp? lsp,
    final Map<int, List<String>> facilityTypesMap,
  }) = _$SpecimenShipmentsScreenStateImpl;
  const _SpecimenShipmentsScreenState._() : super._();

  @override
  List<Facility> get facilities;
  @override
  List<Location> get locations;
  @override
  MovementType? get movementType;
  @override
  List<Shipment> get shipments;
  @override
  Facility? get selectedDestinationFacility;
  @override
  List<ETokenData> get usedETokens;
  @override
  Lsp? get lsp;

  /// Maps facilityId to all its types (for auto-detection when facility has multiple types)
  @override
  Map<int, List<String>> get facilityTypesMap;

  /// Create a copy of SpecimenShipmentScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecimenShipmentsScreenStateImplCopyWith<
    _$SpecimenShipmentsScreenStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
