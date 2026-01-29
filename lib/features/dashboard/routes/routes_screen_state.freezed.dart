// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routes_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RoutesScreenState {
  List<RouteWithShipments> get routes => throw _privateConstructorUsedError;
  List<RouteWithShipments> get filteredRoutes =>
      throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of RoutesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutesScreenStateCopyWith<RoutesScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutesScreenStateCopyWith<$Res> {
  factory $RoutesScreenStateCopyWith(
    RoutesScreenState value,
    $Res Function(RoutesScreenState) then,
  ) = _$RoutesScreenStateCopyWithImpl<$Res, RoutesScreenState>;
  @useResult
  $Res call({
    List<RouteWithShipments> routes,
    List<RouteWithShipments> filteredRoutes,
    String searchQuery,
    bool isLoading,
  });
}

/// @nodoc
class _$RoutesScreenStateCopyWithImpl<$Res, $Val extends RoutesScreenState>
    implements $RoutesScreenStateCopyWith<$Res> {
  _$RoutesScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? filteredRoutes = null,
    Object? searchQuery = null,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            routes: null == routes
                ? _value.routes
                : routes // ignore: cast_nullable_to_non_nullable
                      as List<RouteWithShipments>,
            filteredRoutes: null == filteredRoutes
                ? _value.filteredRoutes
                : filteredRoutes // ignore: cast_nullable_to_non_nullable
                      as List<RouteWithShipments>,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoutesScreenStateImplCopyWith<$Res>
    implements $RoutesScreenStateCopyWith<$Res> {
  factory _$$RoutesScreenStateImplCopyWith(
    _$RoutesScreenStateImpl value,
    $Res Function(_$RoutesScreenStateImpl) then,
  ) = __$$RoutesScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<RouteWithShipments> routes,
    List<RouteWithShipments> filteredRoutes,
    String searchQuery,
    bool isLoading,
  });
}

/// @nodoc
class __$$RoutesScreenStateImplCopyWithImpl<$Res>
    extends _$RoutesScreenStateCopyWithImpl<$Res, _$RoutesScreenStateImpl>
    implements _$$RoutesScreenStateImplCopyWith<$Res> {
  __$$RoutesScreenStateImplCopyWithImpl(
    _$RoutesScreenStateImpl _value,
    $Res Function(_$RoutesScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoutesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? filteredRoutes = null,
    Object? searchQuery = null,
    Object? isLoading = null,
  }) {
    return _then(
      _$RoutesScreenStateImpl(
        routes: null == routes
            ? _value._routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<RouteWithShipments>,
        filteredRoutes: null == filteredRoutes
            ? _value._filteredRoutes
            : filteredRoutes // ignore: cast_nullable_to_non_nullable
                  as List<RouteWithShipments>,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$RoutesScreenStateImpl implements _RoutesScreenState {
  const _$RoutesScreenStateImpl({
    final List<RouteWithShipments> routes = const [],
    final List<RouteWithShipments> filteredRoutes = const [],
    this.searchQuery = '',
    this.isLoading = true,
  }) : _routes = routes,
       _filteredRoutes = filteredRoutes;

  final List<RouteWithShipments> _routes;
  @override
  @JsonKey()
  List<RouteWithShipments> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  final List<RouteWithShipments> _filteredRoutes;
  @override
  @JsonKey()
  List<RouteWithShipments> get filteredRoutes {
    if (_filteredRoutes is EqualUnmodifiableListView) return _filteredRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredRoutes);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'RoutesScreenState(routes: $routes, filteredRoutes: $filteredRoutes, searchQuery: $searchQuery, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutesScreenStateImpl &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            const DeepCollectionEquality().equals(
              other._filteredRoutes,
              _filteredRoutes,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_routes),
    const DeepCollectionEquality().hash(_filteredRoutes),
    searchQuery,
    isLoading,
  );

  /// Create a copy of RoutesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutesScreenStateImplCopyWith<_$RoutesScreenStateImpl> get copyWith =>
      __$$RoutesScreenStateImplCopyWithImpl<_$RoutesScreenStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RoutesScreenState implements RoutesScreenState {
  const factory _RoutesScreenState({
    final List<RouteWithShipments> routes,
    final List<RouteWithShipments> filteredRoutes,
    final String searchQuery,
    final bool isLoading,
  }) = _$RoutesScreenStateImpl;

  @override
  List<RouteWithShipments> get routes;
  @override
  List<RouteWithShipments> get filteredRoutes;
  @override
  String get searchQuery;
  @override
  bool get isLoading;

  /// Create a copy of RoutesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutesScreenStateImplCopyWith<_$RoutesScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
