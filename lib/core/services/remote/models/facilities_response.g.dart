// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacilitiesResponseImpl _$$FacilitiesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FacilitiesResponseImpl(
  resultCode: (json['result_code'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : FacilitiesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$FacilitiesResponseImplToJson(
  _$FacilitiesResponseImpl instance,
) => <String, dynamic>{
  'result_code': instance.resultCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$FacilitiesDataImpl _$$FacilitiesDataImplFromJson(Map<String, dynamic> json) =>
    _$FacilitiesDataImpl(
      spokeList: (json['spoke_list'] as List<dynamic>?)
          ?.map((e) => FacilityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      hubList: (json['hub_list'] as List<dynamic>?)
          ?.map((e) => FacilityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      genexpertList: (json['genexpert_list'] as List<dynamic>?)
          ?.map((e) => FacilityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pcrList: (json['pcr_list'] as List<dynamic>?)
          ?.map((e) => FacilityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FacilitiesDataImplToJson(
  _$FacilitiesDataImpl instance,
) => <String, dynamic>{
  'spoke_list': instance.spokeList,
  'hub_list': instance.hubList,
  'genexpert_list': instance.genexpertList,
  'pcr_list': instance.pcrList,
};

_$FacilityItemImpl _$$FacilityItemImplFromJson(Map<String, dynamic> json) =>
    _$FacilityItemImpl(
      facilityId: (json['facility_id'] as num?)?.toInt(),
      facilityCode: json['facility_code'] as String?,
      labCode: json['lab_code'] as String?,
      facilityName: json['facility_name'] as String?,
      geoString: json['geo_string'] as String?,
    );

Map<String, dynamic> _$$FacilityItemImplToJson(_$FacilityItemImpl instance) =>
    <String, dynamic>{
      'facility_id': instance.facilityId,
      'facility_code': instance.facilityCode,
      'lab_code': instance.labCode,
      'facility_name': instance.facilityName,
      'geo_string': instance.geoString,
    };
