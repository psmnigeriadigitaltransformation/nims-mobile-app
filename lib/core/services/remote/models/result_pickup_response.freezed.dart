// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_pickup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResultPickupResponse _$ResultPickupResponseFromJson(Map<String, dynamic> json) {
  return _ResultPickupResponse.fromJson(json);
}

/// @nodoc
mixin _$ResultPickupResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ResultPickupData? get data => throw _privateConstructorUsedError;

  /// Serializes this ResultPickupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultPickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickupResponseCopyWith<ResultPickupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickupResponseCopyWith<$Res> {
  factory $ResultPickupResponseCopyWith(
    ResultPickupResponse value,
    $Res Function(ResultPickupResponse) then,
  ) = _$ResultPickupResponseCopyWithImpl<$Res, ResultPickupResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    ResultPickupData? data,
  });

  $ResultPickupDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResultPickupResponseCopyWithImpl<
  $Res,
  $Val extends ResultPickupResponse
>
    implements $ResultPickupResponseCopyWith<$Res> {
  _$ResultPickupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickupResponse
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
                      as ResultPickupData?,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultPickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultPickupDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ResultPickupDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultPickupResponseImplCopyWith<$Res>
    implements $ResultPickupResponseCopyWith<$Res> {
  factory _$$ResultPickupResponseImplCopyWith(
    _$ResultPickupResponseImpl value,
    $Res Function(_$ResultPickupResponseImpl) then,
  ) = __$$ResultPickupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    ResultPickupData? data,
  });

  @override
  $ResultPickupDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ResultPickupResponseImplCopyWithImpl<$Res>
    extends _$ResultPickupResponseCopyWithImpl<$Res, _$ResultPickupResponseImpl>
    implements _$$ResultPickupResponseImplCopyWith<$Res> {
  __$$ResultPickupResponseImplCopyWithImpl(
    _$ResultPickupResponseImpl _value,
    $Res Function(_$ResultPickupResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickupResponse
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
      _$ResultPickupResponseImpl(
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
                  as ResultPickupData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultPickupResponseImpl implements _ResultPickupResponse {
  const _$ResultPickupResponseImpl({
    @JsonKey(name: 'result_code') required this.resultCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory _$ResultPickupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultPickupResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final ResultPickupData? data;

  @override
  String toString() {
    return 'ResultPickupResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickupResponseImpl &&
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

  /// Create a copy of ResultPickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickupResponseImplCopyWith<_$ResultPickupResponseImpl>
  get copyWith =>
      __$$ResultPickupResponseImplCopyWithImpl<_$ResultPickupResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultPickupResponseImplToJson(this);
  }
}

abstract class _ResultPickupResponse implements ResultPickupResponse {
  const factory _ResultPickupResponse({
    @JsonKey(name: 'result_code') required final int? resultCode,
    required final String? status,
    required final String? message,
    required final ResultPickupData? data,
  }) = _$ResultPickupResponseImpl;

  factory _ResultPickupResponse.fromJson(Map<String, dynamic> json) =
      _$ResultPickupResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  ResultPickupData? get data;

  /// Create a copy of ResultPickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickupResponseImplCopyWith<_$ResultPickupResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResultPickupData _$ResultPickupDataFromJson(Map<String, dynamic> json) {
  return _ResultPickupData.fromJson(json);
}

/// @nodoc
mixin _$ResultPickupData {
  ResultPickupSummary? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'failed_routes')
  List<String>? get failedRoutes => throw _privateConstructorUsedError;
  List<ResultPickupError>? get errors => throw _privateConstructorUsedError;

  /// Serializes this ResultPickupData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultPickupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickupDataCopyWith<ResultPickupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickupDataCopyWith<$Res> {
  factory $ResultPickupDataCopyWith(
    ResultPickupData value,
    $Res Function(ResultPickupData) then,
  ) = _$ResultPickupDataCopyWithImpl<$Res, ResultPickupData>;
  @useResult
  $Res call({
    ResultPickupSummary? summary,
    @JsonKey(name: 'failed_routes') List<String>? failedRoutes,
    List<ResultPickupError>? errors,
  });

  $ResultPickupSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$ResultPickupDataCopyWithImpl<$Res, $Val extends ResultPickupData>
    implements $ResultPickupDataCopyWith<$Res> {
  _$ResultPickupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? failedRoutes = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as ResultPickupSummary?,
            failedRoutes: freezed == failedRoutes
                ? _value.failedRoutes
                : failedRoutes // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            errors: freezed == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<ResultPickupError>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultPickupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultPickupSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $ResultPickupSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultPickupDataImplCopyWith<$Res>
    implements $ResultPickupDataCopyWith<$Res> {
  factory _$$ResultPickupDataImplCopyWith(
    _$ResultPickupDataImpl value,
    $Res Function(_$ResultPickupDataImpl) then,
  ) = __$$ResultPickupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ResultPickupSummary? summary,
    @JsonKey(name: 'failed_routes') List<String>? failedRoutes,
    List<ResultPickupError>? errors,
  });

  @override
  $ResultPickupSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$ResultPickupDataImplCopyWithImpl<$Res>
    extends _$ResultPickupDataCopyWithImpl<$Res, _$ResultPickupDataImpl>
    implements _$$ResultPickupDataImplCopyWith<$Res> {
  __$$ResultPickupDataImplCopyWithImpl(
    _$ResultPickupDataImpl _value,
    $Res Function(_$ResultPickupDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? failedRoutes = freezed,
    Object? errors = freezed,
  }) {
    return _then(
      _$ResultPickupDataImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as ResultPickupSummary?,
        failedRoutes: freezed == failedRoutes
            ? _value._failedRoutes
            : failedRoutes // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        errors: freezed == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<ResultPickupError>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultPickupDataImpl implements _ResultPickupData {
  const _$ResultPickupDataImpl({
    required this.summary,
    @JsonKey(name: 'failed_routes') required final List<String>? failedRoutes,
    required final List<ResultPickupError>? errors,
  }) : _failedRoutes = failedRoutes,
       _errors = errors;

  factory _$ResultPickupDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultPickupDataImplFromJson(json);

  @override
  final ResultPickupSummary? summary;
  final List<String>? _failedRoutes;
  @override
  @JsonKey(name: 'failed_routes')
  List<String>? get failedRoutes {
    final value = _failedRoutes;
    if (value == null) return null;
    if (_failedRoutes is EqualUnmodifiableListView) return _failedRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ResultPickupError>? _errors;
  @override
  List<ResultPickupError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultPickupData(summary: $summary, failedRoutes: $failedRoutes, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickupDataImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(
              other._failedRoutes,
              _failedRoutes,
            ) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(_failedRoutes),
    const DeepCollectionEquality().hash(_errors),
  );

  /// Create a copy of ResultPickupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickupDataImplCopyWith<_$ResultPickupDataImpl> get copyWith =>
      __$$ResultPickupDataImplCopyWithImpl<_$ResultPickupDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultPickupDataImplToJson(this);
  }
}

abstract class _ResultPickupData implements ResultPickupData {
  const factory _ResultPickupData({
    required final ResultPickupSummary? summary,
    @JsonKey(name: 'failed_routes') required final List<String>? failedRoutes,
    required final List<ResultPickupError>? errors,
  }) = _$ResultPickupDataImpl;

  factory _ResultPickupData.fromJson(Map<String, dynamic> json) =
      _$ResultPickupDataImpl.fromJson;

  @override
  ResultPickupSummary? get summary;
  @override
  @JsonKey(name: 'failed_routes')
  List<String>? get failedRoutes;
  @override
  List<ResultPickupError>? get errors;

  /// Create a copy of ResultPickupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickupDataImplCopyWith<_$ResultPickupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultPickupSummary _$ResultPickupSummaryFromJson(Map<String, dynamic> json) {
  return _ResultPickupSummary.fromJson(json);
}

/// @nodoc
mixin _$ResultPickupSummary {
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

  /// Serializes this ResultPickupSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultPickupSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickupSummaryCopyWith<ResultPickupSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickupSummaryCopyWith<$Res> {
  factory $ResultPickupSummaryCopyWith(
    ResultPickupSummary value,
    $Res Function(ResultPickupSummary) then,
  ) = _$ResultPickupSummaryCopyWithImpl<$Res, ResultPickupSummary>;
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
class _$ResultPickupSummaryCopyWithImpl<$Res, $Val extends ResultPickupSummary>
    implements $ResultPickupSummaryCopyWith<$Res> {
  _$ResultPickupSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickupSummary
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
abstract class _$$ResultPickupSummaryImplCopyWith<$Res>
    implements $ResultPickupSummaryCopyWith<$Res> {
  factory _$$ResultPickupSummaryImplCopyWith(
    _$ResultPickupSummaryImpl value,
    $Res Function(_$ResultPickupSummaryImpl) then,
  ) = __$$ResultPickupSummaryImplCopyWithImpl<$Res>;
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
class __$$ResultPickupSummaryImplCopyWithImpl<$Res>
    extends _$ResultPickupSummaryCopyWithImpl<$Res, _$ResultPickupSummaryImpl>
    implements _$$ResultPickupSummaryImplCopyWith<$Res> {
  __$$ResultPickupSummaryImplCopyWithImpl(
    _$ResultPickupSummaryImpl _value,
    $Res Function(_$ResultPickupSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickupSummary
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
      _$ResultPickupSummaryImpl(
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
class _$ResultPickupSummaryImpl implements _ResultPickupSummary {
  const _$ResultPickupSummaryImpl({
    @JsonKey(name: 'routes_processed') required this.routesProcessed,
    @JsonKey(name: 'routes_saved') required this.routesSaved,
    @JsonKey(name: 'approvals_saved') required this.approvalsSaved,
    @JsonKey(name: 'shipments_saved') required this.shipmentsSaved,
    @JsonKey(name: 'samples_updated') required this.samplesUpdated,
  });

  factory _$ResultPickupSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultPickupSummaryImplFromJson(json);

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
    return 'ResultPickupSummary(routesProcessed: $routesProcessed, routesSaved: $routesSaved, approvalsSaved: $approvalsSaved, shipmentsSaved: $shipmentsSaved, samplesUpdated: $samplesUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickupSummaryImpl &&
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

  /// Create a copy of ResultPickupSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickupSummaryImplCopyWith<_$ResultPickupSummaryImpl> get copyWith =>
      __$$ResultPickupSummaryImplCopyWithImpl<_$ResultPickupSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultPickupSummaryImplToJson(this);
  }
}

abstract class _ResultPickupSummary implements ResultPickupSummary {
  const factory _ResultPickupSummary({
    @JsonKey(name: 'routes_processed') required final int? routesProcessed,
    @JsonKey(name: 'routes_saved') required final int? routesSaved,
    @JsonKey(name: 'approvals_saved') required final int? approvalsSaved,
    @JsonKey(name: 'shipments_saved') required final int? shipmentsSaved,
    @JsonKey(name: 'samples_updated') required final int? samplesUpdated,
  }) = _$ResultPickupSummaryImpl;

  factory _ResultPickupSummary.fromJson(Map<String, dynamic> json) =
      _$ResultPickupSummaryImpl.fromJson;

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

  /// Create a copy of ResultPickupSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickupSummaryImplCopyWith<_$ResultPickupSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultPickupError _$ResultPickupErrorFromJson(Map<String, dynamic> json) {
  return _ResultPickupError.fromJson(json);
}

/// @nodoc
mixin _$ResultPickupError {
  @JsonKey(name: 'route_no')
  String? get routeNo => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  /// Serializes this ResultPickupError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultPickupError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultPickupErrorCopyWith<ResultPickupError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultPickupErrorCopyWith<$Res> {
  factory $ResultPickupErrorCopyWith(
    ResultPickupError value,
    $Res Function(ResultPickupError) then,
  ) = _$ResultPickupErrorCopyWithImpl<$Res, ResultPickupError>;
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String? routeNo,
    String? code,
    String? message,
    String? details,
  });
}

/// @nodoc
class _$ResultPickupErrorCopyWithImpl<$Res, $Val extends ResultPickupError>
    implements $ResultPickupErrorCopyWith<$Res> {
  _$ResultPickupErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultPickupError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _value.copyWith(
            routeNo: freezed == routeNo
                ? _value.routeNo
                : routeNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ResultPickupErrorImplCopyWith<$Res>
    implements $ResultPickupErrorCopyWith<$Res> {
  factory _$$ResultPickupErrorImplCopyWith(
    _$ResultPickupErrorImpl value,
    $Res Function(_$ResultPickupErrorImpl) then,
  ) = __$$ResultPickupErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_no') String? routeNo,
    String? code,
    String? message,
    String? details,
  });
}

/// @nodoc
class __$$ResultPickupErrorImplCopyWithImpl<$Res>
    extends _$ResultPickupErrorCopyWithImpl<$Res, _$ResultPickupErrorImpl>
    implements _$$ResultPickupErrorImplCopyWith<$Res> {
  __$$ResultPickupErrorImplCopyWithImpl(
    _$ResultPickupErrorImpl _value,
    $Res Function(_$ResultPickupErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultPickupError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeNo = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _$ResultPickupErrorImpl(
        routeNo: freezed == routeNo
            ? _value.routeNo
            : routeNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
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
class _$ResultPickupErrorImpl implements _ResultPickupError {
  const _$ResultPickupErrorImpl({
    @JsonKey(name: 'route_no') required this.routeNo,
    required this.code,
    required this.message,
    required this.details,
  });

  factory _$ResultPickupErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultPickupErrorImplFromJson(json);

  @override
  @JsonKey(name: 'route_no')
  final String? routeNo;
  @override
  final String? code;
  @override
  final String? message;
  @override
  final String? details;

  @override
  String toString() {
    return 'ResultPickupError(routeNo: $routeNo, code: $code, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultPickupErrorImpl &&
            (identical(other.routeNo, routeNo) || other.routeNo == routeNo) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, routeNo, code, message, details);

  /// Create a copy of ResultPickupError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultPickupErrorImplCopyWith<_$ResultPickupErrorImpl> get copyWith =>
      __$$ResultPickupErrorImplCopyWithImpl<_$ResultPickupErrorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultPickupErrorImplToJson(this);
  }
}

abstract class _ResultPickupError implements ResultPickupError {
  const factory _ResultPickupError({
    @JsonKey(name: 'route_no') required final String? routeNo,
    required final String? code,
    required final String? message,
    required final String? details,
  }) = _$ResultPickupErrorImpl;

  factory _ResultPickupError.fromJson(Map<String, dynamic> json) =
      _$ResultPickupErrorImpl.fromJson;

  @override
  @JsonKey(name: 'route_no')
  String? get routeNo;
  @override
  String? get code;
  @override
  String? get message;
  @override
  String? get details;

  /// Create a copy of ResultPickupError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultPickupErrorImplCopyWith<_$ResultPickupErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
