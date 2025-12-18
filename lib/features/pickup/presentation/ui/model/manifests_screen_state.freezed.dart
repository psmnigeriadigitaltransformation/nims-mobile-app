// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manifests_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ManifestsScreenState {
  List<Facility> get facilities => throw _privateConstructorUsedError;
  MovementType? get movementType => throw _privateConstructorUsedError;
  Facility? get selectedPickUpFacility =>
      throw _privateConstructorUsedError; // @Default([]) List<DomainManifest> manifests,
  List<int> get selectedManifestIndices => throw _privateConstructorUsedError;
  bool get isFetchingManifests => throw _privateConstructorUsedError;
  Alert get alert => throw _privateConstructorUsedError;
  List<Manifest> get manifests => throw _privateConstructorUsedError;

  /// Create a copy of ManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestsScreenStateCopyWith<ManifestsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestsScreenStateCopyWith<$Res> {
  factory $ManifestsScreenStateCopyWith(
    ManifestsScreenState value,
    $Res Function(ManifestsScreenState) then,
  ) = _$ManifestsScreenStateCopyWithImpl<$Res, ManifestsScreenState>;
  @useResult
  $Res call({
    List<Facility> facilities,
    MovementType? movementType,
    Facility? selectedPickUpFacility,
    List<int> selectedManifestIndices,
    bool isFetchingManifests,
    Alert alert,
    List<Manifest> manifests,
  });

  $MovementTypeCopyWith<$Res>? get movementType;
  $FacilityCopyWith<$Res>? get selectedPickUpFacility;
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class _$ManifestsScreenStateCopyWithImpl<
  $Res,
  $Val extends ManifestsScreenState
>
    implements $ManifestsScreenStateCopyWith<$Res> {
  _$ManifestsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestsScreenState
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
          )
          as $Val,
    );
  }

  /// Create a copy of ManifestsScreenState
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

  /// Create a copy of ManifestsScreenState
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

  /// Create a copy of ManifestsScreenState
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
abstract class _$$ManifestsScreenStateImplCopyWith<$Res>
    implements $ManifestsScreenStateCopyWith<$Res> {
  factory _$$ManifestsScreenStateImplCopyWith(
    _$ManifestsScreenStateImpl value,
    $Res Function(_$ManifestsScreenStateImpl) then,
  ) = __$$ManifestsScreenStateImplCopyWithImpl<$Res>;
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
  });

  @override
  $MovementTypeCopyWith<$Res>? get movementType;
  @override
  $FacilityCopyWith<$Res>? get selectedPickUpFacility;
  @override
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class __$$ManifestsScreenStateImplCopyWithImpl<$Res>
    extends _$ManifestsScreenStateCopyWithImpl<$Res, _$ManifestsScreenStateImpl>
    implements _$$ManifestsScreenStateImplCopyWith<$Res> {
  __$$ManifestsScreenStateImplCopyWithImpl(
    _$ManifestsScreenStateImpl _value,
    $Res Function(_$ManifestsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestsScreenState
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
  }) {
    return _then(
      _$ManifestsScreenStateImpl(
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
      ),
    );
  }
}

/// @nodoc

class _$ManifestsScreenStateImpl extends _ManifestsScreenState {
  const _$ManifestsScreenStateImpl({
    final List<Facility> facilities = const [],
    this.movementType,
    this.selectedPickUpFacility,
    final List<int> selectedManifestIndices = const [],
    this.isFetchingManifests = false,
    this.alert = const Alert(show: false, message: ""),
    final List<Manifest> manifests = const [],
  }) : _facilities = facilities,
       _selectedManifestIndices = selectedManifestIndices,
       _manifests = manifests,
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
  // @Default([]) List<DomainManifest> manifests,
  final List<int> _selectedManifestIndices;
  // @Default([]) List<DomainManifest> manifests,
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

  @override
  String toString() {
    return 'ManifestsScreenState(facilities: $facilities, movementType: $movementType, selectedPickUpFacility: $selectedPickUpFacility, selectedManifestIndices: $selectedManifestIndices, isFetchingManifests: $isFetchingManifests, alert: $alert, manifests: $manifests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestsScreenStateImpl &&
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
  );

  /// Create a copy of ManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestsScreenStateImplCopyWith<_$ManifestsScreenStateImpl>
  get copyWith =>
      __$$ManifestsScreenStateImplCopyWithImpl<_$ManifestsScreenStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ManifestsScreenState extends ManifestsScreenState {
  const factory _ManifestsScreenState({
    final List<Facility> facilities,
    final MovementType? movementType,
    final Facility? selectedPickUpFacility,
    final List<int> selectedManifestIndices,
    final bool isFetchingManifests,
    final Alert alert,
    final List<Manifest> manifests,
  }) = _$ManifestsScreenStateImpl;
  const _ManifestsScreenState._() : super._();

  @override
  List<Facility> get facilities;
  @override
  MovementType? get movementType;
  @override
  Facility? get selectedPickUpFacility; // @Default([]) List<DomainManifest> manifests,
  @override
  List<int> get selectedManifestIndices;
  @override
  bool get isFetchingManifests;
  @override
  Alert get alert;
  @override
  List<Manifest> get manifests;

  /// Create a copy of ManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestsScreenStateImplCopyWith<_$ManifestsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
