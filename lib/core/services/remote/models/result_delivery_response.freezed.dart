// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_delivery_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResultDeliveryResponse _$ResultDeliveryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ResultDeliveryResponse.fromJson(json);
}

/// @nodoc
mixin _$ResultDeliveryResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ResultDeliveryData? get data => throw _privateConstructorUsedError;

  /// Serializes this ResultDeliveryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDeliveryResponseCopyWith<ResultDeliveryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDeliveryResponseCopyWith<$Res> {
  factory $ResultDeliveryResponseCopyWith(
    ResultDeliveryResponse value,
    $Res Function(ResultDeliveryResponse) then,
  ) = _$ResultDeliveryResponseCopyWithImpl<$Res, ResultDeliveryResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    ResultDeliveryData? data,
  });

  $ResultDeliveryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResultDeliveryResponseCopyWithImpl<
  $Res,
  $Val extends ResultDeliveryResponse
>
    implements $ResultDeliveryResponseCopyWith<$Res> {
  _$ResultDeliveryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDeliveryResponse
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
                      as ResultDeliveryData?,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultDeliveryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ResultDeliveryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultDeliveryResponseImplCopyWith<$Res>
    implements $ResultDeliveryResponseCopyWith<$Res> {
  factory _$$ResultDeliveryResponseImplCopyWith(
    _$ResultDeliveryResponseImpl value,
    $Res Function(_$ResultDeliveryResponseImpl) then,
  ) = __$$ResultDeliveryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    ResultDeliveryData? data,
  });

  @override
  $ResultDeliveryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ResultDeliveryResponseImplCopyWithImpl<$Res>
    extends
        _$ResultDeliveryResponseCopyWithImpl<$Res, _$ResultDeliveryResponseImpl>
    implements _$$ResultDeliveryResponseImplCopyWith<$Res> {
  __$$ResultDeliveryResponseImplCopyWithImpl(
    _$ResultDeliveryResponseImpl _value,
    $Res Function(_$ResultDeliveryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultDeliveryResponse
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
      _$ResultDeliveryResponseImpl(
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
                  as ResultDeliveryData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDeliveryResponseImpl implements _ResultDeliveryResponse {
  const _$ResultDeliveryResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$ResultDeliveryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDeliveryResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final ResultDeliveryData? data;

  @override
  String toString() {
    return 'ResultDeliveryResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDeliveryResponseImpl &&
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

  /// Create a copy of ResultDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDeliveryResponseImplCopyWith<_$ResultDeliveryResponseImpl>
  get copyWith =>
      __$$ResultDeliveryResponseImplCopyWithImpl<_$ResultDeliveryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDeliveryResponseImplToJson(this);
  }
}

abstract class _ResultDeliveryResponse implements ResultDeliveryResponse {
  const factory _ResultDeliveryResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final ResultDeliveryData? data,
  }) = _$ResultDeliveryResponseImpl;

  factory _ResultDeliveryResponse.fromJson(Map<String, dynamic> json) =
      _$ResultDeliveryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  ResultDeliveryData? get data;

  /// Create a copy of ResultDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDeliveryResponseImplCopyWith<_$ResultDeliveryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResultDeliveryData _$ResultDeliveryDataFromJson(Map<String, dynamic> json) {
  return _ResultDeliveryData.fromJson(json);
}

/// @nodoc
mixin _$ResultDeliveryData {
  ResultDeliverySummary? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_no_failed')
  List<String>? get routeNoFailed => throw _privateConstructorUsedError;
  List<ResultDeliveryError>? get errors => throw _privateConstructorUsedError;

  /// Serializes this ResultDeliveryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDeliveryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDeliveryDataCopyWith<ResultDeliveryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDeliveryDataCopyWith<$Res> {
  factory $ResultDeliveryDataCopyWith(
    ResultDeliveryData value,
    $Res Function(ResultDeliveryData) then,
  ) = _$ResultDeliveryDataCopyWithImpl<$Res, ResultDeliveryData>;
  @useResult
  $Res call({
    ResultDeliverySummary? summary,
    @JsonKey(name: 'route_no_failed') List<String>? routeNoFailed,
    List<ResultDeliveryError>? errors,
  });

  $ResultDeliverySummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$ResultDeliveryDataCopyWithImpl<$Res, $Val extends ResultDeliveryData>
    implements $ResultDeliveryDataCopyWith<$Res> {
  _$ResultDeliveryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDeliveryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? routeNoFailed = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as ResultDeliverySummary?,
            routeNoFailed: freezed == routeNoFailed
                ? _value.routeNoFailed
                : routeNoFailed // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            errors: freezed == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<ResultDeliveryError>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultDeliveryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultDeliverySummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $ResultDeliverySummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultDeliveryDataImplCopyWith<$Res>
    implements $ResultDeliveryDataCopyWith<$Res> {
  factory _$$ResultDeliveryDataImplCopyWith(
    _$ResultDeliveryDataImpl value,
    $Res Function(_$ResultDeliveryDataImpl) then,
  ) = __$$ResultDeliveryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ResultDeliverySummary? summary,
    @JsonKey(name: 'route_no_failed') List<String>? routeNoFailed,
    List<ResultDeliveryError>? errors,
  });

  @override
  $ResultDeliverySummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$ResultDeliveryDataImplCopyWithImpl<$Res>
    extends _$ResultDeliveryDataCopyWithImpl<$Res, _$ResultDeliveryDataImpl>
    implements _$$ResultDeliveryDataImplCopyWith<$Res> {
  __$$ResultDeliveryDataImplCopyWithImpl(
    _$ResultDeliveryDataImpl _value,
    $Res Function(_$ResultDeliveryDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultDeliveryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? routeNoFailed = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _$ResultDeliveryDataImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as ResultDeliverySummary?,
        routeNoFailed: freezed == routeNoFailed
            ? _value._routeNoFailed
            : routeNoFailed // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        errors: freezed == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<ResultDeliveryError>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDeliveryDataImpl implements _ResultDeliveryData {
  const _$ResultDeliveryDataImpl({
    required this.summary,
    @JsonKey(name: 'route_no_failed')
    required final List<String>? routeNoFailed,
    required final List<ResultDeliveryError>? errors,
  }) : _routeNoFailed = routeNoFailed,
       _errors = errors;

  factory _$ResultDeliveryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDeliveryDataImplFromJson(json);

  @override
  final ResultDeliverySummary? summary;
  final List<String>? _routeNoFailed;
  @override
  @JsonKey(name: 'route_no_failed')
  List<String>? get routeNoFailed {
    final value = _routeNoFailed;
    if (value == null) return null;
    if (_routeNoFailed is EqualUnmodifiableListView) return _routeNoFailed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ResultDeliveryError>? _errors;
  @override
  List<ResultDeliveryError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultDeliveryData(summary: $summary, routeNoFailed: $routeNoFailed, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDeliveryDataImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(
              other._routeNoFailed,
              _routeNoFailed,
            ) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(_routeNoFailed),
    const DeepCollectionEquality().hash(_errors),
  );

  /// Create a copy of ResultDeliveryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDeliveryDataImplCopyWith<_$ResultDeliveryDataImpl> get copyWith =>
      __$$ResultDeliveryDataImplCopyWithImpl<_$ResultDeliveryDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDeliveryDataImplToJson(this);
  }
}

abstract class _ResultDeliveryData implements ResultDeliveryData {
  const factory _ResultDeliveryData({
    required final ResultDeliverySummary? summary,
    @JsonKey(name: 'route_no_failed')
    required final List<String>? routeNoFailed,
    required final List<ResultDeliveryError>? errors,
  }) = _$ResultDeliveryDataImpl;

  factory _ResultDeliveryData.fromJson(Map<String, dynamic> json) =
      _$ResultDeliveryDataImpl.fromJson;

  @override
  ResultDeliverySummary? get summary;
  @override
  @JsonKey(name: 'route_no_failed')
  List<String>? get routeNoFailed;
  @override
  List<ResultDeliveryError>? get errors;

  /// Create a copy of ResultDeliveryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDeliveryDataImplCopyWith<_$ResultDeliveryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultDeliverySummary _$ResultDeliverySummaryFromJson(
  Map<String, dynamic> json,
) {
  return _ResultDeliverySummary.fromJson(json);
}

/// @nodoc
mixin _$ResultDeliverySummary {
  @JsonKey(name: 'routes_processed')
  int? get routesProcessed => throw _privateConstructorUsedError;
  @JsonKey(name: 'routes_saved')
  int? get routesSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'approvals_saved')
  int? get approvalsSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipments_saved')
  int? get shipmentsSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'samples_updated')
  int? get samplesUpdated => throw _privateConstructorUsedError;

  /// Serializes this ResultDeliverySummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDeliverySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDeliverySummaryCopyWith<ResultDeliverySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDeliverySummaryCopyWith<$Res> {
  factory $ResultDeliverySummaryCopyWith(
    ResultDeliverySummary value,
    $Res Function(ResultDeliverySummary) then,
  ) = _$ResultDeliverySummaryCopyWithImpl<$Res, ResultDeliverySummary>;
  @useResult
  $Res call({
    @JsonKey(name: 'routes_processed') int? routesProcessed,
    @JsonKey(name: 'routes_saved') int? routesSaved,
    @JsonKey(name: 'approvals_saved') int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') int? shipmentsSaved,
    @JsonKey(name: 'samples_updated') int? samplesUpdated,
  });
}

/// @nodoc
class _$ResultDeliverySummaryCopyWithImpl<
  $Res,
  $Val extends ResultDeliverySummary
>
    implements $ResultDeliverySummaryCopyWith<$Res> {
  _$ResultDeliverySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDeliverySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routesProcessed = freezed,
    Object? routesSaved = freezed,
    Object? approvalsSaved = freezed,
    Object? shipmentsSaved = freezed,
    Object? samplesUpdated = freezed,
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
            samplesUpdated: freezed == samplesUpdated
                ? _value.samplesUpdated
                : samplesUpdated // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultDeliverySummaryImplCopyWith<$Res>
    implements $ResultDeliverySummaryCopyWith<$Res> {
  factory _$$ResultDeliverySummaryImplCopyWith(
    _$ResultDeliverySummaryImpl value,
    $Res Function(_$ResultDeliverySummaryImpl) then,
  ) = __$$ResultDeliverySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'routes_processed') int? routesProcessed,
    @JsonKey(name: 'routes_saved') int? routesSaved,
    @JsonKey(name: 'approvals_saved') int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') int? shipmentsSaved,
    @JsonKey(name: 'samples_updated') int? samplesUpdated,
  });
}

/// @nodoc
class __$$ResultDeliverySummaryImplCopyWithImpl<$Res>
    extends
        _$ResultDeliverySummaryCopyWithImpl<$Res, _$ResultDeliverySummaryImpl>
    implements _$$ResultDeliverySummaryImplCopyWith<$Res> {
  __$$ResultDeliverySummaryImplCopyWithImpl(
    _$ResultDeliverySummaryImpl _value,
    $Res Function(_$ResultDeliverySummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultDeliverySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routesProcessed = freezed,
    Object? routesSaved = freezed,
    Object? approvalsSaved = freezed,
    Object? shipmentsSaved = freezed,
    Object? samplesUpdated = freezed,
  }) {
    return _then(
      _$ResultDeliverySummaryImpl(
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
        samplesUpdated: freezed == samplesUpdated
            ? _value.samplesUpdated
            : samplesUpdated // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDeliverySummaryImpl implements _ResultDeliverySummary {
  const _$ResultDeliverySummaryImpl({
    @JsonKey(name: 'routes_processed') required this.routesProcessed,
    @JsonKey(name: 'routes_saved') required this.routesSaved,
    @JsonKey(name: 'approvals_saved') required this.approvalsSaved,
    @JsonKey(name: 'shipments_saved') required this.shipmentsSaved,
    @JsonKey(name: 'samples_updated') required this.samplesUpdated,
  });

  factory _$ResultDeliverySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDeliverySummaryImplFromJson(json);

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
  @override
  @JsonKey(name: 'samples_updated')
  final int? samplesUpdated;

  @override
  String toString() {
    return 'ResultDeliverySummary(routesProcessed: $routesProcessed, routesSaved: $routesSaved, approvalsSaved: $approvalsSaved, shipmentsSaved: $shipmentsSaved, samplesUpdated: $samplesUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDeliverySummaryImpl &&
            (identical(other.routesProcessed, routesProcessed) ||
                other.routesProcessed == routesProcessed) &&
            (identical(other.routesSaved, routesSaved) ||
                other.routesSaved == routesSaved) &&
            (identical(other.approvalsSaved, approvalsSaved) ||
                other.approvalsSaved == approvalsSaved) &&
            (identical(other.shipmentsSaved, shipmentsSaved) ||
                other.shipmentsSaved == shipmentsSaved) &&
            (identical(other.samplesUpdated, samplesUpdated) ||
                other.samplesUpdated == samplesUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    routesProcessed,
    routesSaved,
    approvalsSaved,
    shipmentsSaved,
    samplesUpdated,
  );

  /// Create a copy of ResultDeliverySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDeliverySummaryImplCopyWith<_$ResultDeliverySummaryImpl>
  get copyWith =>
      __$$ResultDeliverySummaryImplCopyWithImpl<_$ResultDeliverySummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDeliverySummaryImplToJson(this);
  }
}

abstract class _ResultDeliverySummary implements ResultDeliverySummary {
  const factory _ResultDeliverySummary({
    @JsonKey(name: 'routes_processed') required final int? routesProcessed,
    @JsonKey(name: 'routes_saved') required final int? routesSaved,
    @JsonKey(name: 'approvals_saved') required final int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required final int? shipmentsSaved,
    @JsonKey(name: 'samples_updated') required final int? samplesUpdated,
  }) = _$ResultDeliverySummaryImpl;

  factory _ResultDeliverySummary.fromJson(Map<String, dynamic> json) =
      _$ResultDeliverySummaryImpl.fromJson;

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
  @JsonKey(name: 'samples_updated')
  int? get samplesUpdated;

  /// Create a copy of ResultDeliverySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDeliverySummaryImplCopyWith<_$ResultDeliverySummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResultDeliveryError _$ResultDeliveryErrorFromJson(Map<String, dynamic> json) {
  return _ResultDeliveryError.fromJson(json);
}

/// @nodoc
mixin _$ResultDeliveryError {
  @JsonKey(name: 'route_no')
  String? get routeNo => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  /// Serializes this ResultDeliveryError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDeliveryError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDeliveryErrorCopyWith<ResultDeliveryError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDeliveryErrorCopyWith<$Res> {
  factory $ResultDeliveryErrorCopyWith(
    ResultDeliveryError value,
    $Res Function(ResultDeliveryError) then,
  ) = _$ResultDeliveryErrorCopyWithImpl<$Res, ResultDeliveryError>;
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String? routeNo,
    String? message,
    String? details,
  });
}

/// @nodoc
class _$ResultDeliveryErrorCopyWithImpl<$Res, $Val extends ResultDeliveryError>
    implements $ResultDeliveryErrorCopyWith<$Res> {
  _$ResultDeliveryErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDeliveryError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
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
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultDeliveryErrorImplCopyWith<$Res>
    implements $ResultDeliveryErrorCopyWith<$Res> {
  factory _$$ResultDeliveryErrorImplCopyWith(
    _$ResultDeliveryErrorImpl value,
    $Res Function(_$ResultDeliveryErrorImpl) then,
  ) = __$$ResultDeliveryErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String? routeNo,
    String? message,
    String? details,
  });
}

/// @nodoc
class __$$ResultDeliveryErrorImplCopyWithImpl<$Res>
    extends _$ResultDeliveryErrorCopyWithImpl<$Res, _$ResultDeliveryErrorImpl>
    implements _$$ResultDeliveryErrorImplCopyWith<$Res> {
  __$$ResultDeliveryErrorImplCopyWithImpl(
    _$ResultDeliveryErrorImpl _value,
    $Res Function(_$ResultDeliveryErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultDeliveryError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _$ResultDeliveryErrorImpl(
        routeNo: freezed == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDeliveryErrorImpl implements _ResultDeliveryError {
  const _$ResultDeliveryErrorImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    required this.message,
    required this.details,
  });

  factory _$ResultDeliveryErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDeliveryErrorImplFromJson(json);

  @override
  @JsonKey(name: 'route_no')
  final String? routeNo;
  @override
  final String? message;
  @override
  final String? details;

  @override
  String toString() {
    return 'ResultDeliveryError(routeNo: $routeNo, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDeliveryErrorImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, routeNo, message, details);

  /// Create a copy of ResultDeliveryError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDeliveryErrorImplCopyWith<_$ResultDeliveryErrorImpl> get copyWith =>
      __$$ResultDeliveryErrorImplCopyWithImpl<_$ResultDeliveryErrorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDeliveryErrorImplToJson(this);
  }
}

abstract class _ResultDeliveryError implements ResultDeliveryError {
  const factory _ResultDeliveryError({
    @JsonKey(name: 'route_no') required final String? routeNo,
    required final String? message,
    required final String? details,
  }) = _$ResultDeliveryErrorImpl;

  factory _ResultDeliveryError.fromJson(Map<String, dynamic> json) =
      _$ResultDeliveryErrorImpl.fromJson;

  @override
  @JsonKey(name: 'route_no')
  String? get routeNo;
  @override
  String? get message;
  @override
  String? get details;

  /// Create a copy of ResultDeliveryError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDeliveryErrorImplCopyWith<_$ResultDeliveryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
