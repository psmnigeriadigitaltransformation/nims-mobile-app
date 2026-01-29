// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_manifests_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SelectManifestsScreenState {
  List<Facility> get facilities => throw _privateConstructorUsedError;
  MovementType? get movementType => throw _privateConstructorUsedError;
  Facility? get selectedPickUpFacility =>
      throw _privateConstructorUsedError; // @Default([]) List<DomainManifest> manifest,
  List<int> get selectedManifestIndices => throw _privateConstructorUsedError;
  bool get isFetchingManifests => throw _privateConstructorUsedError;
  Alert get alert => throw _privateConstructorUsedError;
  List<Manifest> get manifests => throw _privateConstructorUsedError;

  /// Map of manifest_no to stage for manifests already in shipments
  Map<String, String> get shippedManifestStatuses =>
      throw _privateConstructorUsedError;

  /// Create a copy of SelectManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectManifestsScreenStateCopyWith<SelectManifestsScreenState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectManifestsScreenStateCopyWith<$Res> {
  factory $SelectManifestsScreenStateCopyWith(
    SelectManifestsScreenState value,
    $Res Function(SelectManifestsScreenState) then,
  ) =
      _$SelectManifestsScreenStateCopyWithImpl<
        $Res,
        SelectManifestsScreenState
      >;
  @useResult
  $Res call({
    List<Facility> facilities,
    MovementType? movementType,
    Facility? selectedPickUpFacility,
    List<int> selectedManifestIndices,
    bool isFetchingManifests,
    Alert alert,
    List<Manifest> manifests,
    Map<String, String> shippedManifestStatuses,
  });

  $MovementTypeCopyWith<$Res>? get movementType;
  $FacilityCopyWith<$Res>? get selectedPickUpFacility;
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class _$SelectManifestsScreenStateCopyWithImpl<
  $Res,
  $Val extends SelectManifestsScreenState
>
    implements $SelectManifestsScreenStateCopyWith<$Res> {
  _$SelectManifestsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? movementType = freezed,
    Object? selectedPickUpFacility = freezed,
    Object? selectedManifestIndices = null,
    Object? isFetchingManifests = null,
    Object? alert = null,
    Object? manifests = null,
    Object? shippedManifestStatuses = null,
  }) {
    return _then(
      _value.copyWith(
            facilities: null == facilities
                ? _value.facilities
                : facilities // ignore: cast_nullable_to_non_nullable
                      as List<Facility>,
            movementType: freezed == movementType
                ? _value.movementType
                : movementType // ignore: cast_nullable_to_non_nullable
                      as MovementType?,
            selectedPickUpFacility: freezed == selectedPickUpFacility
                ? _value.selectedPickUpFacility
                : selectedPickUpFacility // ignore: cast_nullable_to_non_nullable
                      as Facility?,
            selectedManifestIndices: null == selectedManifestIndices
                ? _value.selectedManifestIndices
                : selectedManifestIndices // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            isFetchingManifests: null == isFetchingManifests
                ? _value.isFetchingManifests
                : isFetchingManifests // ignore: cast_nullable_to_non_nullable
                      as bool,
            alert: null == alert
                ? _value.alert
                : alert // ignore: cast_nullable_to_non_nullable
                      as Alert,
            manifests: null == manifests
                ? _value.manifests
                : manifests // ignore: cast_nullable_to_non_nullable
                      as List<Manifest>,
            shippedManifestStatuses: null == shippedManifestStatuses
                ? _value.shippedManifestStatuses
                : shippedManifestStatuses // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
          )
          as $Val,
    );
  }

  /// Create a copy of SelectManifestsScreenState
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

  /// Create a copy of SelectManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get selectedPickUpFacility {
    if (_value.selectedPickUpFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.selectedPickUpFacility!, (value) {
      return _then(_value.copyWith(selectedPickUpFacility: value) as $Val);
    });
  }

  /// Create a copy of SelectManifestsScreenState
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
abstract class _$$SelectManifestsScreenStateImplCopyWith<$Res>
    implements $SelectManifestsScreenStateCopyWith<$Res> {
  factory _$$SelectManifestsScreenStateImplCopyWith(
    _$SelectManifestsScreenStateImpl value,
    $Res Function(_$SelectManifestsScreenStateImpl) then,
  ) = __$$SelectManifestsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Facility> facilities,
    MovementType? movementType,
    Facility? selectedPickUpFacility,
    List<int> selectedManifestIndices,
    bool isFetchingManifests,
    Alert alert,
    List<Manifest> manifests,
    Map<String, String> shippedManifestStatuses,
  });

  @override
  $MovementTypeCopyWith<$Res>? get movementType;
  @override
  $FacilityCopyWith<$Res>? get selectedPickUpFacility;
  @override
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class __$$SelectManifestsScreenStateImplCopyWithImpl<$Res>
    extends
        _$SelectManifestsScreenStateCopyWithImpl<
          $Res,
          _$SelectManifestsScreenStateImpl
        >
    implements _$$SelectManifestsScreenStateImplCopyWith<$Res> {
  __$$SelectManifestsScreenStateImplCopyWithImpl(
    _$SelectManifestsScreenStateImpl _value,
    $Res Function(_$SelectManifestsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SelectManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? movementType = freezed,
    Object? selectedPickUpFacility = freezed,
    Object? selectedManifestIndices = null,
    Object? isFetchingManifests = null,
    Object? alert = null,
    Object? manifests = null,
    Object? shippedManifestStatuses = null,
  }) {
    return _then(
      _$SelectManifestsScreenStateImpl(
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<Facility>,
        movementType: freezed == movementType
            ? _value.movementType
            : movementType // ignore: cast_nullable_to_non_nullable
                  as MovementType?,
        selectedPickUpFacility: freezed == selectedPickUpFacility
            ? _value.selectedPickUpFacility
            : selectedPickUpFacility // ignore: cast_nullable_to_non_nullable
                  as Facility?,
        selectedManifestIndices: null == selectedManifestIndices
            ? _value._selectedManifestIndices
            : selectedManifestIndices // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        isFetchingManifests: null == isFetchingManifests
            ? _value.isFetchingManifests
            : isFetchingManifests // ignore: cast_nullable_to_non_nullable
                  as bool,
        alert: null == alert
            ? _value.alert
            : alert // ignore: cast_nullable_to_non_nullable
                  as Alert,
        manifests: null == manifests
            ? _value._manifests
            : manifests // ignore: cast_nullable_to_non_nullable
                  as List<Manifest>,
        shippedManifestStatuses: null == shippedManifestStatuses
            ? _value._shippedManifestStatuses
            : shippedManifestStatuses // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
      ),
    );
  }
}

/// @nodoc

class _$SelectManifestsScreenStateImpl extends _SelectManifestsScreenState {
  const _$SelectManifestsScreenStateImpl({
    final List<Facility> facilities = const [],
    this.movementType,
    this.selectedPickUpFacility,
    final List<int> selectedManifestIndices = const [],
    this.isFetchingManifests = false,
    this.alert = const Alert(show: false, message: ""),
    final List<Manifest> manifests = const [],
    final Map<String, String> shippedManifestStatuses = const {},
  }) : _facilities = facilities,
       _selectedManifestIndices = selectedManifestIndices,
       _manifests = manifests,
       _shippedManifestStatuses = shippedManifestStatuses,
       super._();

  final List<Facility> _facilities;
  @override
  @JsonKey()
  List<Facility> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  @override
  final MovementType? movementType;
  @override
  final Facility? selectedPickUpFacility;
  // @Default([]) List<DomainManifest> manifest,
  final List<int> _selectedManifestIndices;
  // @Default([]) List<DomainManifest> manifest,
  @override
  @JsonKey()
  List<int> get selectedManifestIndices {
    if (_selectedManifestIndices is EqualUnmodifiableListView)
      return _selectedManifestIndices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedManifestIndices);
  }

  @override
  @JsonKey()
  final bool isFetchingManifests;
  @override
  @JsonKey()
  final Alert alert;
  final List<Manifest> _manifests;
  @override
  @JsonKey()
  List<Manifest> get manifests {
    if (_manifests is EqualUnmodifiableListView) return _manifests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manifests);
  }

  /// Map of manifest_no to stage for manifests already in shipments
  final Map<String, String> _shippedManifestStatuses;

  /// Map of manifest_no to stage for manifests already in shipments
  @override
  @JsonKey()
  Map<String, String> get shippedManifestStatuses {
    if (_shippedManifestStatuses is EqualUnmodifiableMapView)
      return _shippedManifestStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_shippedManifestStatuses);
  }

  @override
  String toString() {
    return 'SelectManifestsScreenState(facilities: $facilities, movementType: $movementType, selectedPickUpFacility: $selectedPickUpFacility, selectedManifestIndices: $selectedManifestIndices, isFetchingManifests: $isFetchingManifests, alert: $alert, manifests: $manifests, shippedManifestStatuses: $shippedManifestStatuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectManifestsScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._facilities,
              _facilities,
            ) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(other.selectedPickUpFacility, selectedPickUpFacility) ||
                other.selectedPickUpFacility == selectedPickUpFacility) &&
            const DeepCollectionEquality().equals(
              other._selectedManifestIndices,
              _selectedManifestIndices,
            ) &&
            (identical(other.isFetchingManifests, isFetchingManifests) ||
                other.isFetchingManifests == isFetchingManifests) &&
            (identical(other.alert, alert) || other.alert == alert) &&
            const DeepCollectionEquality().equals(
              other._manifests,
              _manifests,
            ) &&
            const DeepCollectionEquality().equals(
              other._shippedManifestStatuses,
              _shippedManifestStatuses,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_facilities),
    movementType,
    selectedPickUpFacility,
    const DeepCollectionEquality().hash(_selectedManifestIndices),
    isFetchingManifests,
    alert,
    const DeepCollectionEquality().hash(_manifests),
    const DeepCollectionEquality().hash(_shippedManifestStatuses),
  );

  /// Create a copy of SelectManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectManifestsScreenStateImplCopyWith<_$SelectManifestsScreenStateImpl>
  get copyWith =>
      __$$SelectManifestsScreenStateImplCopyWithImpl<
        _$SelectManifestsScreenStateImpl
      >(this, _$identity);
}

abstract class _SelectManifestsScreenState extends SelectManifestsScreenState {
  const factory _SelectManifestsScreenState({
    final List<Facility> facilities,
    final MovementType? movementType,
    final Facility? selectedPickUpFacility,
    final List<int> selectedManifestIndices,
    final bool isFetchingManifests,
    final Alert alert,
    final List<Manifest> manifests,
    final Map<String, String> shippedManifestStatuses,
  }) = _$SelectManifestsScreenStateImpl;
  const _SelectManifestsScreenState._() : super._();

  @override
  List<Facility> get facilities;
  @override
  MovementType? get movementType;
  @override
  Facility? get selectedPickUpFacility; // @Default([]) List<DomainManifest> manifest,
  @override
  List<int> get selectedManifestIndices;
  @override
  bool get isFetchingManifests;
  @override
  Alert get alert;
  @override
  List<Manifest> get manifests;

  /// Map of manifest_no to stage for manifests already in shipments
  @override
  Map<String, String> get shippedManifestStatuses;

  /// Create a copy of SelectManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectManifestsScreenStateImplCopyWith<_$SelectManifestsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
