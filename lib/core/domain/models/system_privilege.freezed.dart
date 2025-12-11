// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_privilege.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SystemPrivilege _$SystemPrivilegeFromJson(Map<String, dynamic> json) {
  return _SystemPrivilege.fromJson(json);
}

/// @nodoc
mixin _$SystemPrivilege {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this SystemPrivilege to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemPrivilege
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemPrivilegeCopyWith<SystemPrivilege> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemPrivilegeCopyWith<$Res> {
  factory $SystemPrivilegeCopyWith(
    SystemPrivilege value,
    $Res Function(SystemPrivilege) then,
  ) = _$SystemPrivilegeCopyWithImpl<$Res, SystemPrivilege>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    String? name,
  });
}

/// @nodoc
class _$SystemPrivilegeCopyWithImpl<$Res, $Val extends SystemPrivilege>
    implements $SystemPrivilegeCopyWith<$Res> {
  _$SystemPrivilegeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemPrivilege
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SystemPrivilegeImplCopyWith<$Res>
    implements $SystemPrivilegeCopyWith<$Res> {
  factory _$$SystemPrivilegeImplCopyWith(
    _$SystemPrivilegeImpl value,
    $Res Function(_$SystemPrivilegeImpl) then,
  ) = __$$SystemPrivilegeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    String? name,
  });
}

/// @nodoc
class __$$SystemPrivilegeImplCopyWithImpl<$Res>
    extends _$SystemPrivilegeCopyWithImpl<$Res, _$SystemPrivilegeImpl>
    implements _$$SystemPrivilegeImplCopyWith<$Res> {
  __$$SystemPrivilegeImplCopyWithImpl(
    _$SystemPrivilegeImpl _value,
    $Res Function(_$SystemPrivilegeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemPrivilege
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
  }) {
    return _then(
      _$SystemPrivilegeImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemPrivilegeImpl implements _SystemPrivilege {
  const _$SystemPrivilegeImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    required this.name,
  });

  factory _$SystemPrivilegeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemPrivilegeImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? name;

  @override
  String toString() {
    return 'SystemPrivilege(id: $id, userId: $userId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemPrivilegeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name);

  /// Create a copy of SystemPrivilege
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemPrivilegeImplCopyWith<_$SystemPrivilegeImpl> get copyWith =>
      __$$SystemPrivilegeImplCopyWithImpl<_$SystemPrivilegeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemPrivilegeImplToJson(this);
  }
}

abstract class _SystemPrivilege implements SystemPrivilege {
  const factory _SystemPrivilege({
    required final String? id,
    @JsonKey(name: 'user_id') required final String? userId,
    required final String? name,
  }) = _$SystemPrivilegeImpl;

  factory _SystemPrivilege.fromJson(Map<String, dynamic> json) =
      _$SystemPrivilegeImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get name;

  /// Create a copy of SystemPrivilege
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemPrivilegeImplCopyWith<_$SystemPrivilegeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
