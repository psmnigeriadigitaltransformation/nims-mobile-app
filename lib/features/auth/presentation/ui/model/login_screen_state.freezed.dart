// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginScreenState {
  bool get isLoginLoading => throw _privateConstructorUsedError;
  Alert get alert => throw _privateConstructorUsedError;

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
    LoginScreenState value,
    $Res Function(LoginScreenState) then,
  ) = _$LoginScreenStateCopyWithImpl<$Res, LoginScreenState>;
  @useResult
  $Res call({bool isLoginLoading, Alert alert});

  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res, $Val extends LoginScreenState>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoginLoading = null, Object? alert = null}) {
    return _then(
      _value.copyWith(
            isLoginLoading: null == isLoginLoading
                ? _value.isLoginLoading
                : isLoginLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            alert: null == alert
                ? _value.alert
                : alert // ignore: cast_nullable_to_non_nullable
                      as Alert,
          )
          as $Val,
    );
  }

  /// Create a copy of LoginScreenState
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
abstract class _$$LoginScreenStateImplCopyWith<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  factory _$$LoginScreenStateImplCopyWith(
    _$LoginScreenStateImpl value,
    $Res Function(_$LoginScreenStateImpl) then,
  ) = __$$LoginScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoginLoading, Alert alert});

  @override
  $AlertCopyWith<$Res> get alert;
}

/// @nodoc
class __$$LoginScreenStateImplCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res, _$LoginScreenStateImpl>
    implements _$$LoginScreenStateImplCopyWith<$Res> {
  __$$LoginScreenStateImplCopyWithImpl(
    _$LoginScreenStateImpl _value,
    $Res Function(_$LoginScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoginLoading = null, Object? alert = null}) {
    return _then(
      _$LoginScreenStateImpl(
        isLoginLoading: null == isLoginLoading
            ? _value.isLoginLoading
            : isLoginLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        alert: null == alert
            ? _value.alert
            : alert // ignore: cast_nullable_to_non_nullable
                  as Alert,
      ),
    );
  }
}

/// @nodoc

class _$LoginScreenStateImpl implements _LoginScreenState {
  const _$LoginScreenStateImpl({
    required this.isLoginLoading,
    required this.alert,
  });

  @override
  final bool isLoginLoading;
  @override
  final Alert alert;

  @override
  String toString() {
    return 'LoginScreenState(isLoginLoading: $isLoginLoading, alert: $alert)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenStateImpl &&
            (identical(other.isLoginLoading, isLoginLoading) ||
                other.isLoginLoading == isLoginLoading) &&
            (identical(other.alert, alert) || other.alert == alert));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoginLoading, alert);

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginScreenStateImplCopyWith<_$LoginScreenStateImpl> get copyWith =>
      __$$LoginScreenStateImplCopyWithImpl<_$LoginScreenStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LoginScreenState implements LoginScreenState {
  const factory _LoginScreenState({
    required final bool isLoginLoading,
    required final Alert alert,
  }) = _$LoginScreenStateImpl;

  @override
  bool get isLoginLoading;
  @override
  Alert get alert;

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginScreenStateImplCopyWith<_$LoginScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
