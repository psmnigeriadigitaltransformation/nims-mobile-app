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
  List<Shipment> get shipments => throw _privateConstructorUsedError;

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
  $Res call({List<Shipment> shipments});
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
  $Res call({Object? shipments = null}) {
    return _then(
      _value.copyWith(
            shipments: null == shipments
                ? _value.shipments
                : shipments // ignore: cast_nullable_to_non_nullable
                      as List<Shipment>,
          )
          as $Val,
    );
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
  $Res call({List<Shipment> shipments});
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
  $Res call({Object? shipments = null}) {
    return _then(
      _$ShipmentsScreenStateImpl(
        shipments: null == shipments
            ? _value._shipments
            : shipments // ignore: cast_nullable_to_non_nullable
                  as List<Shipment>,
      ),
    );
  }
}

/// @nodoc

class _$ShipmentsScreenStateImpl implements _ShipmentsScreenState {
  const _$ShipmentsScreenStateImpl({required final List<Shipment> shipments})
    : _shipments = shipments;

  final List<Shipment> _shipments;
  @override
  List<Shipment> get shipments {
    if (_shipments is EqualUnmodifiableListView) return _shipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipments);
  }

  @override
  String toString() {
    return 'ShipmentsScreenState(shipments: $shipments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._shipments,
              _shipments,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_shipments));

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

abstract class _ShipmentsScreenState implements ShipmentsScreenState {
  const factory _ShipmentsScreenState({
    required final List<Shipment> shipments,
  }) = _$ShipmentsScreenStateImpl;

  @override
  List<Shipment> get shipments;

  /// Create a copy of ShipmentsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentsScreenStateImplCopyWith<_$ShipmentsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
