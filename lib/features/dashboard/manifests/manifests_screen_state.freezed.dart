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
  String get searchQuery => throw _privateConstructorUsedError;
  Alert? get alert => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  Map<String, String> get shippedManifestStatuses =>
      throw _privateConstructorUsedError;
  String? get currentUserId => throw _privateConstructorUsedError;

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
    List<Manifest> manifests,
    String searchQuery,
    Alert? alert,
    bool isDeleting,
    Map<String, String> shippedManifestStatuses,
    String? currentUserId,
  });

  $AlertCopyWith<$Res>? get alert;
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
    Object? manifests = null,
    Object? searchQuery = null,
    Object? alert = freezed,
    Object? isDeleting = null,
    Object? shippedManifestStatuses = null,
    Object? currentUserId = freezed,
  }) {
    return _then(
      _value.copyWith(
            manifests: null == manifests
                ? _value.manifests
                : manifests // ignore: cast_nullable_to_non_nullable
                      as List<Manifest>,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            alert: freezed == alert
                ? _value.alert
                : alert // ignore: cast_nullable_to_non_nullable
                      as Alert?,
            isDeleting: null == isDeleting
                ? _value.isDeleting
                : isDeleting // ignore: cast_nullable_to_non_nullable
                      as bool,
            shippedManifestStatuses: null == shippedManifestStatuses
                ? _value.shippedManifestStatuses
                : shippedManifestStatuses // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            currentUserId: freezed == currentUserId
                ? _value.currentUserId
                : currentUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlertCopyWith<$Res>? get alert {
    if (_value.alert == null) {
      return null;
    }

    return $AlertCopyWith<$Res>(_value.alert!, (value) {
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
    List<Manifest> manifests,
    String searchQuery,
    Alert? alert,
    bool isDeleting,
    Map<String, String> shippedManifestStatuses,
    String? currentUserId,
  });

  @override
  $AlertCopyWith<$Res>? get alert;
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
    Object? manifests = null,
    Object? searchQuery = null,
    Object? alert = freezed,
    Object? isDeleting = null,
    Object? shippedManifestStatuses = null,
    Object? currentUserId = freezed,
  }) {
    return _then(
      _$ManifestsScreenStateImpl(
        manifests: null == manifests
            ? _value._manifests
            : manifests // ignore: cast_nullable_to_non_nullable
                  as List<Manifest>,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        alert: freezed == alert
            ? _value.alert
            : alert // ignore: cast_nullable_to_non_nullable
                  as Alert?,
        isDeleting: null == isDeleting
            ? _value.isDeleting
            : isDeleting // ignore: cast_nullable_to_non_nullable
                  as bool,
        shippedManifestStatuses: null == shippedManifestStatuses
            ? _value._shippedManifestStatuses
            : shippedManifestStatuses // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        currentUserId: freezed == currentUserId
            ? _value.currentUserId
            : currentUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ManifestsScreenStateImpl implements _ManifestsScreenState {
  const _$ManifestsScreenStateImpl({
    required final List<Manifest> manifests,
    this.searchQuery = '',
    this.alert,
    this.isDeleting = false,
    final Map<String, String> shippedManifestStatuses = const {},
    this.currentUserId,
  }) : _manifests = manifests,
       _shippedManifestStatuses = shippedManifestStatuses;

  final List<Manifest> _manifests;
  @override
  List<Manifest> get manifests {
    if (_manifests is EqualUnmodifiableListView) return _manifests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manifests);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  final Alert? alert;
  @override
  @JsonKey()
  final bool isDeleting;
  final Map<String, String> _shippedManifestStatuses;
  @override
  @JsonKey()
  Map<String, String> get shippedManifestStatuses {
    if (_shippedManifestStatuses is EqualUnmodifiableMapView)
      return _shippedManifestStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_shippedManifestStatuses);
  }

  @override
  final String? currentUserId;

  @override
  String toString() {
    return 'ManifestsScreenState(manifests: $manifests, searchQuery: $searchQuery, alert: $alert, isDeleting: $isDeleting, shippedManifestStatuses: $shippedManifestStatuses, currentUserId: $currentUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManifestsScreenStateImpl &&
            const DeepCollectionEquality().equals(
              other._manifests,
              _manifests,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.alert, alert) || other.alert == alert) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            const DeepCollectionEquality().equals(
              other._shippedManifestStatuses,
              _shippedManifestStatuses,
            ) &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_manifests),
    searchQuery,
    alert,
    isDeleting,
    const DeepCollectionEquality().hash(_shippedManifestStatuses),
    currentUserId,
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

abstract class _ManifestsScreenState implements ManifestsScreenState {
  const factory _ManifestsScreenState({
    required final List<Manifest> manifests,
    final String searchQuery,
    final Alert? alert,
    final bool isDeleting,
    final Map<String, String> shippedManifestStatuses,
    final String? currentUserId,
  }) = _$ManifestsScreenStateImpl;

  @override
  List<Manifest> get manifests;
  @override
  String get searchQuery;
  @override
  Alert? get alert;
  @override
  bool get isDeleting;
  @override
  Map<String, String> get shippedManifestStatuses;
  @override
  String? get currentUserId;

  /// Create a copy of ManifestsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManifestsScreenStateImplCopyWith<_$ManifestsScreenStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
