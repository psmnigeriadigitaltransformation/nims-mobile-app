// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_pickup_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResultPickUpScreenState {
  List<Facility> get facilities => throw _privateConstructorUsedError;
  MovementType? get movementType => throw _privateConstructorUsedError;
  Facility? get selectedFacility => throw _privateConstructorUsedError;
  Set<String> get selectedResultCodes => throw _privateConstructorUsedError;
  String get temperature => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Alert get alert => throw _privateConstructorUsedError;
  bool get showSuccessScreen =>
      throw _privateConstructorUsedError; // Hardcoded sample data for now (will be replaced with real API data later)
  List<ResultSampleData> get availableResults =>
      throw _privateConstructorUsedError;

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickUpScreenStateCopyWith<ResultPickUpScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickUpScreenStateCopyWith<$Res> {
  factory $ResultPickUpScreenStateCopyWith(
    ResultPickUpScreenState value,
    $Res Function(ResultPickUpScreenState) then,
  ) = _$ResultPickUpScreenStateCopyWithImpl<$Res, ResultPickUpScreenState>;
  @useResult
  $Res call({
    List<Facility> facilities,
    MovementType? movementType,
    Facility? selectedFacility,
    Set<String> selectedResultCodes,
    String temperature,
    String fullName,
    String phoneNumber,
    String designation,
    String signature,
    bool isSubmitting,
    Alert alert,
    bool showSuccessScreen,
    List<ResultSampleData> availableResults,
  });

  $MovementTypeCopyWith<$Res>? get movementType;
  $FacilityCopyWith<$Res>? get selectedFacility;
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class _$ResultPickUpScreenStateCopyWithImpl<
  $Res,
  $Val extends ResultPickUpScreenState
>
    implements $ResultPickUpScreenStateCopyWith<$Res> {
  _$ResultPickUpScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? movementType = freezed,
    Object? selectedFacility = freezed,
    Object? selectedResultCodes = null,
    Object? temperature = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? designation = null,
    Object? signature = null,
    Object? isSubmitting = null,
    Object? alert = null,
    Object? showSuccessScreen = null,
    Object? availableResults = null,
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
            selectedFacility: freezed == selectedFacility
                ? _value.selectedFacility
                : selectedFacility // ignore: cast_nullable_to_non_nullable
                      as Facility?,
            selectedResultCodes: null == selectedResultCodes
                ? _value.selectedResultCodes
                : selectedResultCodes // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String,
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
            isSubmitting: null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            alert: null == alert
                ? _value.alert
                : alert // ignore: cast_nullable_to_non_nullable
                      as Alert,
            showSuccessScreen: null == showSuccessScreen
                ? _value.showSuccessScreen
                : showSuccessScreen // ignore: cast_nullable_to_non_nullable
                      as bool,
            availableResults: null == availableResults
                ? _value.availableResults
                : availableResults // ignore: cast_nullable_to_non_nullable
                      as List<ResultSampleData>,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultPickUpScreenState
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

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get selectedFacility {
    if (_value.selectedFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.selectedFacility!, (value) {
      return _then(_value.copyWith(selectedFacility: value) as $Val);
    });
  }

  /// Create a copy of ResultPickUpScreenState
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
abstract class _$$ResultPickUpScreenStateImplCopyWith<$Res>
    implements $ResultPickUpScreenStateCopyWith<$Res> {
  factory _$$ResultPickUpScreenStateImplCopyWith(
    _$ResultPickUpScreenStateImpl value,
    $Res Function(_$ResultPickUpScreenStateImpl) then,
  ) = __$$ResultPickUpScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Facility> facilities,
    MovementType? movementType,
    Facility? selectedFacility,
    Set<String> selectedResultCodes,
    String temperature,
    String fullName,
    String phoneNumber,
    String designation,
    String signature,
    bool isSubmitting,
    Alert alert,
    bool showSuccessScreen,
    List<ResultSampleData> availableResults,
  });

  @override
  $MovementTypeCopyWith<$Res>? get movementType;
  @override
  $FacilityCopyWith<$Res>? get selectedFacility;
  @override
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class __$$ResultPickUpScreenStateImplCopyWithImpl<$Res>
    extends
        _$ResultPickUpScreenStateCopyWithImpl<
          $Res,
          _$ResultPickUpScreenStateImpl
        >
    implements _$$ResultPickUpScreenStateImplCopyWith<$Res> {
  __$$ResultPickUpScreenStateImplCopyWithImpl(
    _$ResultPickUpScreenStateImpl _value,
    $Res Function(_$ResultPickUpScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? movementType = freezed,
    Object? selectedFacility = freezed,
    Object? selectedResultCodes = null,
    Object? temperature = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? designation = null,
    Object? signature = null,
    Object? isSubmitting = null,
    Object? alert = null,
    Object? showSuccessScreen = null,
    Object? availableResults = null,
  }) {
    return _then(
      _$ResultPickUpScreenStateImpl(
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<Facility>,
        movementType: freezed == movementType
            ? _value.movementType
            : movementType // ignore: cast_nullable_to_non_nullable
                  as MovementType?,
        selectedFacility: freezed == selectedFacility
            ? _value.selectedFacility
            : selectedFacility // ignore: cast_nullable_to_non_nullable
                  as Facility?,
        selectedResultCodes: null == selectedResultCodes
            ? _value._selectedResultCodes
            : selectedResultCodes // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String,
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
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        alert: null == alert
            ? _value.alert
            : alert // ignore: cast_nullable_to_non_nullable
                  as Alert,
        showSuccessScreen: null == showSuccessScreen
            ? _value.showSuccessScreen
            : showSuccessScreen // ignore: cast_nullable_to_non_nullable
                  as bool,
        availableResults: null == availableResults
            ? _value._availableResults
            : availableResults // ignore: cast_nullable_to_non_nullable
                  as List<ResultSampleData>,
      ),
    );
  }
}

/// @nodoc

class _$ResultPickUpScreenStateImpl extends _ResultPickUpScreenState {
  const _$ResultPickUpScreenStateImpl({
    final List<Facility> facilities = const [],
    this.movementType,
    this.selectedFacility,
    final Set<String> selectedResultCodes = const {},
    this.temperature = "",
    this.fullName = "",
    this.phoneNumber = "",
    this.designation = "",
    this.signature = "",
    this.isSubmitting = false,
    this.alert = const Alert(message: "", show: false),
    this.showSuccessScreen = false,
    final List<ResultSampleData> availableResults = const [],
  }) : _facilities = facilities,
       _selectedResultCodes = selectedResultCodes,
       _availableResults = availableResults,
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
  final Facility? selectedFacility;
  final Set<String> _selectedResultCodes;
  @override
  @JsonKey()
  Set<String> get selectedResultCodes {
    if (_selectedResultCodes is EqualUnmodifiableSetView)
      return _selectedResultCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedResultCodes);
  }

  @override
  @JsonKey()
  final String temperature;
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
  final bool isSubmitting;
  @override
  @JsonKey()
  final Alert alert;
  @override
  @JsonKey()
  final bool showSuccessScreen;
  // Hardcoded sample data for now (will be replaced with real API data later)
  final List<ResultSampleData> _availableResults;
  // Hardcoded sample data for now (will be replaced with real API data later)
  @override
  @JsonKey()
  List<ResultSampleData> get availableResults {
    if (_availableResults is EqualUnmodifiableListView)
      return _availableResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableResults);
  }

  @override
  String toString() {
    return 'ResultPickUpScreenState(facilities: $facilities, movementType: $movementType, selectedFacility: $selectedFacility, selectedResultCodes: $selectedResultCodes, temperature: $temperature, fullName: $fullName, phoneNumber: $phoneNumber, designation: $designation, signature: $signature, isSubmitting: $isSubmitting, alert: $alert, showSuccessScreen: $showSuccessScreen, availableResults: $availableResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickUpScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._facilities,
              _facilities,
            ) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(other.selectedFacility, selectedFacility) ||
                other.selectedFacility == selectedFacility) &&
            const DeepCollectionEquality().equals(
              other._selectedResultCodes,
              _selectedResultCodes,
            ) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.alert, alert) || other.alert == alert) &&
            (identical(other.showSuccessScreen, showSuccessScreen) ||
                other.showSuccessScreen == showSuccessScreen) &&
            const DeepCollectionEquality().equals(
              other._availableResults,
              _availableResults,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_facilities),
    movementType,
    selectedFacility,
    const DeepCollectionEquality().hash(_selectedResultCodes),
    temperature,
    fullName,
    phoneNumber,
    designation,
    signature,
    isSubmitting,
    alert,
    showSuccessScreen,
    const DeepCollectionEquality().hash(_availableResults),
  );

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickUpScreenStateImplCopyWith<_$ResultPickUpScreenStateImpl>
  get copyWith =>
      __$$ResultPickUpScreenStateImplCopyWithImpl<
        _$ResultPickUpScreenStateImpl
      >(this, _$identity);
}

abstract class _ResultPickUpScreenState extends ResultPickUpScreenState {
  const factory _ResultPickUpScreenState({
    final List<Facility> facilities,
    final MovementType? movementType,
    final Facility? selectedFacility,
    final Set<String> selectedResultCodes,
    final String temperature,
    final String fullName,
    final String phoneNumber,
    final String designation,
    final String signature,
    final bool isSubmitting,
    final Alert alert,
    final bool showSuccessScreen,
    final List<ResultSampleData> availableResults,
  }) = _$ResultPickUpScreenStateImpl;
  const _ResultPickUpScreenState._() : super._();

  @override
  List<Facility> get facilities;
  @override
  MovementType? get movementType;
  @override
  Facility? get selectedFacility;
  @override
  Set<String> get selectedResultCodes;
  @override
  String get temperature;
  @override
  String get fullName;
  @override
  String get phoneNumber;
  @override
  String get designation;
  @override
  String get signature;
  @override
  bool get isSubmitting;
  @override
  Alert get alert;
  @override
  bool get showSuccessScreen; // Hardcoded sample data for now (will be replaced with real API data later)
  @override
  List<ResultSampleData> get availableResults;

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickUpScreenStateImplCopyWith<_$ResultPickUpScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResultSampleData {
  String get manifestNo => throw _privateConstructorUsedError;
  String get sampleType => throw _privateConstructorUsedError;
  List<String> get sampleCodes => throw _privateConstructorUsedError;

  /// Create a copy of ResultSampleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultSampleDataCopyWith<ResultSampleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultSampleDataCopyWith<$Res> {
  factory $ResultSampleDataCopyWith(
    ResultSampleData value,
    $Res Function(ResultSampleData) then,
  ) = _$ResultSampleDataCopyWithImpl<$Res, ResultSampleData>;
  @useResult
  $Res call({String manifestNo, String sampleType, List<String> sampleCodes});
}

/// @nodoc
class _$ResultSampleDataCopyWithImpl<$Res, $Val extends ResultSampleData>
    implements $ResultSampleDataCopyWith<$Res> {
  _$ResultSampleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultSampleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = null,
    Object? sampleType = null,
    Object? sampleCodes = null,
  }) {
    return _then(
      _value.copyWith(
            manifestNo: null == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleType: null == sampleType
                ? _value.sampleType
                : sampleType // ignore: cast_nullable_to_non_nullable
                      as String,
            sampleCodes: null == sampleCodes
                ? _value.sampleCodes
                : sampleCodes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultSampleDataImplCopyWith<$Res>
    implements $ResultSampleDataCopyWith<$Res> {
  factory _$$ResultSampleDataImplCopyWith(
    _$ResultSampleDataImpl value,
    $Res Function(_$ResultSampleDataImpl) then,
  ) = __$$ResultSampleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String manifestNo, String sampleType, List<String> sampleCodes});
}

/// @nodoc
class __$$ResultSampleDataImplCopyWithImpl<$Res>
    extends _$ResultSampleDataCopyWithImpl<$Res, _$ResultSampleDataImpl>
    implements _$$ResultSampleDataImplCopyWith<$Res> {
  __$$ResultSampleDataImplCopyWithImpl(
    _$ResultSampleDataImpl _value,
    $Res Function(_$ResultSampleDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultSampleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifestNo = null,
    Object? sampleType = null,
    Object? sampleCodes = null,
  }) {
    return _then(
      _$ResultSampleDataImpl(
        manifestNo: null == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleType: null == sampleType
            ? _value.sampleType
            : sampleType // ignore: cast_nullable_to_non_nullable
                  as String,
        sampleCodes: null == sampleCodes
            ? _value._sampleCodes
            : sampleCodes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$ResultSampleDataImpl implements _ResultSampleData {
  const _$ResultSampleDataImpl({
    required this.manifestNo,
    required this.sampleType,
    required final List<String> sampleCodes,
  }) : _sampleCodes = sampleCodes;

  @override
  final String manifestNo;
  @override
  final String sampleType;
  final List<String> _sampleCodes;
  @override
  List<String> get sampleCodes {
    if (_sampleCodes is EqualUnmodifiableListView) return _sampleCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sampleCodes);
  }

  @override
  String toString() {
    return 'ResultSampleData(manifestNo: $manifestNo, sampleType: $sampleType, sampleCodes: $sampleCodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultSampleDataImpl &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            const DeepCollectionEquality().equals(
              other._sampleCodes,
              _sampleCodes,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    manifestNo,
    sampleType,
    const DeepCollectionEquality().hash(_sampleCodes),
  );

  /// Create a copy of ResultSampleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultSampleDataImplCopyWith<_$ResultSampleDataImpl> get copyWith =>
      __$$ResultSampleDataImplCopyWithImpl<_$ResultSampleDataImpl>(
        this,
        _$identity,
      );
}

abstract class _ResultSampleData implements ResultSampleData {
  const factory _ResultSampleData({
    required final String manifestNo,
    required final String sampleType,
    required final List<String> sampleCodes,
  }) = _$ResultSampleDataImpl;

  @override
  String get manifestNo;
  @override
  String get sampleType;
  @override
  List<String> get sampleCodes;

  /// Create a copy of ResultSampleData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultSampleDataImplCopyWith<_$ResultSampleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
