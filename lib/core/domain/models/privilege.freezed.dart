// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privilege.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Privilege _$PrivilegeFromJson(Map<String, dynamic> json) {
  return _Privilege.fromJson(json);
}

/// @nodoc
mixin _$Privilege {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'system_privilege_id')
  int? get systemPrivilegeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'rider')
  int? get rider => throw _privateConstructorUsedError;

  /// Serializes this Privilege to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Privilege
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivilegeCopyWith<Privilege> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilegeCopyWith<$Res> {
  factory $PrivilegeCopyWith(Privilege value, $Res Function(Privilege) then) =
      _$PrivilegeCopyWithImpl<$Res, Privilege>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'system_privilege_id') int? systemPrivilegeId,
    @JsonKey(name: 'rider') int? rider,
  });
}

/// @nodoc
class _$PrivilegeCopyWithImpl<$Res, $Val extends Privilege>
    implements $PrivilegeCopyWith<$Res> {
  _$PrivilegeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Privilege
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? systemPrivilegeId = freezed,
    Object? rider = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            systemPrivilegeId: freezed == systemPrivilegeId
                ? _value.systemPrivilegeId
                : systemPrivilegeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            rider: freezed == rider
                ? _value.rider
                : rider // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrivilegeImplCopyWith<$Res>
    implements $PrivilegeCopyWith<$Res> {
  factory _$$PrivilegeImplCopyWith(
    _$PrivilegeImpl value,
    $Res Function(_$PrivilegeImpl) then,
  ) = __$$PrivilegeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'system_privilege_id') int? systemPrivilegeId,
    @JsonKey(name: 'rider') int? rider,
  });
}

/// @nodoc
class __$$PrivilegeImplCopyWithImpl<$Res>
    extends _$PrivilegeCopyWithImpl<$Res, _$PrivilegeImpl>
    implements _$$PrivilegeImplCopyWith<$Res> {
  __$$PrivilegeImplCopyWithImpl(
    _$PrivilegeImpl _value,
    $Res Function(_$PrivilegeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Privilege
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? systemPrivilegeId = freezed,
    Object? rider = freezed,
  }) {
    return _then(
      _$PrivilegeImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        systemPrivilegeId: freezed == systemPrivilegeId
            ? _value.systemPrivilegeId
            : systemPrivilegeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        rider: freezed == rider
            ? _value.rider
            : rider // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivilegeImpl implements _Privilege {
  const _$PrivilegeImpl({
    required this.id,
    @JsonKey(name: 'system_privilege_id') required this.systemPrivilegeId,
    @JsonKey(name: 'rider') required this.rider,
  });

  factory _$PrivilegeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivilegeImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'system_privilege_id')
  final int? systemPrivilegeId;
  @override
  @JsonKey(name: 'rider')
  final int? rider;

  @override
  String toString() {
    return 'Privilege(id: $id, systemPrivilegeId: $systemPrivilegeId, rider: $rider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivilegeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.systemPrivilegeId, systemPrivilegeId) ||
                other.systemPrivilegeId == systemPrivilegeId) &&
            (identical(other.rider, rider) || other.rider == rider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, systemPrivilegeId, rider);

  /// Create a copy of Privilege
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivilegeImplCopyWith<_$PrivilegeImpl> get copyWith =>
      __$$PrivilegeImplCopyWithImpl<_$PrivilegeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivilegeImplToJson(this);
  }
}

abstract class _Privilege implements Privilege {
  const factory _Privilege({
    required final String? id,
    @JsonKey(name: 'system_privilege_id') required final int? systemPrivilegeId,
    @JsonKey(name: 'rider') required final int? rider,
  }) = _$PrivilegeImpl;

  factory _Privilege.fromJson(Map<String, dynamic> json) =
      _$PrivilegeImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'system_privilege_id')
  int? get systemPrivilegeId;
  @override
  @JsonKey(name: 'rider')
  int? get rider;

  /// Create a copy of Privilege
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivilegeImplCopyWith<_$PrivilegeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
