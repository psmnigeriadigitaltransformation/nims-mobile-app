// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_shipment_route_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateShipmentRouteResponse _$CreateShipmentRouteResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreateShipmentRouteResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateShipmentRouteResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  CreateShipmentData? get data => throw _privateConstructorUsedError;

  /// Serializes this CreateShipmentRouteResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateShipmentRouteResponseCopyWith<CreateShipmentRouteResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShipmentRouteResponseCopyWith<$Res> {
  factory $CreateShipmentRouteResponseCopyWith(
    CreateShipmentRouteResponse value,
    $Res Function(CreateShipmentRouteResponse) then,
  ) =
      _$CreateShipmentRouteResponseCopyWithImpl<
        $Res,
        CreateShipmentRouteResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    CreateShipmentData? data,
  });

  $CreateShipmentDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CreateShipmentRouteResponseCopyWithImpl<
  $Res,
  $Val extends CreateShipmentRouteResponse
>
    implements $CreateShipmentRouteResponseCopyWith<$Res> {
  _$CreateShipmentRouteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateShipmentRouteResponse
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
                      as CreateShipmentData?,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateShipmentDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CreateShipmentDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateShipmentRouteResponseImplCopyWith<$Res>
    implements $CreateShipmentRouteResponseCopyWith<$Res> {
  factory _$$CreateShipmentRouteResponseImplCopyWith(
    _$CreateShipmentRouteResponseImpl value,
    $Res Function(_$CreateShipmentRouteResponseImpl) then,
  ) = __$$CreateShipmentRouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    CreateShipmentData? data,
  });

  @override
  $CreateShipmentDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CreateShipmentRouteResponseImplCopyWithImpl<$Res>
    extends
        _$CreateShipmentRouteResponseCopyWithImpl<
          $Res,
          _$CreateShipmentRouteResponseImpl
        >
    implements _$$CreateShipmentRouteResponseImplCopyWith<$Res> {
  __$$CreateShipmentRouteResponseImplCopyWithImpl(
    _$CreateShipmentRouteResponseImpl _value,
    $Res Function(_$CreateShipmentRouteResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateShipmentRouteResponse
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
      _$CreateShipmentRouteResponseImpl(
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
                  as CreateShipmentData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateShipmentRouteResponseImpl
    implements _CreateShipmentRouteResponse {
  const _$CreateShipmentRouteResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$CreateShipmentRouteResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateShipmentRouteResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final CreateShipmentData? data;

  @override
  String toString() {
    return 'CreateShipmentRouteResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShipmentRouteResponseImpl &&
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

  /// Create a copy of CreateShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShipmentRouteResponseImplCopyWith<_$CreateShipmentRouteResponseImpl>
  get copyWith =>
      __$$CreateShipmentRouteResponseImplCopyWithImpl<
        _$CreateShipmentRouteResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateShipmentRouteResponseImplToJson(this);
  }
}

abstract class _CreateShipmentRouteResponse
    implements CreateShipmentRouteResponse {
  const factory _CreateShipmentRouteResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final CreateShipmentData? data,
  }) = _$CreateShipmentRouteResponseImpl;

  factory _CreateShipmentRouteResponse.fromJson(Map<String, dynamic> json) =
      _$CreateShipmentRouteResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  CreateShipmentData? get data;

  /// Create a copy of CreateShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateShipmentRouteResponseImplCopyWith<_$CreateShipmentRouteResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreateShipmentData _$CreateShipmentDataFromJson(Map<String, dynamic> json) {
  return _CreateShipmentData.fromJson(json);
}

/// @nodoc
mixin _$CreateShipmentData {
  @JsonKey(name: 'routes_processed')
  int? get routesProcessed => throw _privateConstructorUsedError;
  @JsonKey(name: 'routes_saved')
  int? get routesSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'approvals_saved')
  int? get approvalsSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipments_saved')
  int? get shipmentsSaved => throw _privateConstructorUsedError;
  List<CreateShipmentError>? get errors => throw _privateConstructorUsedError;

  /// Serializes this CreateShipmentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateShipmentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateShipmentDataCopyWith<CreateShipmentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShipmentDataCopyWith<$Res> {
  factory $CreateShipmentDataCopyWith(
    CreateShipmentData value,
    $Res Function(CreateShipmentData) then,
  ) = _$CreateShipmentDataCopyWithImpl<$Res, CreateShipmentData>;
  @useResult
  $Res call({
    @JsonKey(name: 'routes_processed') int? routesProcessed,
    @JsonKey(name: 'routes_saved') int? routesSaved,
    @JsonKey(name: 'approvals_saved') int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') int? shipmentsSaved,
    List<CreateShipmentError>? errors,
  });
}

/// @nodoc
class _$CreateShipmentDataCopyWithImpl<$Res, $Val extends CreateShipmentData>
    implements $CreateShipmentDataCopyWith<$Res> {
  _$CreateShipmentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateShipmentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routesProcessed = freezed,
    Object? routesSaved = freezed,
    Object? approvalsSaved = freezed,
    Object? shipmentsSaved = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _value.copyWith(
            routesProcessed: freezed == routesProcessed
                ? _value.routesProcessed
                : routesProcessed // ignore: cast_nullable_to_non_nullable
                      as int?,
            routesSaved: freezed == routesSaved
                ? _value.routesSaved
                : routesSaved // ignore: cast_nullable_to_non_nullable
                      as int?,
            approvalsSaved: freezed == approvalsSaved
                ? _value.approvalsSaved
                : approvalsSaved // ignore: cast_nullable_to_non_nullable
                      as int?,
            shipmentsSaved: freezed == shipmentsSaved
                ? _value.shipmentsSaved
                : shipmentsSaved // ignore: cast_nullable_to_non_nullable
                      as int?,
            errors: freezed == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<CreateShipmentError>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateShipmentDataImplCopyWith<$Res>
    implements $CreateShipmentDataCopyWith<$Res> {
  factory _$$CreateShipmentDataImplCopyWith(
    _$CreateShipmentDataImpl value,
    $Res Function(_$CreateShipmentDataImpl) then,
  ) = __$$CreateShipmentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'routes_processed') int? routesProcessed,
    @JsonKey(name: 'routes_saved') int? routesSaved,
    @JsonKey(name: 'approvals_saved') int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') int? shipmentsSaved,
    List<CreateShipmentError>? errors,
  });
}

/// @nodoc
class __$$CreateShipmentDataImplCopyWithImpl<$Res>
    extends _$CreateShipmentDataCopyWithImpl<$Res, _$CreateShipmentDataImpl>
    implements _$$CreateShipmentDataImplCopyWith<$Res> {
  __$$CreateShipmentDataImplCopyWithImpl(
    _$CreateShipmentDataImpl _value,
    $Res Function(_$CreateShipmentDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateShipmentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routesProcessed = freezed,
    Object? routesSaved = freezed,
    Object? approvalsSaved = freezed,
    Object? shipmentsSaved = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _$CreateShipmentDataImpl(
        routesProcessed: freezed == routesProcessed
            ? _value.routesProcessed
            : routesProcessed // ignore: cast_nullable_to_non_nullable
                  as int?,
        routesSaved: freezed == routesSaved
            ? _value.routesSaved
            : routesSaved // ignore: cast_nullable_to_non_nullable
                  as int?,
        approvalsSaved: freezed == approvalsSaved
            ? _value.approvalsSaved
            : approvalsSaved // ignore: cast_nullable_to_non_nullable
                  as int?,
        shipmentsSaved: freezed == shipmentsSaved
            ? _value.shipmentsSaved
            : shipmentsSaved // ignore: cast_nullable_to_non_nullable
                  as int?,
        errors: freezed == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<CreateShipmentError>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateShipmentDataImpl implements _CreateShipmentData {
  const _$CreateShipmentDataImpl({
    @JsonKey(name: 'routes_processed') required this.routesProcessed,
    @JsonKey(name: 'routes_saved') required this.routesSaved,
    @JsonKey(name: 'approvals_saved') required this.approvalsSaved,
    @JsonKey(name: 'shipments_saved') required this.shipmentsSaved,
    required final List<CreateShipmentError>? errors,
  }) : _errors = errors;

  factory _$CreateShipmentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateShipmentDataImplFromJson(json);

  @override
  @JsonKey(name: 'routes_processed')
  final int? routesProcessed;
  @override
  @JsonKey(name: 'routes_saved')
  final int? routesSaved;
  @override
  @JsonKey(name: 'approvals_saved')
  final int? approvalsSaved;
  @override
  @JsonKey(name: 'shipments_saved')
  final int? shipmentsSaved;
  final List<CreateShipmentError>? _errors;
  @override
  List<CreateShipmentError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateShipmentData(routesProcessed: $routesProcessed, routesSaved: $routesSaved, approvalsSaved: $approvalsSaved, shipmentsSaved: $shipmentsSaved, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShipmentDataImpl &&
            (identical(other.routesProcessed, routesProcessed) ||
                other.routesProcessed == routesProcessed) &&
            (identical(other.routesSaved, routesSaved) ||
                other.routesSaved == routesSaved) &&
            (identical(other.approvalsSaved, approvalsSaved) ||
                other.approvalsSaved == approvalsSaved) &&
            (identical(other.shipmentsSaved, shipmentsSaved) ||
                other.shipmentsSaved == shipmentsSaved) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    routesProcessed,
    routesSaved,
    approvalsSaved,
    shipmentsSaved,
    const DeepCollectionEquality().hash(_errors),
  );

  /// Create a copy of CreateShipmentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShipmentDataImplCopyWith<_$CreateShipmentDataImpl> get copyWith =>
      __$$CreateShipmentDataImplCopyWithImpl<_$CreateShipmentDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateShipmentDataImplToJson(this);
  }
}

abstract class _CreateShipmentData implements CreateShipmentData {
  const factory _CreateShipmentData({
    @JsonKey(name: 'routes_processed') required final int? routesProcessed,
    @JsonKey(name: 'routes_saved') required final int? routesSaved,
    @JsonKey(name: 'approvals_saved') required final int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required final int? shipmentsSaved,
    required final List<CreateShipmentError>? errors,
  }) = _$CreateShipmentDataImpl;

  factory _CreateShipmentData.fromJson(Map<String, dynamic> json) =
      _$CreateShipmentDataImpl.fromJson;

  @override
  @JsonKey(name: 'routes_processed')
  int? get routesProcessed;
  @override
  @JsonKey(name: 'routes_saved')
  int? get routesSaved;
  @override
  @JsonKey(name: 'approvals_saved')
  int? get approvalsSaved;
  @override
  @JsonKey(name: 'shipments_saved')
  int? get shipmentsSaved;
  @override
  List<CreateShipmentError>? get errors;

  /// Create a copy of CreateShipmentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateShipmentDataImplCopyWith<_$CreateShipmentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateShipmentError _$CreateShipmentErrorFromJson(Map<String, dynamic> json) {
  return _CreateShipmentError.fromJson(json);
}

/// @nodoc
mixin _$CreateShipmentError {
  @JsonKey(name: 'route_no')
  String? get routeNo => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CreateShipmentError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateShipmentError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateShipmentErrorCopyWith<CreateShipmentError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShipmentErrorCopyWith<$Res> {
  factory $CreateShipmentErrorCopyWith(
    CreateShipmentError value,
    $Res Function(CreateShipmentError) then,
  ) = _$CreateShipmentErrorCopyWithImpl<$Res, CreateShipmentError>;
  @useResult
  $Res call({@JsonKey(name: 'route_no') String? routeNo, String? message});
}

/// @nodoc
class _$CreateShipmentErrorCopyWithImpl<$Res, $Val extends CreateShipmentError>
    implements $CreateShipmentErrorCopyWith<$Res> {
  _$CreateShipmentErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateShipmentError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? routeNo = freezed, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            routeNo: freezed == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateShipmentErrorImplCopyWith<$Res>
    implements $CreateShipmentErrorCopyWith<$Res> {
  factory _$$CreateShipmentErrorImplCopyWith(
    _$CreateShipmentErrorImpl value,
    $Res Function(_$CreateShipmentErrorImpl) then,
  ) = __$$CreateShipmentErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'route_no') String? routeNo, String? message});
}

/// @nodoc
class __$$CreateShipmentErrorImplCopyWithImpl<$Res>
    extends _$CreateShipmentErrorCopyWithImpl<$Res, _$CreateShipmentErrorImpl>
    implements _$$CreateShipmentErrorImplCopyWith<$Res> {
  __$$CreateShipmentErrorImplCopyWithImpl(
    _$CreateShipmentErrorImpl _value,
    $Res Function(_$CreateShipmentErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateShipmentError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? routeNo = freezed, Object? message = freezed}) {
    return _then(
      _$CreateShipmentErrorImpl(
        routeNo: freezed == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateShipmentErrorImpl implements _CreateShipmentError {
  const _$CreateShipmentErrorImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    required this.message,
  });

  factory _$CreateShipmentErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateShipmentErrorImplFromJson(json);

  @override
  @JsonKey(name: 'route_no')
  final String? routeNo;
  @override
  final String? message;

  @override
  String toString() {
    return 'CreateShipmentError(routeNo: $routeNo, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShipmentErrorImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, routeNo, message);

  /// Create a copy of CreateShipmentError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShipmentErrorImplCopyWith<_$CreateShipmentErrorImpl> get copyWith =>
      __$$CreateShipmentErrorImplCopyWithImpl<_$CreateShipmentErrorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateShipmentErrorImplToJson(this);
  }
}

abstract class _CreateShipmentError implements CreateShipmentError {
  const factory _CreateShipmentError({
    @JsonKey(name: 'route_no') required final String? routeNo,
    required final String? message,
  }) = _$CreateShipmentErrorImpl;

  factory _CreateShipmentError.fromJson(Map<String, dynamic> json) =
      _$CreateShipmentErrorImpl.fromJson;

  @override
  @JsonKey(name: 'route_no')
  String? get routeNo;
  @override
  String? get message;

  /// Create a copy of CreateShipmentError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateShipmentErrorImplCopyWith<_$CreateShipmentErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
