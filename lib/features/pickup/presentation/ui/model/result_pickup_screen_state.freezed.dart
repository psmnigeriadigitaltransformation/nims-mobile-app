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
  String get movement => throw _privateConstructorUsedError;

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
  $Res call({List<Facility> facilities, String movement});
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
  $Res call({Object? facilities = null, Object? movement = null}) {
    return _then(
      _value.copyWith(
            facilities: null == facilities
                ? _value.facilities
                : facilities // ignore: cast_nullable_to_non_nullable
                      as List<Facility>,
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
abstract class _$$ResultPickUpScreenStateeImplCopyWith<$Res>
    implements $ResultPickUpScreenStateCopyWith<$Res> {
  factory _$$ResultPickUpScreenStateeImplCopyWith(
    _$ResultPickUpScreenStateeImpl value,
    $Res Function(_$ResultPickUpScreenStateeImpl) then,
  ) = __$$ResultPickUpScreenStateeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Facility> facilities, String movement});
}

/// @nodoc
class __$$ResultPickUpScreenStateeImplCopyWithImpl<$Res>
    extends
        _$ResultPickUpScreenStateCopyWithImpl<
          $Res,
          _$ResultPickUpScreenStateeImpl
        >
    implements _$$ResultPickUpScreenStateeImplCopyWith<$Res> {
  __$$ResultPickUpScreenStateeImplCopyWithImpl(
    _$ResultPickUpScreenStateeImpl _value,
    $Res Function(_$ResultPickUpScreenStateeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? facilities = null, Object? movement = null}) {
    return _then(
      _$ResultPickUpScreenStateeImpl(
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<Facility>,
        movement: null == movement
            ? _value.movement
            : movement // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResultPickUpScreenStateeImpl implements _ResultPickUpScreenStatee {
  const _$ResultPickUpScreenStateeImpl({
    required final List<Facility> facilities,
    required this.movement,
  }) : _facilities = facilities;

  final List<Facility> _facilities;
  @override
  List<Facility> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  @override
  final String movement;

  @override
  String toString() {
    return 'ResultPickUpScreenState(facilities: $facilities, movement: $movement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickUpScreenStateeImpl &&
            const DeepCollectionEquality().equals(
              other._facilities,
              _facilities,
            ) &&
            (identical(other.movement, movement) ||
                other.movement == movement));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_facilities),
    movement,
  );

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickUpScreenStateeImplCopyWith<_$ResultPickUpScreenStateeImpl>
  get copyWith =>
      __$$ResultPickUpScreenStateeImplCopyWithImpl<
        _$ResultPickUpScreenStateeImpl
      >(this, _$identity);
}

abstract class _ResultPickUpScreenStatee implements ResultPickUpScreenState {
  const factory _ResultPickUpScreenStatee({
    required final List<Facility> facilities,
    required final String movement,
  }) = _$ResultPickUpScreenStateeImpl;

  @override
  List<Facility> get facilities;
  @override
  String get movement;

  /// Create a copy of ResultPickUpScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickUpScreenStateeImplCopyWith<_$ResultPickUpScreenStateeImpl>
  get copyWith => throw _privateConstructorUsedError;
}
