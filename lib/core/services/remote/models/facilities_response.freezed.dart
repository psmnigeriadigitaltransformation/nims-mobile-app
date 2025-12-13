// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facilities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model',
);

FacilitiesResponse _$FacilitiesResponseFromJson(Map<String, dynamic> json) {
  return _FacilitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilitiesResponse {
  @JsonKey(name: 'result_code')
  int? get resultCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  FacilitiesData? get data => throw _privateConstructorUsedError;

  /// Serializes this FacilitiesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FacilitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacilitiesResponseCopyWith<FacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilitiesResponseCopyWith<$Res> {
  factory $FacilitiesResponseCopyWith(
    FacilitiesResponse value,
    $Res Function(FacilitiesResponse) then,
  ) = _$FacilitiesResponseCopyWithImpl<$Res, FacilitiesResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    FacilitiesData? data,
  });

  $FacilitiesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FacilitiesResponseCopyWithImpl<$Res, $Val extends FacilitiesResponse>
    implements $FacilitiesResponseCopyWith<$Res> {
  _$FacilitiesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacilitiesResponse
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
                      as FacilitiesData?,
          )
          as $Val,
    );
  }

  /// Create a copy of FacilitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilitiesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $FacilitiesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FacilitiesResponseImplCopyWith<$Res>
    implements $FacilitiesResponseCopyWith<$Res> {
  factory _$$FacilitiesResponseImplCopyWith(
    _$FacilitiesResponseImpl value,
    $Res Function(_$FacilitiesResponseImpl) then,
  ) = __$$FacilitiesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'result_code') int? resultCode,
    String? status,
    String? message,
    FacilitiesData? data,
  });

  @override
  $FacilitiesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$FacilitiesResponseImplCopyWithImpl<$Res>
    extends _$FacilitiesResponseCopyWithImpl<$Res, _$FacilitiesResponseImpl>
    implements _$$FacilitiesResponseImplCopyWith<$Res> {
  __$$FacilitiesResponseImplCopyWithImpl(
    _$FacilitiesResponseImpl _value,
    $Res Function(_$FacilitiesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacilitiesResponse
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
      _$FacilitiesResponseImpl(
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
                  as FacilitiesData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilitiesResponseImpl implements _FacilitiesResponse {
  const _$FacilitiesResponseImpl({
    @JsonKey(name: 'result_code') this.resultCode,
    this.status,
    this.message,
    this.data,
  });

  factory _$FacilitiesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilitiesResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result_code')
  final int? resultCode;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final FacilitiesData? data;

  @override
  String toString() {
    return 'FacilitiesResponse(resultCode: $resultCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilitiesResponseImpl &&
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

  /// Create a copy of FacilitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilitiesResponseImplCopyWith<_$FacilitiesResponseImpl> get copyWith =>
      __$$FacilitiesResponseImplCopyWithImpl<_$FacilitiesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilitiesResponseImplToJson(this);
  }
}

abstract class _FacilitiesResponse implements FacilitiesResponse {
  const factory _FacilitiesResponse({
    @JsonKey(name: 'result_code') final int? resultCode,
    final String? status,
    final String? message,
    final FacilitiesData? data,
  }) = _$FacilitiesResponseImpl;

  factory _FacilitiesResponse.fromJson(Map<String, dynamic> json) =
      _$FacilitiesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result_code')
  int? get resultCode;
  @override
  String? get status;
  @override
  String? get message;
  @override
  FacilitiesData? get data;

  /// Create a copy of FacilitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacilitiesResponseImplCopyWith<_$FacilitiesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FacilitiesData _$FacilitiesDataFromJson(Map<String, dynamic> json) {
  return _FacilitiesData.fromJson(json);
}

/// @nodoc
mixin _$FacilitiesData {
  // @FacilityItemListConverter()
  @JsonKey(name: 'spoke_list')
  List<FacilityItem>? get spokeList => throw _privateConstructorUsedError; // @FacilityItemListConverter()
  @JsonKey(name: 'hub_list')
  List<FacilityItem>? get hubList => throw _privateConstructorUsedError; // @FacilityItemListConverter()
  @JsonKey(name: 'genexpert_list')
  List<FacilityItem>? get genexpertList => throw _privateConstructorUsedError; // @FacilityItemListConverter()
  @JsonKey(name: 'pcr_list')
  List<FacilityItem>? get pcrList => throw _privateConstructorUsedError;

  /// Serializes this FacilitiesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FacilitiesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacilitiesDataCopyWith<FacilitiesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilitiesDataCopyWith<$Res> {
  factory $FacilitiesDataCopyWith(
    FacilitiesData value,
    $Res Function(FacilitiesData) then,
  ) = _$FacilitiesDataCopyWithImpl<$Res, FacilitiesData>;
  @useResult
  $Res call({
    @JsonKey(name: 'spoke_list') List<FacilityItem>? spokeList,
    @JsonKey(name: 'hub_list') List<FacilityItem>? hubList,
    @JsonKey(name: 'genexpert_list') List<FacilityItem>? genexpertList,
    @JsonKey(name: 'pcr_list') List<FacilityItem>? pcrList,
  });
}

/// @nodoc
class _$FacilitiesDataCopyWithImpl<$Res, $Val extends FacilitiesData>
    implements $FacilitiesDataCopyWith<$Res> {
  _$FacilitiesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacilitiesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spokeList = freezed,
    Object? hubList = freezed,
    Object? genexpertList = freezed,
    Object? pcrList = freezed,
  }) {
    return _then(
      _value.copyWith(
            spokeList: freezed == spokeList
                ? _value.spokeList
                : spokeList // ignore: cast_nullable_to_non_nullable
                      as List<FacilityItem>?,
            hubList: freezed == hubList
                ? _value.hubList
                : hubList // ignore: cast_nullable_to_non_nullable
                      as List<FacilityItem>?,
            genexpertList: freezed == genexpertList
                ? _value.genexpertList
                : genexpertList // ignore: cast_nullable_to_non_nullable
                      as List<FacilityItem>?,
            pcrList: freezed == pcrList
                ? _value.pcrList
                : pcrList // ignore: cast_nullable_to_non_nullable
                      as List<FacilityItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacilitiesDataImplCopyWith<$Res>
    implements $FacilitiesDataCopyWith<$Res> {
  factory _$$FacilitiesDataImplCopyWith(
    _$FacilitiesDataImpl value,
    $Res Function(_$FacilitiesDataImpl) then,
  ) = __$$FacilitiesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'spoke_list') List<FacilityItem>? spokeList,
    @JsonKey(name: 'hub_list') List<FacilityItem>? hubList,
    @JsonKey(name: 'genexpert_list') List<FacilityItem>? genexpertList,
    @JsonKey(name: 'pcr_list') List<FacilityItem>? pcrList,
  });
}

/// @nodoc
class __$$FacilitiesDataImplCopyWithImpl<$Res>
    extends _$FacilitiesDataCopyWithImpl<$Res, _$FacilitiesDataImpl>
    implements _$$FacilitiesDataImplCopyWith<$Res> {
  __$$FacilitiesDataImplCopyWithImpl(
    _$FacilitiesDataImpl _value,
    $Res Function(_$FacilitiesDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacilitiesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spokeList = freezed,
    Object? hubList = freezed,
    Object? genexpertList = freezed,
    Object? pcrList = freezed,
  }) {
    return _then(
      _$FacilitiesDataImpl(
        spokeList: freezed == spokeList
            ? _value._spokeList
            : spokeList // ignore: cast_nullable_to_non_nullable
                  as List<FacilityItem>?,
        hubList: freezed == hubList
            ? _value._hubList
            : hubList // ignore: cast_nullable_to_non_nullable
                  as List<FacilityItem>?,
        genexpertList: freezed == genexpertList
            ? _value._genexpertList
            : genexpertList // ignore: cast_nullable_to_non_nullable
                  as List<FacilityItem>?,
        pcrList: freezed == pcrList
            ? _value._pcrList
            : pcrList // ignore: cast_nullable_to_non_nullable
                  as List<FacilityItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilitiesDataImpl implements _FacilitiesData {
  const _$FacilitiesDataImpl({
    @JsonKey(name: 'spoke_list') final List<FacilityItem>? spokeList,
    @JsonKey(name: 'hub_list') final List<FacilityItem>? hubList,
    @JsonKey(name: 'genexpert_list') final List<FacilityItem>? genexpertList,
    @JsonKey(name: 'pcr_list') final List<FacilityItem>? pcrList,
  }) : _spokeList = spokeList,
       _hubList = hubList,
       _genexpertList = genexpertList,
       _pcrList = pcrList;

  factory _$FacilitiesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilitiesDataImplFromJson(json);

  // @FacilityItemListConverter()
  final List<FacilityItem>? _spokeList;
  // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'spoke_list')
  List<FacilityItem>? get spokeList {
    final value = _spokeList;
    if (value == null) return null;
    if (_spokeList is EqualUnmodifiableListView) return _spokeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // @FacilityItemListConverter()
  final List<FacilityItem>? _hubList;
  // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'hub_list')
  List<FacilityItem>? get hubList {
    final value = _hubList;
    if (value == null) return null;
    if (_hubList is EqualUnmodifiableListView) return _hubList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // @FacilityItemListConverter()
  final List<FacilityItem>? _genexpertList;
  // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'genexpert_list')
  List<FacilityItem>? get genexpertList {
    final value = _genexpertList;
    if (value == null) return null;
    if (_genexpertList is EqualUnmodifiableListView) return _genexpertList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // @FacilityItemListConverter()
  final List<FacilityItem>? _pcrList;
  // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'pcr_list')
  List<FacilityItem>? get pcrList {
    final value = _pcrList;
    if (value == null) return null;
    if (_pcrList is EqualUnmodifiableListView) return _pcrList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FacilitiesData(spokeList: $spokeList, hubList: $hubList, genexpertList: $genexpertList, pcrList: $pcrList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilitiesDataImpl &&
            const DeepCollectionEquality().equals(
              other._spokeList,
              _spokeList,
            ) &&
            const DeepCollectionEquality().equals(other._hubList, _hubList) &&
            const DeepCollectionEquality().equals(
              other._genexpertList,
              _genexpertList,
            ) &&
            const DeepCollectionEquality().equals(other._pcrList, _pcrList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_spokeList),
    const DeepCollectionEquality().hash(_hubList),
    const DeepCollectionEquality().hash(_genexpertList),
    const DeepCollectionEquality().hash(_pcrList),
  );

  /// Create a copy of FacilitiesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilitiesDataImplCopyWith<_$FacilitiesDataImpl> get copyWith =>
      __$$FacilitiesDataImplCopyWithImpl<_$FacilitiesDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilitiesDataImplToJson(this);
  }
}

abstract class _FacilitiesData implements FacilitiesData {
  const factory _FacilitiesData({
    @JsonKey(name: 'spoke_list') final List<FacilityItem>? spokeList,
    @JsonKey(name: 'hub_list') final List<FacilityItem>? hubList,
    @JsonKey(name: 'genexpert_list') final List<FacilityItem>? genexpertList,
    @JsonKey(name: 'pcr_list') final List<FacilityItem>? pcrList,
  }) = _$FacilitiesDataImpl;

  factory _FacilitiesData.fromJson(Map<String, dynamic> json) =
      _$FacilitiesDataImpl.fromJson;

  // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'spoke_list')
  List<FacilityItem>? get spokeList; // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'hub_list')
  List<FacilityItem>? get hubList; // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'genexpert_list')
  List<FacilityItem>? get genexpertList; // @FacilityItemListConverter()
  @override
  @JsonKey(name: 'pcr_list')
  List<FacilityItem>? get pcrList;

  /// Create a copy of FacilitiesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacilitiesDataImplCopyWith<_$FacilitiesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FacilityItem _$FacilityItemFromJson(Map<String, dynamic> json) {
  return _FacilityItem.fromJson(json);
}

/// @nodoc
mixin _$FacilityItem {
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

  /// Serializes this FacilityItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FacilityItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacilityItemCopyWith<FacilityItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityItemCopyWith<$Res> {
  factory $FacilityItemCopyWith(
    FacilityItem value,
    $Res Function(FacilityItem) then,
  ) = _$FacilityItemCopyWithImpl<$Res, FacilityItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'facility_id') int? facilityId,
    @JsonKey(name: 'facility_code') String? facilityCode,
    @JsonKey(name: 'lab_code') String? labCode,
    @JsonKey(name: 'facility_name') String? facilityName,
    @JsonKey(name: 'geo_string') String? geoString,
  });
}

/// @nodoc
class _$FacilityItemCopyWithImpl<$Res, $Val extends FacilityItem>
    implements $FacilityItemCopyWith<$Res> {
  _$FacilityItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacilityItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityId = freezed,
    Object? facilityCode = freezed,
    Object? labCode = freezed,
    Object? facilityName = freezed,
    Object? geoString = freezed,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacilityItemImplCopyWith<$Res>
    implements $FacilityItemCopyWith<$Res> {
  factory _$$FacilityItemImplCopyWith(
    _$FacilityItemImpl value,
    $Res Function(_$FacilityItemImpl) then,
  ) = __$$FacilityItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'facility_id') int? facilityId,
    @JsonKey(name: 'facility_code') String? facilityCode,
    @JsonKey(name: 'lab_code') String? labCode,
    @JsonKey(name: 'facility_name') String? facilityName,
    @JsonKey(name: 'geo_string') String? geoString,
  });
}

/// @nodoc
class __$$FacilityItemImplCopyWithImpl<$Res>
    extends _$FacilityItemCopyWithImpl<$Res, _$FacilityItemImpl>
    implements _$$FacilityItemImplCopyWith<$Res> {
  __$$FacilityItemImplCopyWithImpl(
    _$FacilityItemImpl _value,
    $Res Function(_$FacilityItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacilityItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityId = freezed,
    Object? facilityCode = freezed,
    Object? labCode = freezed,
    Object? facilityName = freezed,
    Object? geoString = freezed,
  }) {
    return _then(
      _$FacilityItemImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityItemImpl implements _FacilityItem {
  const _$FacilityItemImpl({
    @JsonKey(name: 'facility_id') this.facilityId,
    @JsonKey(name: 'facility_code') this.facilityCode,
    @JsonKey(name: 'lab_code') this.labCode,
    @JsonKey(name: 'facility_name') this.facilityName,
    @JsonKey(name: 'geo_string') this.geoString,
  });

  factory _$FacilityItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityItemImplFromJson(json);

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
  String toString() {
    return 'FacilityItem(facilityId: $facilityId, facilityCode: $facilityCode, labCode: $labCode, facilityName: $facilityName, geoString: $geoString)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityItemImpl &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.facilityCode, facilityCode) ||
                other.facilityCode == facilityCode) &&
            (identical(other.labCode, labCode) || other.labCode == labCode) &&
            (identical(other.facilityName, facilityName) ||
                other.facilityName == facilityName) &&
            (identical(other.geoString, geoString) ||
                other.geoString == geoString));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    facilityId,
    facilityCode,
    labCode,
    facilityName,
    geoString,
  );

  /// Create a copy of FacilityItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityItemImplCopyWith<_$FacilityItemImpl> get copyWith =>
      __$$FacilityItemImplCopyWithImpl<_$FacilityItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityItemImplToJson(this);
  }
}

abstract class _FacilityItem implements FacilityItem {
  const factory _FacilityItem({
    @JsonKey(name: 'facility_id') final int? facilityId,
    @JsonKey(name: 'facility_code') final String? facilityCode,
    @JsonKey(name: 'lab_code') final String? labCode,
    @JsonKey(name: 'facility_name') final String? facilityName,
    @JsonKey(name: 'geo_string') final String? geoString,
  }) = _$FacilityItemImpl;

  factory _FacilityItem.fromJson(Map<String, dynamic> json) =
      _$FacilityItemImpl.fromJson;

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

  /// Create a copy of FacilityItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacilityItemImplCopyWith<_$FacilityItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
