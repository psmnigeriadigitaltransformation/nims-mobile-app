// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lsp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Lsp _$LspFromJson(Map<String, dynamic> json) {
  return _Lsp.fromJson(json);
}

/// @nodoc
mixin _$Lsp {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get pick => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_id')
  int? get lspId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsp_code')
  String? get lspCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'guid')
  String? get guid => throw _privateConstructorUsedError;
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
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    String? pick,
    @JsonKey(name: 'lsp_id') int? lspId,
    @JsonKey(name: 'lsp_code') String? lspCode,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'guid') String? guid,
    String? display,
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
    Object? id = freezed,
    Object? userId = freezed,
    Object? pick = freezed,
    Object? lspId = freezed,
    Object? lspCode = freezed,
    Object? fullName = freezed,
    Object? guid = freezed,
    Object? display = freezed,
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
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    String? pick,
    @JsonKey(name: 'lsp_id') int? lspId,
    @JsonKey(name: 'lsp_code') String? lspCode,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'guid') String? guid,
    String? display,
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
    Object? id = freezed,
    Object? userId = freezed,
    Object? pick = freezed,
    Object? lspId = freezed,
    Object? lspCode = freezed,
    Object? fullName = freezed,
    Object? guid = freezed,
    Object? display = freezed,
  }) {
    return _then(
      _$LspImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
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
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    this.pick,
    @JsonKey(name: 'lsp_id') this.lspId,
    @JsonKey(name: 'lsp_code') this.lspCode,
    @JsonKey(name: 'full_name') this.fullName,
    @JsonKey(name: 'guid') this.guid,
    this.display,
  });

  factory _$LspImpl.fromJson(Map<String, dynamic> json) =>
      _$$LspImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? pick;
  @override
  @JsonKey(name: 'lsp_id')
  final int? lspId;
  @override
  @JsonKey(name: 'lsp_code')
  final String? lspCode;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'guid')
  final String? guid;
  @override
  final String? display;

  @override
  String toString() {
    return 'Lsp(id: $id, userId: $userId, pick: $pick, lspId: $lspId, lspCode: $lspCode, fullName: $fullName, guid: $guid, display: $display)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LspImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    pick,
    lspId,
    lspCode,
    fullName,
    guid,
    display,
  );

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
    required final String? id,
    @JsonKey(name: 'user_id') required final String? userId,
    final String? pick,
    @JsonKey(name: 'lsp_id') final int? lspId,
    @JsonKey(name: 'lsp_code') final String? lspCode,
    @JsonKey(name: 'full_name') final String? fullName,
    @JsonKey(name: 'guid') final String? guid,
    final String? display,
  }) = _$LspImpl;

  factory _Lsp.fromJson(Map<String, dynamic> json) = _$LspImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get pick;
  @override
  @JsonKey(name: 'lsp_id')
  int? get lspId;
  @override
  @JsonKey(name: 'lsp_code')
  String? get lspCode;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'guid')
  String? get guid;
  @override
  String? get display;

  /// Create a copy of Lsp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LspImplCopyWith<_$LspImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
