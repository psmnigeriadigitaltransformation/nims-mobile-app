// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_new_manifest_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddNewManifestScreenState {
  List<Facility> get facilities => throw _privateConstructorUsedError;
  List<SampleType> get sampleTypes => throw _privateConstructorUsedError;
  List<Sample> get samples => throw _privateConstructorUsedError;
  MovementType? get movementType => throw _privateConstructorUsedError;
  Facility? get selectedDestinationFacility =>
      throw _privateConstructorUsedError;
  Facility? get pickUpFacility => throw _privateConstructorUsedError;
  SampleType? get selectedSampleType => throw _privateConstructorUsedError;
  String get manifestNo => throw _privateConstructorUsedError;
  bool get isSavingManifest => throw _privateConstructorUsedError;
  Alert get alert => throw _privateConstructorUsedError;
  ETokenData? get usedEToken => throw _privateConstructorUsedError;
  Lsp? get lsp => throw _privateConstructorUsedError;

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddNewManifestScreenStateCopyWith<AddNewManifestScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNewManifestScreenStateCopyWith<$Res> {
  factory $AddNewManifestScreenStateCopyWith(
    AddNewManifestScreenState value,
    $Res Function(AddNewManifestScreenState) then,
  ) = _$AddNewManifestScreenStateCopyWithImpl<$Res, AddNewManifestScreenState>;
  @useResult
  $Res call({
    List<Facility> facilities,
    List<SampleType> sampleTypes,
    List<Sample> samples,
    MovementType? movementType,
    Facility? selectedDestinationFacility,
    Facility? pickUpFacility,
    SampleType? selectedSampleType,
    String manifestNo,
    bool isSavingManifest,
    Alert alert,
    ETokenData? usedEToken,
    Lsp? lsp,
  });

  $MovementTypeCopyWith<$Res>? get movementType;
  $FacilityCopyWith<$Res>? get selectedDestinationFacility;
  $FacilityCopyWith<$Res>? get pickUpFacility;
  $SampleTypeCopyWith<$Res>? get selectedSampleType;
  $AlertCopyWith<$Res> get alert;
  $ETokenDataCopyWith<$Res>? get usedEToken;
  $LspCopyWith<$Res>? get lsp;
}

/// @nodoc
class _$AddNewManifestScreenStateCopyWithImpl<
  $Res,
  $Val extends AddNewManifestScreenState
>
    implements $AddNewManifestScreenStateCopyWith<$Res> {
  _$AddNewManifestScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? sampleTypes = null,
    Object? samples = null,
    Object? movementType = freezed,
    Object? selectedDestinationFacility = freezed,
    Object? pickUpFacility = freezed,
    Object? selectedSampleType = freezed,
    Object? manifestNo = null,
    Object? isSavingManifest = null,
    Object? alert = null,
    Object? usedEToken = freezed,
    Object? lsp = freezed,
  }) {
    return _then(
      _value.copyWith(
            facilities: null == facilities
                ? _value.facilities
                : facilities // ignore: cast_nullable_to_non_nullable
                      as List<Facility>,
            sampleTypes: null == sampleTypes
                ? _value.sampleTypes
                : sampleTypes // ignore: cast_nullable_to_non_nullable
                      as List<SampleType>,
            samples: null == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<Sample>,
            movementType: freezed == movementType
                ? _value.movementType
                : movementType // ignore: cast_nullable_to_non_nullable
                      as MovementType?,
            selectedDestinationFacility: freezed == selectedDestinationFacility
                ? _value.selectedDestinationFacility
                : selectedDestinationFacility // ignore: cast_nullable_to_non_nullable
                      as Facility?,
            pickUpFacility: freezed == pickUpFacility
                ? _value.pickUpFacility
                : pickUpFacility // ignore: cast_nullable_to_non_nullable
                      as Facility?,
            selectedSampleType: freezed == selectedSampleType
                ? _value.selectedSampleType
                : selectedSampleType // ignore: cast_nullable_to_non_nullable
                      as SampleType?,
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            isSavingManifest: null == isSavingManifest
                ? _value.isSavingManifest
                : isSavingManifest // ignore: cast_nullable_to_non_nullable
                      as bool,
            alert: null == alert
                ? _value.alert
                : alert // ignore: cast_nullable_to_non_nullable
                      as Alert,
            usedEToken: freezed == usedEToken
                ? _value.usedEToken
                : usedEToken // ignore: cast_nullable_to_non_nullable
                      as ETokenData?,
            lsp: freezed == lsp
                ? _value.lsp
                : lsp // ignore: cast_nullable_to_non_nullable
                      as Lsp?,
          )
          as $Val,
    );
  }

  /// Create a copy of AddNewManifestScreenState
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

  /// Create a copy of AddNewManifestScreenState
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

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get pickUpFacility {
    if (_value.pickUpFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.pickUpFacility!, (value) {
      return _then(_value.copyWith(pickUpFacility: value) as $Val);
    });
  }

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SampleTypeCopyWith<$Res>? get selectedSampleType {
    if (_value.selectedSampleType == null) {
      return null;
    }

    return $SampleTypeCopyWith<$Res>(_value.selectedSampleType!, (value) {
      return _then(_value.copyWith(selectedSampleType: value) as $Val);
    });
  }

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlertCopyWith<$Res> get alert {
    return $AlertCopyWith<$Res>(_value.alert, (value) {
      return _then(_value.copyWith(alert: value) as $Val);
    });
  }

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ETokenDataCopyWith<$Res>? get usedEToken {
    if (_value.usedEToken == null) {
      return null;
    }

    return $ETokenDataCopyWith<$Res>(_value.usedEToken!, (value) {
      return _then(_value.copyWith(usedEToken: value) as $Val);
    });
  }

  /// Create a copy of AddNewManifestScreenState
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
abstract class _$$AddNewManifestScreenStateImplCopyWith<$Res>
    implements $AddNewManifestScreenStateCopyWith<$Res> {
  factory _$$AddNewManifestScreenStateImplCopyWith(
    _$AddNewManifestScreenStateImpl value,
    $Res Function(_$AddNewManifestScreenStateImpl) then,
  ) = __$$AddNewManifestScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Facility> facilities,
    List<SampleType> sampleTypes,
    List<Sample> samples,
    MovementType? movementType,
    Facility? selectedDestinationFacility,
    Facility? pickUpFacility,
    SampleType? selectedSampleType,
    String manifestNo,
    bool isSavingManifest,
    Alert alert,
    ETokenData? usedEToken,
    Lsp? lsp,
  });

  @override
  $MovementTypeCopyWith<$Res>? get movementType;
  @override
  $FacilityCopyWith<$Res>? get selectedDestinationFacility;
  @override
  $FacilityCopyWith<$Res>? get pickUpFacility;
  @override
  $SampleTypeCopyWith<$Res>? get selectedSampleType;
  @override
  $AlertCopyWith<$Res> get alert;
  @override
  $ETokenDataCopyWith<$Res>? get usedEToken;
  @override
  $LspCopyWith<$Res>? get lsp;
}

/// @nodoc
class __$$AddNewManifestScreenStateImplCopyWithImpl<$Res>
    extends
        _$AddNewManifestScreenStateCopyWithImpl<
          $Res,
          _$AddNewManifestScreenStateImpl
        >
    implements _$$AddNewManifestScreenStateImplCopyWith<$Res> {
  __$$AddNewManifestScreenStateImplCopyWithImpl(
    _$AddNewManifestScreenStateImpl _value,
    $Res Function(_$AddNewManifestScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? sampleTypes = null,
    Object? samples = null,
    Object? movementType = freezed,
    Object? selectedDestinationFacility = freezed,
    Object? pickUpFacility = freezed,
    Object? selectedSampleType = freezed,
    Object? manifestNo = null,
    Object? isSavingManifest = null,
    Object? alert = null,
    Object? usedEToken = freezed,
    Object? lsp = freezed,
  }) {
    return _then(
      _$AddNewManifestScreenStateImpl(
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<Facility>,
        sampleTypes: null == sampleTypes
            ? _value._sampleTypes
            : sampleTypes // ignore: cast_nullable_to_non_nullable
                  as List<SampleType>,
        samples: null == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<Sample>,
        movementType: freezed == movementType
            ? _value.movementType
            : movementType // ignore: cast_nullable_to_non_nullable
                  as MovementType?,
        selectedDestinationFacility: freezed == selectedDestinationFacility
            ? _value.selectedDestinationFacility
            : selectedDestinationFacility // ignore: cast_nullable_to_non_nullable
                  as Facility?,
        pickUpFacility: freezed == pickUpFacility
            ? _value.pickUpFacility
            : pickUpFacility // ignore: cast_nullable_to_non_nullable
                  as Facility?,
        selectedSampleType: freezed == selectedSampleType
            ? _value.selectedSampleType
            : selectedSampleType // ignore: cast_nullable_to_non_nullable
                  as SampleType?,
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        isSavingManifest: null == isSavingManifest
            ? _value.isSavingManifest
            : isSavingManifest // ignore: cast_nullable_to_non_nullable
                  as bool,
        alert: null == alert
            ? _value.alert
            : alert // ignore: cast_nullable_to_non_nullable
                  as Alert,
        usedEToken: freezed == usedEToken
            ? _value.usedEToken
            : usedEToken // ignore: cast_nullable_to_non_nullable
                  as ETokenData?,
        lsp: freezed == lsp
            ? _value.lsp
            : lsp // ignore: cast_nullable_to_non_nullable
                  as Lsp?,
      ),
    );
  }
}

/// @nodoc

class _$AddNewManifestScreenStateImpl extends _AddNewManifestScreenState {
  const _$AddNewManifestScreenStateImpl({
    final List<Facility> facilities = const [],
    final List<SampleType> sampleTypes = const [],
    final List<Sample> samples = const [],
    this.movementType,
    this.selectedDestinationFacility,
    this.pickUpFacility,
    this.selectedSampleType,
    required this.manifestNo,
    this.isSavingManifest = false,
    this.alert = const Alert(show: false, message: ""),
    this.usedEToken,
    this.lsp,
  }) : _facilities = facilities,
       _sampleTypes = sampleTypes,
       _samples = samples,
       super._();

  final List<Facility> _facilities;
  @override
  @JsonKey()
  List<Facility> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  final List<SampleType> _sampleTypes;
  @override
  @JsonKey()
  List<SampleType> get sampleTypes {
    if (_sampleTypes is EqualUnmodifiableListView) return _sampleTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sampleTypes);
  }

  final List<Sample> _samples;
  @override
  @JsonKey()
  List<Sample> get samples {
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_samples);
  }

  @override
  final MovementType? movementType;
  @override
  final Facility? selectedDestinationFacility;
  @override
  final Facility? pickUpFacility;
  @override
  final SampleType? selectedSampleType;
  @override
  final String manifestNo;
  @override
  @JsonKey()
  final bool isSavingManifest;
  @override
  @JsonKey()
  final Alert alert;
  @override
  final ETokenData? usedEToken;
  @override
  final Lsp? lsp;

  @override
  String toString() {
    return 'AddNewManifestScreenState(facilities: $facilities, sampleTypes: $sampleTypes, samples: $samples, movementType: $movementType, selectedDestinationFacility: $selectedDestinationFacility, pickUpFacility: $pickUpFacility, selectedSampleType: $selectedSampleType, manifestNo: $manifestNo, isSavingManifest: $isSavingManifest, alert: $alert, usedEToken: $usedEToken, lsp: $lsp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNewManifestScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._facilities,
              _facilities,
            ) &&
            const DeepCollectionEquality().equals(
              other._sampleTypes,
              _sampleTypes,
            ) &&
            const DeepCollectionEquality().equals(other._samples, _samples) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(
                  other.selectedDestinationFacility,
                  selectedDestinationFacility,
                ) ||
                other.selectedDestinationFacility ==
                    selectedDestinationFacility) &&
            (identical(other.pickUpFacility, pickUpFacility) ||
                other.pickUpFacility == pickUpFacility) &&
            (identical(other.selectedSampleType, selectedSampleType) ||
                other.selectedSampleType == selectedSampleType) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.isSavingManifest, isSavingManifest) ||
                other.isSavingManifest == isSavingManifest) &&
            (identical(other.alert, alert) || other.alert == alert) &&
            (identical(other.usedEToken, usedEToken) ||
                other.usedEToken == usedEToken) &&
            (identical(other.lsp, lsp) || other.lsp == lsp));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_facilities),
    const DeepCollectionEquality().hash(_sampleTypes),
    const DeepCollectionEquality().hash(_samples),
    movementType,
    selectedDestinationFacility,
    pickUpFacility,
    selectedSampleType,
    manifestNo,
    isSavingManifest,
    alert,
    usedEToken,
    lsp,
  );

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNewManifestScreenStateImplCopyWith<_$AddNewManifestScreenStateImpl>
  get copyWith =>
      __$$AddNewManifestScreenStateImplCopyWithImpl<
        _$AddNewManifestScreenStateImpl
      >(this, _$identity);
}

abstract class _AddNewManifestScreenState extends AddNewManifestScreenState {
  const factory _AddNewManifestScreenState({
    final List<Facility> facilities,
    final List<SampleType> sampleTypes,
    final List<Sample> samples,
    final MovementType? movementType,
    final Facility? selectedDestinationFacility,
    final Facility? pickUpFacility,
    final SampleType? selectedSampleType,
    required final String manifestNo,
    final bool isSavingManifest,
    final Alert alert,
    final ETokenData? usedEToken,
    final Lsp? lsp,
  }) = _$AddNewManifestScreenStateImpl;
  const _AddNewManifestScreenState._() : super._();

  @override
  List<Facility> get facilities;
  @override
  List<SampleType> get sampleTypes;
  @override
  List<Sample> get samples;
  @override
  MovementType? get movementType;
  @override
  Facility? get selectedDestinationFacility;
  @override
  Facility? get pickUpFacility;
  @override
  SampleType? get selectedSampleType;
  @override
  String get manifestNo;
  @override
  bool get isSavingManifest;
  @override
  Alert get alert;
  @override
  ETokenData? get usedEToken;
  @override
  Lsp? get lsp;

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddNewManifestScreenStateImplCopyWith<_$AddNewManifestScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
