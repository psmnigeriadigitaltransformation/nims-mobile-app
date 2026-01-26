// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_specimen_shipment_route_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateSpecimenShipmentRouteResponse
_$CreateSpecimenShipmentRouteResponseFromJson(Map<String, dynamic> json) {
  return _CreateSpecimenShipmentRouteResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateSpecimenShipmentRouteResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  CreateSpecimenShipmentRouteData? get data =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateSpecimenShipmentRouteResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSpecimenShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSpecimenShipmentRouteResponseCopyWith<
    CreateSpecimenShipmentRouteResponse
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSpecimenShipmentRouteResponseCopyWith<$Res> {
  factory $CreateSpecimenShipmentRouteResponseCopyWith(
    CreateSpecimenShipmentRouteResponse value,
    $Res Function(CreateSpecimenShipmentRouteResponse) then,
  ) =
      _$CreateSpecimenShipmentRouteResponseCopyWithImpl<
        $Res,
        CreateSpecimenShipmentRouteResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    CreateSpecimenShipmentRouteData? data,
  });

  $CreateSpecimenShipmentRouteDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CreateSpecimenShipmentRouteResponseCopyWithImpl<
  $Res,
  $Val extends CreateSpecimenShipmentRouteResponse
>
    implements $CreateSpecimenShipmentRouteResponseCopyWith<$Res> {
  _$CreateSpecimenShipmentRouteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSpecimenShipmentRouteResponse
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
                      as CreateSpecimenShipmentRouteData?,
          )
          as $Val,
    );
  }

  /// Create a copy of CreateSpecimenShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateSpecimenShipmentRouteDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CreateSpecimenShipmentRouteDataCopyWith<$Res>(_value.data!, (
      value,
    ) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateSpecimenShipmentRouteResponseImplCopyWith<$Res>
    implements $CreateSpecimenShipmentRouteResponseCopyWith<$Res> {
  factory _$$CreateSpecimenShipmentRouteResponseImplCopyWith(
    _$CreateSpecimenShipmentRouteResponseImpl value,
    $Res Function(_$CreateSpecimenShipmentRouteResponseImpl) then,
  ) = __$$CreateSpecimenShipmentRouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    CreateSpecimenShipmentRouteData? data,
  });

  @override
  $CreateSpecimenShipmentRouteDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CreateSpecimenShipmentRouteResponseImplCopyWithImpl<$Res>
    extends
        _$CreateSpecimenShipmentRouteResponseCopyWithImpl<
          $Res,
          _$CreateSpecimenShipmentRouteResponseImpl
        >
    implements _$$CreateSpecimenShipmentRouteResponseImplCopyWith<$Res> {
  __$$CreateSpecimenShipmentRouteResponseImplCopyWithImpl(
    _$CreateSpecimenShipmentRouteResponseImpl _value,
    $Res Function(_$CreateSpecimenShipmentRouteResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateSpecimenShipmentRouteResponse
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
      _$CreateSpecimenShipmentRouteResponseImpl(
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
                  as CreateSpecimenShipmentRouteData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSpecimenShipmentRouteResponseImpl
    implements _CreateSpecimenShipmentRouteResponse {
  const _$CreateSpecimenShipmentRouteResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$CreateSpecimenShipmentRouteResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateSpecimenShipmentRouteResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final CreateSpecimenShipmentRouteData? data;

  @override
  String toString() {
    return 'CreateSpecimenShipmentRouteResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSpecimenShipmentRouteResponseImpl &&
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

  /// Create a copy of CreateSpecimenShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSpecimenShipmentRouteResponseImplCopyWith<
    _$CreateSpecimenShipmentRouteResponseImpl
  >
  get copyWith =>
      __$$CreateSpecimenShipmentRouteResponseImplCopyWithImpl<
        _$CreateSpecimenShipmentRouteResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSpecimenShipmentRouteResponseImplToJson(this);
  }
}

abstract class _CreateSpecimenShipmentRouteResponse
    implements CreateSpecimenShipmentRouteResponse {
  const factory _CreateSpecimenShipmentRouteResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final CreateSpecimenShipmentRouteData? data,
  }) = _$CreateSpecimenShipmentRouteResponseImpl;

  factory _CreateSpecimenShipmentRouteResponse.fromJson(
    Map<String, dynamic> json,
  ) = _$CreateSpecimenShipmentRouteResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  CreateSpecimenShipmentRouteData? get data;

  /// Create a copy of CreateSpecimenShipmentRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSpecimenShipmentRouteResponseImplCopyWith<
    _$CreateSpecimenShipmentRouteResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

CreateSpecimenShipmentRouteData _$CreateSpecimenShipmentRouteDataFromJson(
  Map<String, dynamic> json,
) {
  return _CreateSpecimenShipmentRouteData.fromJson(json);
}

/// @nodoc
mixin _$CreateSpecimenShipmentRouteData {
  @JsonKey(name: 'routes_processed')
  int? get routesProcessed => throw _privateConstructorUsedError;
  @JsonKey(name: 'routes_saved')
  int? get routesSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'approvals_saved')
  int? get approvalsSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipments_saved')
  int? get shipmentsSaved => throw _privateConstructorUsedError;
  List<CreateShipmentRouteError>? get errors =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateSpecimenShipmentRouteData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSpecimenShipmentRouteData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSpecimenShipmentRouteDataCopyWith<CreateSpecimenShipmentRouteData>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSpecimenShipmentRouteDataCopyWith<$Res> {
  factory $CreateSpecimenShipmentRouteDataCopyWith(
    CreateSpecimenShipmentRouteData value,
    $Res Function(CreateSpecimenShipmentRouteData) then,
  ) =
      _$CreateSpecimenShipmentRouteDataCopyWithImpl<
        $Res,
        CreateSpecimenShipmentRouteData
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'routes_processed') int? routesProcessed,
    @JsonKey(name: 'routes_saved') int? routesSaved,
    @JsonKey(name: 'approvals_saved') int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') int? shipmentsSaved,
    List<CreateShipmentRouteError>? errors,
  });
}

/// @nodoc
class _$CreateSpecimenShipmentRouteDataCopyWithImpl<
  $Res,
  $Val extends CreateSpecimenShipmentRouteData
>
    implements $CreateSpecimenShipmentRouteDataCopyWith<$Res> {
  _$CreateSpecimenShipmentRouteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSpecimenShipmentRouteData
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
                      as List<CreateShipmentRouteError>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateSpecimenShipmentRouteDataImplCopyWith<$Res>
    implements $CreateSpecimenShipmentRouteDataCopyWith<$Res> {
  factory _$$CreateSpecimenShipmentRouteDataImplCopyWith(
    _$CreateSpecimenShipmentRouteDataImpl value,
    $Res Function(_$CreateSpecimenShipmentRouteDataImpl) then,
  ) = __$$CreateSpecimenShipmentRouteDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'routes_processed') int? routesProcessed,
    @JsonKey(name: 'routes_saved') int? routesSaved,
    @JsonKey(name: 'approvals_saved') int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') int? shipmentsSaved,
    List<CreateShipmentRouteError>? errors,
  });
}

/// @nodoc
class __$$CreateSpecimenShipmentRouteDataImplCopyWithImpl<$Res>
    extends
        _$CreateSpecimenShipmentRouteDataCopyWithImpl<
          $Res,
          _$CreateSpecimenShipmentRouteDataImpl
        >
    implements _$$CreateSpecimenShipmentRouteDataImplCopyWith<$Res> {
  __$$CreateSpecimenShipmentRouteDataImplCopyWithImpl(
    _$CreateSpecimenShipmentRouteDataImpl _value,
    $Res Function(_$CreateSpecimenShipmentRouteDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateSpecimenShipmentRouteData
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
      _$CreateSpecimenShipmentRouteDataImpl(
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
                  as List<CreateShipmentRouteError>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSpecimenShipmentRouteDataImpl
    implements _CreateSpecimenShipmentRouteData {
  const _$CreateSpecimenShipmentRouteDataImpl({
    @JsonKey(name: 'routes_processed') required this.routesProcessed,
    @JsonKey(name: 'routes_saved') required this.routesSaved,
    @JsonKey(name: 'approvals_saved') required this.approvalsSaved,
    @JsonKey(name: 'shipments_saved') required this.shipmentsSaved,
    required final List<CreateShipmentRouteError>? errors,
  }) : _errors = errors;

  factory _$CreateSpecimenShipmentRouteDataImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateSpecimenShipmentRouteDataImplFromJson(json);

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
  final List<CreateShipmentRouteError>? _errors;
  @override
  List<CreateShipmentRouteError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateSpecimenShipmentRouteData(routesProcessed: $routesProcessed, routesSaved: $routesSaved, approvalsSaved: $approvalsSaved, shipmentsSaved: $shipmentsSaved, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSpecimenShipmentRouteDataImpl &&
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

  /// Create a copy of CreateSpecimenShipmentRouteData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSpecimenShipmentRouteDataImplCopyWith<
    _$CreateSpecimenShipmentRouteDataImpl
  >
  get copyWith =>
      __$$CreateSpecimenShipmentRouteDataImplCopyWithImpl<
        _$CreateSpecimenShipmentRouteDataImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSpecimenShipmentRouteDataImplToJson(this);
  }
}

abstract class _CreateSpecimenShipmentRouteData
    implements CreateSpecimenShipmentRouteData {
  const factory _CreateSpecimenShipmentRouteData({
    @JsonKey(name: 'routes_processed') required final int? routesProcessed,
    @JsonKey(name: 'routes_saved') required final int? routesSaved,
    @JsonKey(name: 'approvals_saved') required final int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required final int? shipmentsSaved,
    required final List<CreateShipmentRouteError>? errors,
  }) = _$CreateSpecimenShipmentRouteDataImpl;

  factory _CreateSpecimenShipmentRouteData.fromJson(Map<String, dynamic> json) =
      _$CreateSpecimenShipmentRouteDataImpl.fromJson;

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
  List<CreateShipmentRouteError>? get errors;

  /// Create a copy of CreateSpecimenShipmentRouteData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSpecimenShipmentRouteDataImplCopyWith<
    _$CreateSpecimenShipmentRouteDataImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

CreateShipmentRouteError _$CreateShipmentRouteErrorFromJson(
  Map<String, dynamic> json,
) {
  return _CreateShipmentRouteError.fromJson(json);
}

/// @nodoc
mixin _$CreateShipmentRouteError {
  @JsonKey(name: 'route_no')
  String? get routeNo => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CreateShipmentRouteError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateShipmentRouteError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateShipmentRouteErrorCopyWith<CreateShipmentRouteError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShipmentRouteErrorCopyWith<$Res> {
  factory $CreateShipmentRouteErrorCopyWith(
    CreateShipmentRouteError value,
    $Res Function(CreateShipmentRouteError) then,
  ) = _$CreateShipmentRouteErrorCopyWithImpl<$Res, CreateShipmentRouteError>;
  @useResult
  $Res call({@JsonKey(name: 'route_no') String? routeNo, String? message});
}

/// @nodoc
class _$CreateShipmentRouteErrorCopyWithImpl<
  $Res,
  $Val extends CreateShipmentRouteError
>
    implements $CreateShipmentRouteErrorCopyWith<$Res> {
  _$CreateShipmentRouteErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateShipmentRouteError
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
abstract class _$$CreateShipmentRouteErrorImplCopyWith<$Res>
    implements $CreateShipmentRouteErrorCopyWith<$Res> {
  factory _$$CreateShipmentRouteErrorImplCopyWith(
    _$CreateShipmentRouteErrorImpl value,
    $Res Function(_$CreateShipmentRouteErrorImpl) then,
  ) = __$$CreateShipmentRouteErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'route_no') String? routeNo, String? message});
}

/// @nodoc
class __$$CreateShipmentRouteErrorImplCopyWithImpl<$Res>
    extends
        _$CreateShipmentRouteErrorCopyWithImpl<
          $Res,
          _$CreateShipmentRouteErrorImpl
        >
    implements _$$CreateShipmentRouteErrorImplCopyWith<$Res> {
  __$$CreateShipmentRouteErrorImplCopyWithImpl(
    _$CreateShipmentRouteErrorImpl _value,
    $Res Function(_$CreateShipmentRouteErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateShipmentRouteError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? routeNo = freezed, Object? message = freezed}) {
    return _then(
      _$CreateShipmentRouteErrorImpl(
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
class _$CreateShipmentRouteErrorImpl implements _CreateShipmentRouteError {
  const _$CreateShipmentRouteErrorImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    required this.message,
  });

  factory _$CreateShipmentRouteErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateShipmentRouteErrorImplFromJson(json);

  @override
  @JsonKey(name: 'route_no')
  final String? routeNo;
  @override
  final String? message;

  @override
  String toString() {
    return 'CreateShipmentRouteError(routeNo: $routeNo, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShipmentRouteErrorImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, routeNo, message);

  /// Create a copy of CreateShipmentRouteError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShipmentRouteErrorImplCopyWith<_$CreateShipmentRouteErrorImpl>
  get copyWith =>
      __$$CreateShipmentRouteErrorImplCopyWithImpl<
        _$CreateShipmentRouteErrorImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateShipmentRouteErrorImplToJson(this);
  }
}

abstract class _CreateShipmentRouteError implements CreateShipmentRouteError {
  const factory _CreateShipmentRouteError({
    @JsonKey(name: 'route_no') required final String? routeNo,
    required final String? message,
  }) = _$CreateShipmentRouteErrorImpl;

  factory _CreateShipmentRouteError.fromJson(Map<String, dynamic> json) =
      _$CreateShipmentRouteErrorImpl.fromJson;

  @override
  @JsonKey(name: 'route_no')
  String? get routeNo;
  @override
  String? get message;

  /// Create a copy of CreateShipmentRouteError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateShipmentRouteErrorImplCopyWith<_$CreateShipmentRouteErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
