// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model',
);

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  LoginData? get data => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
    LoginResponse value,
    $Res Function(LoginResponse) then,
  ) = _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    LoginData? data,
  });

  $LoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCode = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            resultCode: freezed == resultCode
                ? _value.resultCode
                : resultCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as LoginData?,
          )
          as $Val,
    );
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $LoginDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
    _$LoginResponseImpl value,
    $Res Function(_$LoginResponseImpl) then,
  ) = __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    LoginData? data,
  });

  @override
  $LoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
    _$LoginResponseImpl _value,
    $Res Function(_$LoginResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCode = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$LoginResponseImpl(
        resultCode: freezed == resultCode
            ? _value.resultCode
            : resultCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as LoginData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final LoginData? data;

  @override
  String toString() {
    return 'LoginResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, resultCode, status, message, data);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(this);
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final LoginData? data,
  }) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  LoginData? get data;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return _LoginData.fromJson(json);
}

/// @nodoc
mixin _$LoginData {
  @JsonKey(name: 'JWT')
  String? get jwt => throw _privateConstructorUsedError;
  @JsonKey(name: 'userData')
  UserData? get userData => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceSerialNo')
  String? get deviceSerialNo => throw _privateConstructorUsedError;

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res, LoginData>;
  @useResult
  $Res call({
    @JsonKey(name: 'JWT') String? jwt,
    @JsonKey(name: 'userData') UserData? userData,
    @JsonKey(name: 'deviceSerialNo') String? deviceSerialNo,
  });

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res, $Val extends LoginData>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = freezed,
    Object? userData = freezed,
    Object? deviceSerialNo = freezed,
  }) {
    return _then(
      _value.copyWith(
            jwt: freezed == jwt
                ? _value.jwt
                : jwt // ignore: cast_nullable_to_non_nullable
                      as String?,
            userData: freezed == userData
                ? _value.userData
                : userData // ignore: cast_nullable_to_non_nullable
                      as UserData?,
            deviceSerialNo: freezed == deviceSerialNo
                ? _value.deviceSerialNo
                : deviceSerialNo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginDataImplCopyWith<$Res>
    implements $LoginDataCopyWith<$Res> {
  factory _$$LoginDataImplCopyWith(
    _$LoginDataImpl value,
    $Res Function(_$LoginDataImpl) then,
  ) = __$$LoginDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'JWT') String? jwt,
    @JsonKey(name: 'userData') UserData? userData,
    @JsonKey(name: 'deviceSerialNo') String? deviceSerialNo,
  });

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$LoginDataImplCopyWithImpl<$Res>
    extends _$LoginDataCopyWithImpl<$Res, _$LoginDataImpl>
    implements _$$LoginDataImplCopyWith<$Res> {
  __$$LoginDataImplCopyWithImpl(
    _$LoginDataImpl _value,
    $Res Function(_$LoginDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = freezed,
    Object? userData = freezed,
    Object? deviceSerialNo = freezed,
  }) {
    return _then(
      _$LoginDataImpl(
        jwt: freezed == jwt
            ? _value.jwt
            : jwt // ignore: cast_nullable_to_non_nullable
                  as String?,
        userData: freezed == userData
            ? _value.userData
            : userData // ignore: cast_nullable_to_non_nullable
                  as UserData?,
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
class _$LoginDataImpl implements _LoginData {
  const _$LoginDataImpl({
    @JsonKey(name: 'JWT') required this.jwt,
    @JsonKey(name: 'userData') required this.userData,
    @JsonKey(name: 'deviceSerialNo') required this.deviceSerialNo,
  });

  factory _$LoginDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataImplFromJson(json);

  @override
  @JsonKey(name: 'JWT')
  final String? jwt;
  @override
  @JsonKey(name: 'userData')
  final UserData? userData;
  @override
  @JsonKey(name: 'deviceSerialNo')
  final String? deviceSerialNo;

  @override
  String toString() {
    return 'LoginData(jwt: $jwt, userData: $userData, deviceSerialNo: $deviceSerialNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataImpl &&
            (identical(other.jwt, jwt) || other.jwt == jwt) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.deviceSerialNo, deviceSerialNo) ||
                other.deviceSerialNo == deviceSerialNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jwt, userData, deviceSerialNo);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      __$$LoginDataImplCopyWithImpl<_$LoginDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataImplToJson(this);
  }
}

abstract class _LoginData implements LoginData {
  const factory _LoginData({
    @JsonKey(name: 'JWT') required final String? jwt,
    @JsonKey(name: 'userData') required final UserData? userData,
    @JsonKey(name: 'deviceSerialNo') required final String? deviceSerialNo,
  }) = _$LoginDataImpl;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$LoginDataImpl.fromJson;

  @override
  @JsonKey(name: 'JWT')
  String? get jwt;
  @override
  @JsonKey(name: 'userData')
  UserData? get userData;
  @override
  @JsonKey(name: 'deviceSerialNo')
  String? get deviceSerialNo;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({String? status, String? message, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
    _$UserDataImpl value,
    $Res Function(_$UserDataImpl) then,
  ) = __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
    _$UserDataImpl _value,
    $Res Function(_$UserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _$UserDataImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl({
    required this.status,
    required this.message,
    required this.user,
  });

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final User? user;

  @override
  String toString() {
    return 'UserData(status: $status, message: $message, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, user);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(this);
  }
}

abstract class _UserData implements UserData {
  const factory _UserData({
    required final String? status,
    required final String? message,
    required final User? user,
  }) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  User? get user;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
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
  int? get priority =>
      throw _privateConstructorUsedError; // @PlatformItemListConverter()
  List<PlatformItem>? get platform =>
      throw _privateConstructorUsedError; // @SystemPrivilegeListConverter()
  @JsonKey(name: 'system_privilege')
  List<SystemPrivilege>? get systemPrivilege =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'geo_privileges')
  String? get geoPrivileges => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_privileges')
  String? get lspPrivileges => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp')
  List<Lsp>? get lsp => throw _privateConstructorUsedError;

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
    List<PlatformItem>? platform,
    @JsonKey(name: 'system_privilege') List<SystemPrivilege>? systemPrivilege,
    @JsonKey(name: 'geo_privileges') String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') String? lspPrivileges,
    @JsonKey(name: 'lsp') List<Lsp>? lsp,
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
    Object? platform = freezed,
    Object? systemPrivilege = freezed,
    Object? geoPrivileges = freezed,
    Object? lspPrivileges = freezed,
    Object? lsp = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            platform: freezed == platform
                ? _value.platform
                : platform // ignore: cast_nullable_to_non_nullable
                      as List<PlatformItem>?,
            systemPrivilege: freezed == systemPrivilege
                ? _value.systemPrivilege
                : systemPrivilege // ignore: cast_nullable_to_non_nullable
                      as List<SystemPrivilege>?,
            geoPrivileges: freezed == geoPrivileges
                ? _value.geoPrivileges
                : geoPrivileges // ignore: cast_nullable_to_non_nullable
                      as String?,
            lspPrivileges: freezed == lspPrivileges
                ? _value.lspPrivileges
                : lspPrivileges // ignore: cast_nullable_to_non_nullable
                      as String?,
            lsp: freezed == lsp
                ? _value.lsp
                : lsp // ignore: cast_nullable_to_non_nullable
                      as List<Lsp>?,
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
    List<PlatformItem>? platform,
    @JsonKey(name: 'system_privilege') List<SystemPrivilege>? systemPrivilege,
    @JsonKey(name: 'geo_privileges') String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') String? lspPrivileges,
    @JsonKey(name: 'lsp') List<Lsp>? lsp,
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
    Object? platform = freezed,
    Object? systemPrivilege = freezed,
    Object? geoPrivileges = freezed,
    Object? lspPrivileges = freezed,
    Object? lsp = freezed,
  }) {
    return _then(
      _$UserImpl(
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
        platform: freezed == platform
            ? _value._platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as List<PlatformItem>?,
        systemPrivilege: freezed == systemPrivilege
            ? _value._systemPrivilege
            : systemPrivilege // ignore: cast_nullable_to_non_nullable
                  as List<SystemPrivilege>?,
        geoPrivileges: freezed == geoPrivileges
            ? _value.geoPrivileges
            : geoPrivileges // ignore: cast_nullable_to_non_nullable
                  as String?,
        lspPrivileges: freezed == lspPrivileges
            ? _value.lspPrivileges
            : lspPrivileges // ignore: cast_nullable_to_non_nullable
                  as String?,
        lsp: freezed == lsp
            ? _value._lsp
            : lsp // ignore: cast_nullable_to_non_nullable
                  as List<Lsp>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
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
    required final List<PlatformItem>? platform,
    @JsonKey(name: 'system_privilege')
    required final List<SystemPrivilege>? systemPrivilege,
    @JsonKey(name: 'geo_privileges') this.geoPrivileges,
    @JsonKey(name: 'lsp_privileges') this.lspPrivileges,
    @JsonKey(name: 'lsp') required final List<Lsp>? lsp,
  }) : _platform = platform,
       _systemPrivilege = systemPrivilege,
       _lsp = lsp;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

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
  // @PlatformItemListConverter()
  final List<PlatformItem>? _platform;
  // @PlatformItemListConverter()
  @override
  List<PlatformItem>? get platform {
    final value = _platform;
    if (value == null) return null;
    if (_platform is EqualUnmodifiableListView) return _platform;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // @SystemPrivilegeListConverter()
  final List<SystemPrivilege>? _systemPrivilege;
  // @SystemPrivilegeListConverter()
  @override
  @JsonKey(name: 'system_privilege')
  List<SystemPrivilege>? get systemPrivilege {
    final value = _systemPrivilege;
    if (value == null) return null;
    if (_systemPrivilege is EqualUnmodifiableListView) return _systemPrivilege;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'geo_privileges')
  final String? geoPrivileges;
  @override
  @JsonKey(name: 'lsp_privileges')
  final String? lspPrivileges;
  final List<Lsp>? _lsp;
  @override
  @JsonKey(name: 'lsp')
  List<Lsp>? get lsp {
    final value = _lsp;
    if (value == null) return null;
    if (_lsp is EqualUnmodifiableListView) return _lsp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(userId: $userId, guid: $guid, roleCode: $roleCode, role: $role, title: $title, firstName: $firstName, middleName: $middleName, lastName: $lastName, isActive: $isActive, isDeleted: $isDeleted, priority: $priority, platform: $platform, systemPrivilege: $systemPrivilege, geoPrivileges: $geoPrivileges, lspPrivileges: $lspPrivileges, lsp: $lsp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
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
            const DeepCollectionEquality().equals(other._platform, _platform) &&
            const DeepCollectionEquality().equals(
              other._systemPrivilege,
              _systemPrivilege,
            ) &&
            (identical(other.geoPrivileges, geoPrivileges) ||
                other.geoPrivileges == geoPrivileges) &&
            (identical(other.lspPrivileges, lspPrivileges) ||
                other.lspPrivileges == lspPrivileges) &&
            const DeepCollectionEquality().equals(other._lsp, _lsp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
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
    const DeepCollectionEquality().hash(_platform),
    const DeepCollectionEquality().hash(_systemPrivilege),
    geoPrivileges,
    lspPrivileges,
    const DeepCollectionEquality().hash(_lsp),
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
    required final List<PlatformItem>? platform,
    @JsonKey(name: 'system_privilege')
    required final List<SystemPrivilege>? systemPrivilege,
    @JsonKey(name: 'geo_privileges') final String? geoPrivileges,
    @JsonKey(name: 'lsp_privileges') final String? lspPrivileges,
    @JsonKey(name: 'lsp') required final List<Lsp>? lsp,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

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
  int? get priority; // @PlatformItemListConverter()
  @override
  List<PlatformItem>? get platform; // @SystemPrivilegeListConverter()
  @override
  @JsonKey(name: 'system_privilege')
  List<SystemPrivilege>? get systemPrivilege;
  @override
  @JsonKey(name: 'geo_privileges')
  String? get geoPrivileges;
  @override
  @JsonKey(name: 'lsp_privileges')
  String? get lspPrivileges;
  @override
  @JsonKey(name: 'lsp')
  List<Lsp>? get lsp;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlatformItem _$PlatformItemFromJson(Map<String, dynamic> json) {
  return _PlatformItem.fromJson(json);
}

/// @nodoc
mixin _$PlatformItem {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PlatformItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformItemCopyWith<PlatformItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformItemCopyWith<$Res> {
  factory $PlatformItemCopyWith(
    PlatformItem value,
    $Res Function(PlatformItem) then,
  ) = _$PlatformItemCopyWithImpl<$Res, PlatformItem>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$PlatformItemCopyWithImpl<$Res, $Val extends PlatformItem>
    implements $PlatformItemCopyWith<$Res> {
  _$PlatformItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlatformItemImplCopyWith<$Res>
    implements $PlatformItemCopyWith<$Res> {
  factory _$$PlatformItemImplCopyWith(
    _$PlatformItemImpl value,
    $Res Function(_$PlatformItemImpl) then,
  ) = __$$PlatformItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PlatformItemImplCopyWithImpl<$Res>
    extends _$PlatformItemCopyWithImpl<$Res, _$PlatformItemImpl>
    implements _$$PlatformItemImplCopyWith<$Res> {
  __$$PlatformItemImplCopyWithImpl(
    _$PlatformItemImpl _value,
    $Res Function(_$PlatformItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlatformItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$PlatformItemImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformItemImpl implements _PlatformItem {
  const _$PlatformItemImpl({required this.name});

  factory _$PlatformItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformItemImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'PlatformItem(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformItemImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PlatformItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformItemImplCopyWith<_$PlatformItemImpl> get copyWith =>
      __$$PlatformItemImplCopyWithImpl<_$PlatformItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformItemImplToJson(this);
  }
}

abstract class _PlatformItem implements PlatformItem {
  const factory _PlatformItem({required final String name}) =
      _$PlatformItemImpl;

  factory _PlatformItem.fromJson(Map<String, dynamic> json) =
      _$PlatformItemImpl.fromJson;

  @override
  String get name;

  /// Create a copy of PlatformItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformItemImplCopyWith<_$PlatformItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SystemPrivilege _$SystemPrivilegeFromJson(Map<String, dynamic> json) {
  return _SystemPrivilege.fromJson(json);
}

/// @nodoc
mixin _$SystemPrivilege {
  String get name => throw _privateConstructorUsedError;
  Privileges get privileges => throw _privateConstructorUsedError;

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
  $Res call({String name, Privileges privileges});

  $PrivilegesCopyWith<$Res> get privileges;
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
  $Res call({Object? name = null, Object? privileges = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            privileges: null == privileges
                ? _value.privileges
                : privileges // ignore: cast_nullable_to_non_nullable
                      as Privileges,
          )
          as $Val,
    );
  }

  /// Create a copy of SystemPrivilege
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivilegesCopyWith<$Res> get privileges {
    return $PrivilegesCopyWith<$Res>(_value.privileges, (value) {
      return _then(_value.copyWith(privileges: value) as $Val);
    });
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
  $Res call({String name, Privileges privileges});

  @override
  $PrivilegesCopyWith<$Res> get privileges;
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
  $Res call({Object? name = null, Object? privileges = null}) {
    return _then(
      _$SystemPrivilegeImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        privileges: null == privileges
            ? _value.privileges
            : privileges // ignore: cast_nullable_to_non_nullable
                  as Privileges,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemPrivilegeImpl implements _SystemPrivilege {
  const _$SystemPrivilegeImpl({required this.name, required this.privileges});

  factory _$SystemPrivilegeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemPrivilegeImplFromJson(json);

  @override
  final String name;
  @override
  final Privileges privileges;

  @override
  String toString() {
    return 'SystemPrivilege(name: $name, privileges: $privileges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemPrivilegeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.privileges, privileges) ||
                other.privileges == privileges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, privileges);

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
    required final String name,
    required final Privileges privileges,
  }) = _$SystemPrivilegeImpl;

  factory _SystemPrivilege.fromJson(Map<String, dynamic> json) =
      _$SystemPrivilegeImpl.fromJson;

  @override
  String get name;
  @override
  Privileges get privileges;

  /// Create a copy of SystemPrivilege
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemPrivilegeImplCopyWith<_$SystemPrivilegeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Privileges _$PrivilegesFromJson(Map<String, dynamic> json) {
  return _Privileges.fromJson(json);
}

/// @nodoc
mixin _$Privileges {
  int? get rider => throw _privateConstructorUsedError;

  /// Serializes this Privileges to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Privileges
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivilegesCopyWith<Privileges> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilegesCopyWith<$Res> {
  factory $PrivilegesCopyWith(
    Privileges value,
    $Res Function(Privileges) then,
  ) = _$PrivilegesCopyWithImpl<$Res, Privileges>;
  @useResult
  $Res call({int? rider});
}

/// @nodoc
class _$PrivilegesCopyWithImpl<$Res, $Val extends Privileges>
    implements $PrivilegesCopyWith<$Res> {
  _$PrivilegesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Privileges
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rider = freezed}) {
    return _then(
      _value.copyWith(
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
abstract class _$$PrivilegesImplCopyWith<$Res>
    implements $PrivilegesCopyWith<$Res> {
  factory _$$PrivilegesImplCopyWith(
    _$PrivilegesImpl value,
    $Res Function(_$PrivilegesImpl) then,
  ) = __$$PrivilegesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? rider});
}

/// @nodoc
class __$$PrivilegesImplCopyWithImpl<$Res>
    extends _$PrivilegesCopyWithImpl<$Res, _$PrivilegesImpl>
    implements _$$PrivilegesImplCopyWith<$Res> {
  __$$PrivilegesImplCopyWithImpl(
    _$PrivilegesImpl _value,
    $Res Function(_$PrivilegesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Privileges
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rider = freezed}) {
    return _then(
      _$PrivilegesImpl(
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
class _$PrivilegesImpl implements _Privileges {
  const _$PrivilegesImpl({this.rider});

  factory _$PrivilegesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivilegesImplFromJson(json);

  @override
  final int? rider;

  @override
  String toString() {
    return 'Privileges(rider: $rider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivilegesImpl &&
            (identical(other.rider, rider) || other.rider == rider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rider);

  /// Create a copy of Privileges
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivilegesImplCopyWith<_$PrivilegesImpl> get copyWith =>
      __$$PrivilegesImplCopyWithImpl<_$PrivilegesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivilegesImplToJson(this);
  }
}

abstract class _Privileges implements Privileges {
  const factory _Privileges({final int? rider}) = _$PrivilegesImpl;

  factory _Privileges.fromJson(Map<String, dynamic> json) =
      _$PrivilegesImpl.fromJson;

  @override
  int? get rider;

  /// Create a copy of Privileges
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivilegesImplCopyWith<_$PrivilegesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Lsp _$LspFromJson(Map<String, dynamic> json) {
  return _Lsp.fromJson(json);
}

/// @nodoc
mixin _$Lsp {
  String? get pick => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_id')
  int? get lspId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_code')
  String? get lspCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullname')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'display')
  String? get display => throw _privateConstructorUsedError;

  /// Serializes this Lsp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lsp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LspCopyWith<Lsp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LspCopyWith<$Res> {
  factory $LspCopyWith(Lsp value, $Res Function(Lsp) then) =
      _$LspCopyWithImpl<$Res, Lsp>;
  @useResult
  $Res call({
    String? pick,
    @JsonKey(name: 'lsp_id') int? lspId,
    @JsonKey(name: 'lsp_code') String? lspCode,
    @JsonKey(name: 'fullname') String? fullName,
    @JsonKey(name: 'guid') String? guid,
    @JsonKey(name: 'display') String? display,
  });
}

/// @nodoc
class _$LspCopyWithImpl<$Res, $Val extends Lsp> implements $LspCopyWith<$Res> {
  _$LspCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lsp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? lspId = freezed,
    Object? lspCode = freezed,
    Object? fullName = freezed,
    Object? guid = freezed,
    Object? display = freezed,
  }) {
    return _then(
      _value.copyWith(
            pick: freezed == pick
                ? _value.pick
                : pick // ignore: cast_nullable_to_non_nullable
                      as String?,
            lspId: freezed == lspId
                ? _value.lspId
                : lspId // ignore: cast_nullable_to_non_nullable
                      as int?,
            lspCode: freezed == lspCode
                ? _value.lspCode
                : lspCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            guid: freezed == guid
                ? _value.guid
                : guid // ignore: cast_nullable_to_non_nullable
                      as String?,
            display: freezed == display
                ? _value.display
                : display // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LspImplCopyWith<$Res> implements $LspCopyWith<$Res> {
  factory _$$LspImplCopyWith(_$LspImpl value, $Res Function(_$LspImpl) then) =
      __$$LspImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? pick,
    @JsonKey(name: 'lsp_id') int? lspId,
    @JsonKey(name: 'lsp_code') String? lspCode,
    @JsonKey(name: 'fullname') String? fullName,
    @JsonKey(name: 'guid') String? guid,
    @JsonKey(name: 'display') String? display,
  });
}

/// @nodoc
class __$$LspImplCopyWithImpl<$Res> extends _$LspCopyWithImpl<$Res, _$LspImpl>
    implements _$$LspImplCopyWith<$Res> {
  __$$LspImplCopyWithImpl(_$LspImpl _value, $Res Function(_$LspImpl) _then)
    : super(_value, _then);

  /// Create a copy of Lsp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pick = freezed,
    Object? lspId = freezed,
    Object? lspCode = freezed,
    Object? fullName = freezed,
    Object? guid = freezed,
    Object? display = freezed,
  }) {
    return _then(
      _$LspImpl(
        pick: freezed == pick
            ? _value.pick
            : pick // ignore: cast_nullable_to_non_nullable
                  as String?,
        lspId: freezed == lspId
            ? _value.lspId
            : lspId // ignore: cast_nullable_to_non_nullable
                  as int?,
        lspCode: freezed == lspCode
            ? _value.lspCode
            : lspCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        guid: freezed == guid
            ? _value.guid
            : guid // ignore: cast_nullable_to_non_nullable
                  as String?,
        display: freezed == display
            ? _value.display
            : display // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LspImpl implements _Lsp {
  const _$LspImpl({
    this.pick,
    @JsonKey(name: 'lsp_id') this.lspId,
    @JsonKey(name: 'lsp_code') this.lspCode,
    @JsonKey(name: 'fullname') this.fullName,
    @JsonKey(name: 'guid') this.guid,
    @JsonKey(name: 'display') this.display,
  });

  factory _$LspImpl.fromJson(Map<String, dynamic> json) =>
      _$$LspImplFromJson(json);

  @override
  final String? pick;
  @override
  @JsonKey(name: 'lsp_id')
  final int? lspId;
  @override
  @JsonKey(name: 'lsp_code')
  final String? lspCode;
  @override
  @JsonKey(name: 'fullname')
  final String? fullName;
  @override
  @JsonKey(name: 'guid')
  final String? guid;
  @override
  @JsonKey(name: 'display')
  final String? display;

  @override
  String toString() {
    return 'Lsp(pick: $pick, lspId: $lspId, lspCode: $lspCode, fullName: $fullName, guid: $guid, display: $display)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LspImpl &&
            (identical(other.pick, pick) || other.pick == pick) &&
            (identical(other.lspId, lspId) || other.lspId == lspId) &&
            (identical(other.lspCode, lspCode) || other.lspCode == lspCode) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.display, display) || other.display == display));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pick, lspId, lspCode, fullName, guid, display);

  /// Create a copy of Lsp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LspImplCopyWith<_$LspImpl> get copyWith =>
      __$$LspImplCopyWithImpl<_$LspImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LspImplToJson(this);
  }
}

abstract class _Lsp implements Lsp {
  const factory _Lsp({
    final String? pick,
    @JsonKey(name: 'lsp_id') final int? lspId,
    @JsonKey(name: 'lsp_code') final String? lspCode,
    @JsonKey(name: 'fullname') final String? fullName,
    @JsonKey(name: 'guid') final String? guid,
    @JsonKey(name: 'display') final String? display,
  }) = _$LspImpl;

  factory _Lsp.fromJson(Map<String, dynamic> json) = _$LspImpl.fromJson;

  @override
  String? get pick;
  @override
  @JsonKey(name: 'lsp_id')
  int? get lspId;
  @override
  @JsonKey(name: 'lsp_code')
  String? get lspCode;
  @override
  @JsonKey(name: 'fullname')
  String? get fullName;
  @override
  @JsonKey(name: 'guid')
  String? get guid;
  @override
  @JsonKey(name: 'display')
  String? get display;

  /// Create a copy of Lsp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LspImplCopyWith<_$LspImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
