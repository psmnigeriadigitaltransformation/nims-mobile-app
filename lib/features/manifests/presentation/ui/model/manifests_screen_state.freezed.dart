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
  $Res call({List<Manifest> manifests});
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
  $Res call({Object? manifests = null}) {
    return _then(
      _value.copyWith(
            manifests: null == manifests
                ? _value.manifests
                : manifests // ignore: cast_nullable_to_non_nullable
                      as List<Manifest>,
          )
          as $Val,
    );
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
  $Res call({List<Manifest> manifests});
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
  $Res call({Object? manifests = null}) {
    return _then(
      _$ManifestsScreenStateImpl(
        manifests: null == manifests
            ? _value._manifests
            : manifests // ignore: cast_nullable_to_non_nullable
                  as List<Manifest>,
      ),
    );
  }
}

/// @nodoc

class _$ManifestsScreenStateImpl implements _ManifestsScreenState {
  const _$ManifestsScreenStateImpl({required final List<Manifest> manifests})
    : _manifests = manifests;

  final List<Manifest> _manifests;
  @override
  List<Manifest> get manifests {
    if (_manifests is EqualUnmodifiableListView) return _manifests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manifests);
  }

  @override
  String toString() {
    return 'ManifestsScreenState(manifests: $manifests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestsScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._manifests,
              _manifests,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_manifests));

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

abstract class _ManifestsScreenState implements ManifestsScreenState {
  const factory _ManifestsScreenState({
    required final List<Manifest> manifests,
  }) = _$ManifestsScreenStateImpl;

  @override
  List<Manifest> get manifests;

  /// Create a copy of ManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestsScreenStateImplCopyWith<_$ManifestsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
