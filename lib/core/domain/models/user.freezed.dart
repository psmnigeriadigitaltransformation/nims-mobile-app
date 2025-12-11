// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_code')
  String? get roleCode => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middle_name')
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  int? get isDeleted => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'geo_privileges')
  String? get geoPrivileges => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_privileges')
  String? get lspPrivileges => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_serial_no')
  String? get deviceSerialNo => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') String? userId,
    String? guid,
    @JsonKey(name: 'role_code') String? roleCode,
    String? role,
    String? title,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'is_deleted') int? isDeleted,
    int? priority,
    @JsonKey(name: 'geo_privileges') String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') String? lspPrivileges,
    @JsonKey(name: 'device_serial_no') String? deviceSerialNo,
  });
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? guid = freezed,
    Object? roleCode = freezed,
    Object? role = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? isActive = freezed,
    Object? isDeleted = freezed,
    Object? priority = freezed,
    Object? geoPrivileges = freezed,
    Object? lspPrivileges = freezed,
    Object? deviceSerialNo = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            guid: freezed == guid
                ? _value.guid
                : guid // ignore: cast_nullable_to_non_nullable
                      as String?,
            roleCode: freezed == roleCode
                ? _value.roleCode
                : roleCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            middleName: freezed == middleName
                ? _value.middleName
                : middleName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDeleted: freezed == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as int?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int?,
            geoPrivileges: freezed == geoPrivileges
                ? _value.geoPrivileges
                : geoPrivileges // ignore: cast_nullable_to_non_nullable
                      as String?,
            lspPrivileges: freezed == lspPrivileges
                ? _value.lspPrivileges
                : lspPrivileges // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceSerialNo: freezed == deviceSerialNo
                ? _value.deviceSerialNo
                : deviceSerialNo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') String? userId,
    String? guid,
    @JsonKey(name: 'role_code') String? roleCode,
    String? role,
    String? title,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'is_deleted') int? isDeleted,
    int? priority,
    @JsonKey(name: 'geo_privileges') String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') String? lspPrivileges,
    @JsonKey(name: 'device_serial_no') String? deviceSerialNo,
  });
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? guid = freezed,
    Object? roleCode = freezed,
    Object? role = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? isActive = freezed,
    Object? isDeleted = freezed,
    Object? priority = freezed,
    Object? geoPrivileges = freezed,
    Object? lspPrivileges = freezed,
    Object? deviceSerialNo = freezed,
  }) {
    return _then(
      _$UserImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        guid: freezed == guid
            ? _value.guid
            : guid // ignore: cast_nullable_to_non_nullable
                  as String?,
        roleCode: freezed == roleCode
            ? _value.roleCode
            : roleCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        middleName: freezed == middleName
            ? _value.middleName
            : middleName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDeleted: freezed == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as int?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int?,
        geoPrivileges: freezed == geoPrivileges
            ? _value.geoPrivileges
            : geoPrivileges // ignore: cast_nullable_to_non_nullable
                  as String?,
        lspPrivileges: freezed == lspPrivileges
            ? _value.lspPrivileges
            : lspPrivileges // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceSerialNo: freezed == deviceSerialNo
            ? _value.deviceSerialNo
            : deviceSerialNo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    required this.guid,
    @JsonKey(name: 'role_code') required this.roleCode,
    required this.role,
    required this.title,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'middle_name') required this.middleName,
    @JsonKey(name: 'last_name') required this.lastName,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'is_deleted') required this.isDeleted,
    required this.priority,
    @JsonKey(name: 'geo_privileges') this.geoPrivileges,
    @JsonKey(name: 'lsp_privileges') this.lspPrivileges,
    @JsonKey(name: 'device_serial_no') this.deviceSerialNo,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? guid;
  @override
  @JsonKey(name: 'role_code')
  final String? roleCode;
  @override
  final String? role;
  @override
  final String? title;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'middle_name')
  final String? middleName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'is_deleted')
  final int? isDeleted;
  @override
  final int? priority;
  @override
  @JsonKey(name: 'geo_privileges')
  final String? geoPrivileges;
  @override
  @JsonKey(name: 'lsp_privileges')
  final String? lspPrivileges;
  @override
  @JsonKey(name: 'device_serial_no')
  final String? deviceSerialNo;

  @override
  String toString() {
    return 'User(id: $id, userId: $userId, guid: $guid, roleCode: $roleCode, role: $role, title: $title, firstName: $firstName, middleName: $middleName, lastName: $lastName, isActive: $isActive, isDeleted: $isDeleted, priority: $priority, geoPrivileges: $geoPrivileges, lspPrivileges: $lspPrivileges, deviceSerialNo: $deviceSerialNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.roleCode, roleCode) ||
                other.roleCode == roleCode) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.geoPrivileges, geoPrivileges) ||
                other.geoPrivileges == geoPrivileges) &&
            (identical(other.lspPrivileges, lspPrivileges) ||
                other.lspPrivileges == lspPrivileges) &&
            (identical(other.deviceSerialNo, deviceSerialNo) ||
                other.deviceSerialNo == deviceSerialNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    guid,
    roleCode,
    role,
    title,
    firstName,
    middleName,
    lastName,
    isActive,
    isDeleted,
    priority,
    geoPrivileges,
    lspPrivileges,
    deviceSerialNo,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    @JsonKey(name: 'id') required final int? id,
    @JsonKey(name: 'user_id') required final String? userId,
    required final String? guid,
    @JsonKey(name: 'role_code') required final String? roleCode,
    required final String? role,
    required final String? title,
    @JsonKey(name: 'first_name') required final String? firstName,
    @JsonKey(name: 'middle_name') required final String? middleName,
    @JsonKey(name: 'last_name') required final String? lastName,
    @JsonKey(name: 'is_active') required final int? isActive,
    @JsonKey(name: 'is_deleted') required final int? isDeleted,
    required final int? priority,
    @JsonKey(name: 'geo_privileges') final String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') final String? lspPrivileges,
    @JsonKey(name: 'device_serial_no') final String? deviceSerialNo,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get guid;
  @override
  @JsonKey(name: 'role_code')
  String? get roleCode;
  @override
  String? get role;
  @override
  String? get title;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'middle_name')
  String? get middleName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  @JsonKey(name: 'is_deleted')
  int? get isDeleted;
  @override
  int? get priority;
  @override
  @JsonKey(name: 'geo_privileges')
  String? get geoPrivileges;
  @override
  @JsonKey(name: 'lsp_privileges')
  String? get lspPrivileges;
  @override
  @JsonKey(name: 'device_serial_no')
  String? get deviceSerialNo;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
