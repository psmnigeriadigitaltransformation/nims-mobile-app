// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specimen_delivery_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SpecimenDeliveryResponse _$SpecimenDeliveryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SpecimenDeliveryResponse.fromJson(json);
}

/// @nodoc
mixin _$SpecimenDeliveryResponse {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_updated')
  int? get routeUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipment_updated')
  int? get shipmentUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_updated')
  int? get approvalUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_updated')
  int? get manifestUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_updated')
  int? get sampleUpdated => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;
  List<SpecimenDeliveryUpdatedItem>? get updated =>
      throw _privateConstructorUsedError;

  /// Serializes this SpecimenDeliveryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecimenDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecimenDeliveryResponseCopyWith<SpecimenDeliveryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecimenDeliveryResponseCopyWith<$Res> {
  factory $SpecimenDeliveryResponseCopyWith(
    SpecimenDeliveryResponse value,
    $Res Function(SpecimenDeliveryResponse) then,
  ) = _$SpecimenDeliveryResponseCopyWithImpl<$Res, SpecimenDeliveryResponse>;
  @useResult
  $Res call({
    String? status,
    String? message,
    @JsonKey(name: 'route_updated') int? routeUpdated,
    @JsonKey(name: 'shipment_updated') int? shipmentUpdated,
    @JsonKey(name: 'approval_updated') int? approvalUpdated,
    @JsonKey(name: 'manifest_updated') int? manifestUpdated,
    @JsonKey(name: 'sample_updated') int? sampleUpdated,
    List<String>? errors,
    List<SpecimenDeliveryUpdatedItem>? updated,
  });
}

/// @nodoc
class _$SpecimenDeliveryResponseCopyWithImpl<
  $Res,
  $Val extends SpecimenDeliveryResponse
>
    implements $SpecimenDeliveryResponseCopyWith<$Res> {
  _$SpecimenDeliveryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecimenDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? routeUpdated = freezed,
    Object? shipmentUpdated = freezed,
    Object? approvalUpdated = freezed,
    Object? manifestUpdated = freezed,
    Object? sampleUpdated = freezed,
    Object? errors = freezed,
    Object? updated = freezed,
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
            routeUpdated: freezed == routeUpdated
                ? _value.routeUpdated
                : routeUpdated // ignore: cast_nullable_to_non_nullable
                      as int?,
            shipmentUpdated: freezed == shipmentUpdated
                ? _value.shipmentUpdated
                : shipmentUpdated // ignore: cast_nullable_to_non_nullable
                      as int?,
            approvalUpdated: freezed == approvalUpdated
                ? _value.approvalUpdated
                : approvalUpdated // ignore: cast_nullable_to_non_nullable
                      as int?,
            manifestUpdated: freezed == manifestUpdated
                ? _value.manifestUpdated
                : manifestUpdated // ignore: cast_nullable_to_non_nullable
                      as int?,
            sampleUpdated: freezed == sampleUpdated
                ? _value.sampleUpdated
                : sampleUpdated // ignore: cast_nullable_to_non_nullable
                      as int?,
            errors: freezed == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            updated: freezed == updated
                ? _value.updated
                : updated // ignore: cast_nullable_to_non_nullable
                      as List<SpecimenDeliveryUpdatedItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpecimenDeliveryResponseImplCopyWith<$Res>
    implements $SpecimenDeliveryResponseCopyWith<$Res> {
  factory _$$SpecimenDeliveryResponseImplCopyWith(
    _$SpecimenDeliveryResponseImpl value,
    $Res Function(_$SpecimenDeliveryResponseImpl) then,
  ) = __$$SpecimenDeliveryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? status,
    String? message,
    @JsonKey(name: 'route_updated') int? routeUpdated,
    @JsonKey(name: 'shipment_updated') int? shipmentUpdated,
    @JsonKey(name: 'approval_updated') int? approvalUpdated,
    @JsonKey(name: 'manifest_updated') int? manifestUpdated,
    @JsonKey(name: 'sample_updated') int? sampleUpdated,
    List<String>? errors,
    List<SpecimenDeliveryUpdatedItem>? updated,
  });
}

/// @nodoc
class __$$SpecimenDeliveryResponseImplCopyWithImpl<$Res>
    extends
        _$SpecimenDeliveryResponseCopyWithImpl<
          $Res,
          _$SpecimenDeliveryResponseImpl
        >
    implements _$$SpecimenDeliveryResponseImplCopyWith<$Res> {
  __$$SpecimenDeliveryResponseImplCopyWithImpl(
    _$SpecimenDeliveryResponseImpl _value,
    $Res Function(_$SpecimenDeliveryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecimenDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? routeUpdated = freezed,
    Object? shipmentUpdated = freezed,
    Object? approvalUpdated = freezed,
    Object? manifestUpdated = freezed,
    Object? sampleUpdated = freezed,
    Object? errors = freezed,
    Object? updated = freezed,
  }) {
    return _then(
      _$SpecimenDeliveryResponseImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        routeUpdated: freezed == routeUpdated
            ? _value.routeUpdated
            : routeUpdated // ignore: cast_nullable_to_non_nullable
                  as int?,
        shipmentUpdated: freezed == shipmentUpdated
            ? _value.shipmentUpdated
            : shipmentUpdated // ignore: cast_nullable_to_non_nullable
                  as int?,
        approvalUpdated: freezed == approvalUpdated
            ? _value.approvalUpdated
            : approvalUpdated // ignore: cast_nullable_to_non_nullable
                  as int?,
        manifestUpdated: freezed == manifestUpdated
            ? _value.manifestUpdated
            : manifestUpdated // ignore: cast_nullable_to_non_nullable
                  as int?,
        sampleUpdated: freezed == sampleUpdated
            ? _value.sampleUpdated
            : sampleUpdated // ignore: cast_nullable_to_non_nullable
                  as int?,
        errors: freezed == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        updated: freezed == updated
            ? _value._updated
            : updated // ignore: cast_nullable_to_non_nullable
                  as List<SpecimenDeliveryUpdatedItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecimenDeliveryResponseImpl implements _SpecimenDeliveryResponse {
  const _$SpecimenDeliveryResponseImpl({
    required this.status,
    required this.message,
    @JsonKey(name: 'route_updated') required this.routeUpdated,
    @JsonKey(name: 'shipment_updated') required this.shipmentUpdated,
    @JsonKey(name: 'approval_updated') required this.approvalUpdated,
    @JsonKey(name: 'manifest_updated') required this.manifestUpdated,
    @JsonKey(name: 'sample_updated') required this.sampleUpdated,
    required final List<String>? errors,
    required final List<SpecimenDeliveryUpdatedItem>? updated,
  }) : _errors = errors,
       _updated = updated;

  factory _$SpecimenDeliveryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecimenDeliveryResponseImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  @JsonKey(name: 'route_updated')
  final int? routeUpdated;
  @override
  @JsonKey(name: 'shipment_updated')
  final int? shipmentUpdated;
  @override
  @JsonKey(name: 'approval_updated')
  final int? approvalUpdated;
  @override
  @JsonKey(name: 'manifest_updated')
  final int? manifestUpdated;
  @override
  @JsonKey(name: 'sample_updated')
  final int? sampleUpdated;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SpecimenDeliveryUpdatedItem>? _updated;
  @override
  List<SpecimenDeliveryUpdatedItem>? get updated {
    final value = _updated;
    if (value == null) return null;
    if (_updated is EqualUnmodifiableListView) return _updated;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SpecimenDeliveryResponse(status: $status, message: $message, routeUpdated: $routeUpdated, shipmentUpdated: $shipmentUpdated, approvalUpdated: $approvalUpdated, manifestUpdated: $manifestUpdated, sampleUpdated: $sampleUpdated, errors: $errors, updated: $updated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecimenDeliveryResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.routeUpdated, routeUpdated) ||
                other.routeUpdated == routeUpdated) &&
            (identical(other.shipmentUpdated, shipmentUpdated) ||
                other.shipmentUpdated == shipmentUpdated) &&
            (identical(other.approvalUpdated, approvalUpdated) ||
                other.approvalUpdated == approvalUpdated) &&
            (identical(other.manifestUpdated, manifestUpdated) ||
                other.manifestUpdated == manifestUpdated) &&
            (identical(other.sampleUpdated, sampleUpdated) ||
                other.sampleUpdated == sampleUpdated) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._updated, _updated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    message,
    routeUpdated,
    shipmentUpdated,
    approvalUpdated,
    manifestUpdated,
    sampleUpdated,
    const DeepCollectionEquality().hash(_errors),
    const DeepCollectionEquality().hash(_updated),
  );

  /// Create a copy of SpecimenDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecimenDeliveryResponseImplCopyWith<_$SpecimenDeliveryResponseImpl>
  get copyWith =>
      __$$SpecimenDeliveryResponseImplCopyWithImpl<
        _$SpecimenDeliveryResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecimenDeliveryResponseImplToJson(this);
  }
}

abstract class _SpecimenDeliveryResponse implements SpecimenDeliveryResponse {
  const factory _SpecimenDeliveryResponse({
    required final String? status,
    required final String? message,
    @JsonKey(name: 'route_updated') required final int? routeUpdated,
    @JsonKey(name: 'shipment_updated') required final int? shipmentUpdated,
    @JsonKey(name: 'approval_updated') required final int? approvalUpdated,
    @JsonKey(name: 'manifest_updated') required final int? manifestUpdated,
    @JsonKey(name: 'sample_updated') required final int? sampleUpdated,
    required final List<String>? errors,
    required final List<SpecimenDeliveryUpdatedItem>? updated,
  }) = _$SpecimenDeliveryResponseImpl;

  factory _SpecimenDeliveryResponse.fromJson(Map<String, dynamic> json) =
      _$SpecimenDeliveryResponseImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(name: 'route_updated')
  int? get routeUpdated;
  @override
  @JsonKey(name: 'shipment_updated')
  int? get shipmentUpdated;
  @override
  @JsonKey(name: 'approval_updated')
  int? get approvalUpdated;
  @override
  @JsonKey(name: 'manifest_updated')
  int? get manifestUpdated;
  @override
  @JsonKey(name: 'sample_updated')
  int? get sampleUpdated;
  @override
  List<String>? get errors;
  @override
  List<SpecimenDeliveryUpdatedItem>? get updated;

  /// Create a copy of SpecimenDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecimenDeliveryResponseImplCopyWith<_$SpecimenDeliveryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SpecimenDeliveryUpdatedItem _$SpecimenDeliveryUpdatedItemFromJson(
  Map<String, dynamic> json,
) {
  return _SpecimenDeliveryUpdatedItem.fromJson(json);
}

/// @nodoc
mixin _$SpecimenDeliveryUpdatedItem {
  @JsonKey(name: 'route_no')
  String? get routeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipment_no')
  String? get shipmentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'manifest_no')
  String? get manifestNo => throw _privateConstructorUsedError;

  /// Serializes this SpecimenDeliveryUpdatedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecimenDeliveryUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecimenDeliveryUpdatedItemCopyWith<SpecimenDeliveryUpdatedItem>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecimenDeliveryUpdatedItemCopyWith<$Res> {
  factory $SpecimenDeliveryUpdatedItemCopyWith(
    SpecimenDeliveryUpdatedItem value,
    $Res Function(SpecimenDeliveryUpdatedItem) then,
  ) =
      _$SpecimenDeliveryUpdatedItemCopyWithImpl<
        $Res,
        SpecimenDeliveryUpdatedItem
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String? routeNo,
    @JsonKey(name: 'shipment_no') String? shipmentNo,
    @JsonKey(name: 'manifest_no') String? manifestNo,
  });
}

/// @nodoc
class _$SpecimenDeliveryUpdatedItemCopyWithImpl<
  $Res,
  $Val extends SpecimenDeliveryUpdatedItem
>
    implements $SpecimenDeliveryUpdatedItemCopyWith<$Res> {
  _$SpecimenDeliveryUpdatedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecimenDeliveryUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = freezed,
    Object? shipmentNo = freezed,
    Object? manifestNo = freezed,
  }) {
    return _then(
      _value.copyWith(
            routeNo: freezed == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            shipmentNo: freezed == shipmentNo
                ? _value.shipmentNo
                : shipmentNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            manifestNo: freezed == manifestNo
                ? _value.manifestNo
                : manifestNo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpecimenDeliveryUpdatedItemImplCopyWith<$Res>
    implements $SpecimenDeliveryUpdatedItemCopyWith<$Res> {
  factory _$$SpecimenDeliveryUpdatedItemImplCopyWith(
    _$SpecimenDeliveryUpdatedItemImpl value,
    $Res Function(_$SpecimenDeliveryUpdatedItemImpl) then,
  ) = __$$SpecimenDeliveryUpdatedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String? routeNo,
    @JsonKey(name: 'shipment_no') String? shipmentNo,
    @JsonKey(name: 'manifest_no') String? manifestNo,
  });
}

/// @nodoc
class __$$SpecimenDeliveryUpdatedItemImplCopyWithImpl<$Res>
    extends
        _$SpecimenDeliveryUpdatedItemCopyWithImpl<
          $Res,
          _$SpecimenDeliveryUpdatedItemImpl
        >
    implements _$$SpecimenDeliveryUpdatedItemImplCopyWith<$Res> {
  __$$SpecimenDeliveryUpdatedItemImplCopyWithImpl(
    _$SpecimenDeliveryUpdatedItemImpl _value,
    $Res Function(_$SpecimenDeliveryUpdatedItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecimenDeliveryUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = freezed,
    Object? shipmentNo = freezed,
    Object? manifestNo = freezed,
  }) {
    return _then(
      _$SpecimenDeliveryUpdatedItemImpl(
        routeNo: freezed == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        shipmentNo: freezed == shipmentNo
            ? _value.shipmentNo
            : shipmentNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        manifestNo: freezed == manifestNo
            ? _value.manifestNo
            : manifestNo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecimenDeliveryUpdatedItemImpl
    implements _SpecimenDeliveryUpdatedItem {
  const _$SpecimenDeliveryUpdatedItemImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    @JsonKey(name: 'shipment_no') required this.shipmentNo,
    @JsonKey(name: 'manifest_no') required this.manifestNo,
  });

  factory _$SpecimenDeliveryUpdatedItemImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SpecimenDeliveryUpdatedItemImplFromJson(json);

  @override
  @JsonKey(name: 'route_no')
  final String? routeNo;
  @override
  @JsonKey(name: 'shipment_no')
  final String? shipmentNo;
  @override
  @JsonKey(name: 'manifest_no')
  final String? manifestNo;

  @override
  String toString() {
    return 'SpecimenDeliveryUpdatedItem(routeNo: $routeNo, shipmentNo: $shipmentNo, manifestNo: $manifestNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecimenDeliveryUpdatedItemImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.manifestNo, manifestNo) ||
                other.manifestNo == manifestNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, routeNo, shipmentNo, manifestNo);

  /// Create a copy of SpecimenDeliveryUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecimenDeliveryUpdatedItemImplCopyWith<_$SpecimenDeliveryUpdatedItemImpl>
  get copyWith =>
      __$$SpecimenDeliveryUpdatedItemImplCopyWithImpl<
        _$SpecimenDeliveryUpdatedItemImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecimenDeliveryUpdatedItemImplToJson(this);
  }
}

abstract class _SpecimenDeliveryUpdatedItem
    implements SpecimenDeliveryUpdatedItem {
  const factory _SpecimenDeliveryUpdatedItem({
    @JsonKey(name: 'route_no') required final String? routeNo,
    @JsonKey(name: 'shipment_no') required final String? shipmentNo,
    @JsonKey(name: 'manifest_no') required final String? manifestNo,
  }) = _$SpecimenDeliveryUpdatedItemImpl;

  factory _SpecimenDeliveryUpdatedItem.fromJson(Map<String, dynamic> json) =
      _$SpecimenDeliveryUpdatedItemImpl.fromJson;

  @override
  @JsonKey(name: 'route_no')
  String? get routeNo;
  @override
  @JsonKey(name: 'shipment_no')
  String? get shipmentNo;
  @override
  @JsonKey(name: 'manifest_no')
  String? get manifestNo;

  /// Create a copy of SpecimenDeliveryUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecimenDeliveryUpdatedItemImplCopyWith<_$SpecimenDeliveryUpdatedItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}
