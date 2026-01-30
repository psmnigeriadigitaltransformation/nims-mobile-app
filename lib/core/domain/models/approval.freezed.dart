// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Approval _$ApprovalFromJson(Map<String, dynamic> json) {
  return _Approval.fromJson(json);
}

/// @nodoc
mixin _$Approval {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_no')
  String get approvalNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_no')
  String get routeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_type')
  String get approvalType => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullname => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_date')
  String? get approvalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_status')
  String get syncStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_location_type')
  String? get destinationLocationType => throw _privateConstructorUsedError;

  /// Serializes this Approval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApprovalCopyWith<Approval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovalCopyWith<$Res> {
  factory $ApprovalCopyWith(Approval value, $Res Function(Approval) then) =
      _$ApprovalCopyWithImpl<$Res, Approval>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'approval_no') String approvalNo,
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'approval_type') String approvalType,
    @JsonKey(name: 'full_name') String fullname,
    String phone,
    String designation,
    String signature,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'approval_date') String? approvalDate,
    @JsonKey(name: 'sync_status') String syncStatus,
    @JsonKey(name: 'destination_location_type') String? destinationLocationType,
  });
}

/// @nodoc
class _$ApprovalCopyWithImpl<$Res, $Val extends Approval>
    implements $ApprovalCopyWith<$Res> {
  _$ApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? approvalNo = null,
    Object? routeNo = null,
    Object? approvalType = null,
    Object? fullname = null,
    Object? phone = null,
    Object? designation = null,
    Object? signature = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? approvalDate = freezed,
    Object? syncStatus = null,
    Object? destinationLocationType = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            approvalNo: null == approvalNo
                ? _value.approvalNo
                : approvalNo // ignore: cast_nullable_to_non_nullable
                      as String,
            routeNo: null == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String,
            approvalType: null == approvalType
                ? _value.approvalType
                : approvalType // ignore: cast_nullable_to_non_nullable
                      as String,
            fullname: null == fullname
                ? _value.fullname
                : fullname // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            designation: null == designation
                ? _value.designation
                : designation // ignore: cast_nullable_to_non_nullable
                      as String,
            signature: null == signature
                ? _value.signature
                : signature // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            approvalDate: freezed == approvalDate
                ? _value.approvalDate
                : approvalDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            syncStatus: null == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationLocationType: freezed == destinationLocationType
                ? _value.destinationLocationType
                : destinationLocationType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApprovalImplCopyWith<$Res>
    implements $ApprovalCopyWith<$Res> {
  factory _$$ApprovalImplCopyWith(
    _$ApprovalImpl value,
    $Res Function(_$ApprovalImpl) then,
  ) = __$$ApprovalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'approval_no') String approvalNo,
    @JsonKey(name: 'route_no') String routeNo,
    @JsonKey(name: 'approval_type') String approvalType,
    @JsonKey(name: 'full_name') String fullname,
    String phone,
    String designation,
    String signature,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'approval_date') String? approvalDate,
    @JsonKey(name: 'sync_status') String syncStatus,
    @JsonKey(name: 'destination_location_type') String? destinationLocationType,
  });
}

/// @nodoc
class __$$ApprovalImplCopyWithImpl<$Res>
    extends _$ApprovalCopyWithImpl<$Res, _$ApprovalImpl>
    implements _$$ApprovalImplCopyWith<$Res> {
  __$$ApprovalImplCopyWithImpl(
    _$ApprovalImpl _value,
    $Res Function(_$ApprovalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? approvalNo = null,
    Object? routeNo = null,
    Object? approvalType = null,
    Object? fullname = null,
    Object? phone = null,
    Object? designation = null,
    Object? signature = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? approvalDate = freezed,
    Object? syncStatus = null,
    Object? destinationLocationType = freezed,
  }) {
    return _then(
      _$ApprovalImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        approvalNo: null == approvalNo
            ? _value.approvalNo
            : approvalNo // ignore: cast_nullable_to_non_nullable
                  as String,
        routeNo: null == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String,
        approvalType: null == approvalType
            ? _value.approvalType
            : approvalType // ignore: cast_nullable_to_non_nullable
                  as String,
        fullname: null == fullname
            ? _value.fullname
            : fullname // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        designation: null == designation
            ? _value.designation
            : designation // ignore: cast_nullable_to_non_nullable
                  as String,
        signature: null == signature
            ? _value.signature
            : signature // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        approvalDate: freezed == approvalDate
            ? _value.approvalDate
            : approvalDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncStatus: null == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationLocationType: freezed == destinationLocationType
            ? _value.destinationLocationType
            : destinationLocationType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovalImpl implements _Approval {
  const _$ApprovalImpl({
    this.id,
    @JsonKey(name: 'approval_no') required this.approvalNo,
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'approval_type') required this.approvalType,
    @JsonKey(name: 'full_name') required this.fullname,
    required this.phone,
    required this.designation,
    required this.signature,
    this.latitude,
    this.longitude,
    @JsonKey(name: 'approval_date') this.approvalDate,
    @JsonKey(name: 'sync_status') this.syncStatus = 'pending',
    @JsonKey(name: 'destination_location_type') this.destinationLocationType,
  });

  factory _$ApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovalImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'approval_no')
  final String approvalNo;
  @override
  @JsonKey(name: 'route_no')
  final String routeNo;
  @override
  @JsonKey(name: 'approval_type')
  final String approvalType;
  @override
  @JsonKey(name: 'full_name')
  final String fullname;
  @override
  final String phone;
  @override
  final String designation;
  @override
  final String signature;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'approval_date')
  final String? approvalDate;
  @override
  @JsonKey(name: 'sync_status')
  final String syncStatus;
  @override
  @JsonKey(name: 'destination_location_type')
  final String? destinationLocationType;

  @override
  String toString() {
    return 'Approval(id: $id, approvalNo: $approvalNo, routeNo: $routeNo, approvalType: $approvalType, fullname: $fullname, phone: $phone, designation: $designation, signature: $signature, latitude: $latitude, longitude: $longitude, approvalDate: $approvalDate, syncStatus: $syncStatus, destinationLocationType: $destinationLocationType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.approvalNo, approvalNo) ||
                other.approvalNo == approvalNo) &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.approvalType, approvalType) ||
                other.approvalType == approvalType) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.approvalDate, approvalDate) ||
                other.approvalDate == approvalDate) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(
                  other.destinationLocationType,
                  destinationLocationType,
                ) ||
                other.destinationLocationType == destinationLocationType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    approvalNo,
    routeNo,
    approvalType,
    fullname,
    phone,
    designation,
    signature,
    latitude,
    longitude,
    approvalDate,
    syncStatus,
    destinationLocationType,
  );

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovalImplCopyWith<_$ApprovalImpl> get copyWith =>
      __$$ApprovalImplCopyWithImpl<_$ApprovalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovalImplToJson(this);
  }
}

abstract class _Approval implements Approval {
  const factory _Approval({
    final int? id,
    @JsonKey(name: 'approval_no') required final String approvalNo,
    @JsonKey(name: 'route_no') required final String routeNo,
    @JsonKey(name: 'approval_type') required final String approvalType,
    @JsonKey(name: 'full_name') required final String fullname,
    required final String phone,
    required final String designation,
    required final String signature,
    final double? latitude,
    final double? longitude,
    @JsonKey(name: 'approval_date') final String? approvalDate,
    @JsonKey(name: 'sync_status') final String syncStatus,
    @JsonKey(name: 'destination_location_type')
    final String? destinationLocationType,
  }) = _$ApprovalImpl;

  factory _Approval.fromJson(Map<String, dynamic> json) =
      _$ApprovalImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'approval_no')
  String get approvalNo;
  @override
  @JsonKey(name: 'route_no')
  String get routeNo;
  @override
  @JsonKey(name: 'approval_type')
  String get approvalType;
  @override
  @JsonKey(name: 'full_name')
  String get fullname;
  @override
  String get phone;
  @override
  String get designation;
  @override
  String get signature;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'approval_date')
  String? get approvalDate;
  @override
  @JsonKey(name: 'sync_status')
  String get syncStatus;
  @override
  @JsonKey(name: 'destination_location_type')
  String? get destinationLocationType;

  /// Create a copy of Approval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApprovalImplCopyWith<_$ApprovalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
