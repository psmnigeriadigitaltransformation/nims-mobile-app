// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model',
);

Facility _$FacilityFromJson(Map<String, dynamic> json) {
  return _Facility.fromJson(json);
}

/// @nodoc
mixin _$Facility {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'facility_id')
  int? get facilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'facility_code')
  String? get facilityCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'lab_code')
  String? get labCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'facility_name')
  String? get facilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'geo_string')
  String? get geoString => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this Facility to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Facility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacilityCopyWith<Facility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityCopyWith<$Res> {
  factory $FacilityCopyWith(Facility value, $Res Function(Facility) then) =
      _$FacilityCopyWithImpl<$Res, Facility>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'facility_id') int? facilityId,
    @JsonKey(name: 'facility_code') String? facilityCode,
    @JsonKey(name: 'lab_code') String? labCode,
    @JsonKey(name: 'facility_name') String? facilityName,
    @JsonKey(name: 'geo_string') String? geoString,
    String? type,
  });
}

/// @nodoc
class _$FacilityCopyWithImpl<$Res, $Val extends Facility>
    implements $FacilityCopyWith<$Res> {
  _$FacilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Facility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? facilityId = freezed,
    Object? facilityCode = freezed,
    Object? labCode = freezed,
    Object? facilityName = freezed,
    Object? geoString = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            facilityId: freezed == facilityId
                ? _value.facilityId
                : facilityId // ignore: cast_nullable_to_non_nullable
                      as int?,
            facilityCode: freezed == facilityCode
                ? _value.facilityCode
                : facilityCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            labCode: freezed == labCode
                ? _value.labCode
                : labCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            facilityName: freezed == facilityName
                ? _value.facilityName
                : facilityName // ignore: cast_nullable_to_non_nullable
                      as String?,
            geoString: freezed == geoString
                ? _value.geoString
                : geoString // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacilityImplCopyWith<$Res>
    implements $FacilityCopyWith<$Res> {
  factory _$$FacilityImplCopyWith(
    _$FacilityImpl value,
    $Res Function(_$FacilityImpl) then,
  ) = __$$FacilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'facility_id') int? facilityId,
    @JsonKey(name: 'facility_code') String? facilityCode,
    @JsonKey(name: 'lab_code') String? labCode,
    @JsonKey(name: 'facility_name') String? facilityName,
    @JsonKey(name: 'geo_string') String? geoString,
    String? type,
  });
}

/// @nodoc
class __$$FacilityImplCopyWithImpl<$Res>
    extends _$FacilityCopyWithImpl<$Res, _$FacilityImpl>
    implements _$$FacilityImplCopyWith<$Res> {
  __$$FacilityImplCopyWithImpl(
    _$FacilityImpl _value,
    $Res Function(_$FacilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Facility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? facilityId = freezed,
    Object? facilityCode = freezed,
    Object? labCode = freezed,
    Object? facilityName = freezed,
    Object? geoString = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$FacilityImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        facilityId: freezed == facilityId
            ? _value.facilityId
            : facilityId // ignore: cast_nullable_to_non_nullable
                  as int?,
        facilityCode: freezed == facilityCode
            ? _value.facilityCode
            : facilityCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        labCode: freezed == labCode
            ? _value.labCode
            : labCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilityName: freezed == facilityName
            ? _value.facilityName
            : facilityName // ignore: cast_nullable_to_non_nullable
                  as String?,
        geoString: freezed == geoString
            ? _value.geoString
            : geoString // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityImpl implements _Facility {
  const _$FacilityImpl({
    required this.id,
    @JsonKey(name: 'facility_id') this.facilityId,
    @JsonKey(name: 'facility_code') this.facilityCode,
    @JsonKey(name: 'lab_code') this.labCode,
    @JsonKey(name: 'facility_name') this.facilityName,
    @JsonKey(name: 'geo_string') this.geoString,
    this.type,
  });

  factory _$FacilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'facility_id')
  final int? facilityId;
  @override
  @JsonKey(name: 'facility_code')
  final String? facilityCode;
  @override
  @JsonKey(name: 'lab_code')
  final String? labCode;
  @override
  @JsonKey(name: 'facility_name')
  final String? facilityName;
  @override
  @JsonKey(name: 'geo_string')
  final String? geoString;
  @override
  final String? type;

  @override
  String toString() {
    return 'Facility(id: $id, facilityId: $facilityId, facilityCode: $facilityCode, labCode: $labCode, facilityName: $facilityName, geoString: $geoString, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.facilityCode, facilityCode) ||
                other.facilityCode == facilityCode) &&
            (identical(other.labCode, labCode) || other.labCode == labCode) &&
            (identical(other.facilityName, facilityName) ||
                other.facilityName == facilityName) &&
            (identical(other.geoString, geoString) ||
                other.geoString == geoString) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    facilityId,
    facilityCode,
    labCode,
    facilityName,
    geoString,
    type,
  );

  /// Create a copy of Facility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityImplCopyWith<_$FacilityImpl> get copyWith =>
      __$$FacilityImplCopyWithImpl<_$FacilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityImplToJson(this);
  }
}

abstract class _Facility implements Facility {
  const factory _Facility({
    required final int? id,
    @JsonKey(name: 'facility_id') final int? facilityId,
    @JsonKey(name: 'facility_code') final String? facilityCode,
    @JsonKey(name: 'lab_code') final String? labCode,
    @JsonKey(name: 'facility_name') final String? facilityName,
    @JsonKey(name: 'geo_string') final String? geoString,
    final String? type,
  }) = _$FacilityImpl;

  factory _Facility.fromJson(Map<String, dynamic> json) =
      _$FacilityImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'facility_id')
  int? get facilityId;
  @override
  @JsonKey(name: 'facility_code')
  String? get facilityCode;
  @override
  @JsonKey(name: 'lab_code')
  String? get labCode;
  @override
  @JsonKey(name: 'facility_name')
  String? get facilityName;
  @override
  @JsonKey(name: 'geo_string')
  String? get geoString;
  @override
  String? get type;

  /// Create a copy of Facility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacilityImplCopyWith<_$FacilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
