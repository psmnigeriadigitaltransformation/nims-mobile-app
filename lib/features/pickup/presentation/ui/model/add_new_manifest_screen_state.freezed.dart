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
  String get movement => throw _privateConstructorUsedError;

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
    String movement,
  });
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
    Object? movement = null,
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
            movement: null == movement
                ? _value.movement
                : movement // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SAddNewManifestScreenStateImplCopyWith<$Res>
    implements $AddNewManifestScreenStateCopyWith<$Res> {
  factory _$$SAddNewManifestScreenStateImplCopyWith(
    _$SAddNewManifestScreenStateImpl value,
    $Res Function(_$SAddNewManifestScreenStateImpl) then,
  ) = __$$SAddNewManifestScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Facility> facilities,
    List<SampleType> sampleTypes,
    String movement,
  });
}

/// @nodoc
class __$$SAddNewManifestScreenStateImplCopyWithImpl<$Res>
    extends
        _$AddNewManifestScreenStateCopyWithImpl<
          $Res,
          _$SAddNewManifestScreenStateImpl
        >
    implements _$$SAddNewManifestScreenStateImplCopyWith<$Res> {
  __$$SAddNewManifestScreenStateImplCopyWithImpl(
    _$SAddNewManifestScreenStateImpl _value,
    $Res Function(_$SAddNewManifestScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? sampleTypes = null,
    Object? movement = null,
  }) {
    return _then(
      _$SAddNewManifestScreenStateImpl(
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<Facility>,
        sampleTypes: null == sampleTypes
            ? _value._sampleTypes
            : sampleTypes // ignore: cast_nullable_to_non_nullable
                  as List<SampleType>,
        movement: null == movement
            ? _value.movement
            : movement // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SAddNewManifestScreenStateImpl implements _SAddNewManifestScreenState {
  const _$SAddNewManifestScreenStateImpl({
    required final List<Facility> facilities,
    required final List<SampleType> sampleTypes,
    required this.movement,
  }) : _facilities = facilities,
       _sampleTypes = sampleTypes;

  final List<Facility> _facilities;
  @override
  List<Facility> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  final List<SampleType> _sampleTypes;
  @override
  List<SampleType> get sampleTypes {
    if (_sampleTypes is EqualUnmodifiableListView) return _sampleTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sampleTypes);
  }

  @override
  final String movement;

  @override
  String toString() {
    return 'AddNewManifestScreenState(facilities: $facilities, sampleTypes: $sampleTypes, movement: $movement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SAddNewManifestScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._facilities,
              _facilities,
            ) &&
            const DeepCollectionEquality().equals(
              other._sampleTypes,
              _sampleTypes,
            ) &&
            (identical(other.movement, movement) ||
                other.movement == movement));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_facilities),
    const DeepCollectionEquality().hash(_sampleTypes),
    movement,
  );

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SAddNewManifestScreenStateImplCopyWith<_$SAddNewManifestScreenStateImpl>
  get copyWith =>
      __$$SAddNewManifestScreenStateImplCopyWithImpl<
        _$SAddNewManifestScreenStateImpl
      >(this, _$identity);
}

abstract class _SAddNewManifestScreenState
    implements AddNewManifestScreenState {
  const factory _SAddNewManifestScreenState({
    required final List<Facility> facilities,
    required final List<SampleType> sampleTypes,
    required final String movement,
  }) = _$SAddNewManifestScreenStateImpl;

  @override
  List<Facility> get facilities;
  @override
  List<SampleType> get sampleTypes;
  @override
  String get movement;

  /// Create a copy of AddNewManifestScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SAddNewManifestScreenStateImplCopyWith<_$SAddNewManifestScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
