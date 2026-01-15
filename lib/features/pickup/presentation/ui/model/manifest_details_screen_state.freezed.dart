// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manifest_details_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ManifestDetailsScreenState {
  Manifest get manifest => throw _privateConstructorUsedError;
  List<Sample> get samples => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ManifestDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManifestDetailsScreenStateCopyWith<ManifestDetailsScreenState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManifestDetailsScreenStateCopyWith<$Res> {
  factory $ManifestDetailsScreenStateCopyWith(
    ManifestDetailsScreenState value,
    $Res Function(ManifestDetailsScreenState) then,
  ) =
      _$ManifestDetailsScreenStateCopyWithImpl<
        $Res,
        ManifestDetailsScreenState
      >;
  @useResult
  $Res call({Manifest manifest, List<Sample> samples, bool isLoading});

  $ManifestCopyWith<$Res> get manifest;
}

/// @nodoc
class _$ManifestDetailsScreenStateCopyWithImpl<
  $Res,
  $Val extends ManifestDetailsScreenState
>
    implements $ManifestDetailsScreenStateCopyWith<$Res> {
  _$ManifestDetailsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManifestDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifest = null,
    Object? samples = null,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            manifest: null == manifest
                ? _value.manifest
                : manifest // ignore: cast_nullable_to_non_nullable
                      as Manifest,
            samples: null == samples
                ? _value.samples
                : samples // ignore: cast_nullable_to_non_nullable
                      as List<Sample>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ManifestDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManifestCopyWith<$Res> get manifest {
    return $ManifestCopyWith<$Res>(_value.manifest, (value) {
      return _then(_value.copyWith(manifest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManifestDetailsScreenStateImplCopyWith<$Res>
    implements $ManifestDetailsScreenStateCopyWith<$Res> {
  factory _$$ManifestDetailsScreenStateImplCopyWith(
    _$ManifestDetailsScreenStateImpl value,
    $Res Function(_$ManifestDetailsScreenStateImpl) then,
  ) = __$$ManifestDetailsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Manifest manifest, List<Sample> samples, bool isLoading});

  @override
  $ManifestCopyWith<$Res> get manifest;
}

/// @nodoc
class __$$ManifestDetailsScreenStateImplCopyWithImpl<$Res>
    extends
        _$ManifestDetailsScreenStateCopyWithImpl<
          $Res,
          _$ManifestDetailsScreenStateImpl
        >
    implements _$$ManifestDetailsScreenStateImplCopyWith<$Res> {
  __$$ManifestDetailsScreenStateImplCopyWithImpl(
    _$ManifestDetailsScreenStateImpl _value,
    $Res Function(_$ManifestDetailsScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManifestDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manifest = null,
    Object? samples = null,
    Object? isLoading = null,
  }) {
    return _then(
      _$ManifestDetailsScreenStateImpl(
        manifest: null == manifest
            ? _value.manifest
            : manifest // ignore: cast_nullable_to_non_nullable
                  as Manifest,
        samples: null == samples
            ? _value._samples
            : samples // ignore: cast_nullable_to_non_nullable
                  as List<Sample>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ManifestDetailsScreenStateImpl implements _ManifestDetailsScreenState {
  const _$ManifestDetailsScreenStateImpl({
    required this.manifest,
    final List<Sample> samples = const [],
    this.isLoading = true,
  }) : _samples = samples;

  @override
  final Manifest manifest;
  final List<Sample> _samples;
  @override
  @JsonKey()
  List<Sample> get samples {
    if (_samples is EqualUnmodifiableListView) return _samples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_samples);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ManifestDetailsScreenState(manifest: $manifest, samples: $samples, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestDetailsScreenStateImpl &&
            (identical(other.manifest, manifest) ||
                other.manifest == manifest) &&
            const DeepCollectionEquality().equals(other._samples, _samples) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    manifest,
    const DeepCollectionEquality().hash(_samples),
    isLoading,
  );

  /// Create a copy of ManifestDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManifestDetailsScreenStateImplCopyWith<_$ManifestDetailsScreenStateImpl>
  get copyWith =>
      __$$ManifestDetailsScreenStateImplCopyWithImpl<
        _$ManifestDetailsScreenStateImpl
      >(this, _$identity);
}

abstract class _ManifestDetailsScreenState
    implements ManifestDetailsScreenState {
  const factory _ManifestDetailsScreenState({
    required final Manifest manifest,
    final List<Sample> samples,
    final bool isLoading,
  }) = _$ManifestDetailsScreenStateImpl;

  @override
  Manifest get manifest;
  @override
  List<Sample> get samples;
  @override
  bool get isLoading;

  /// Create a copy of ManifestDetailsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestDetailsScreenStateImplCopyWith<_$ManifestDetailsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
