import 'package:freezed_annotation/freezed_annotation.dart';

part 'etoken_response.freezed.dart';
part 'etoken_response.g.dart';

@freezed
class ETokenResponse with _$ETokenResponse {
  const factory ETokenResponse({
    @JsonKey(name: 'result_code') required int? resultCode,
    required String? status,
    required String? message,
    required List<ETokenData>? data,
  }) = _ETokenResponse;

  factory ETokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ETokenResponseFromJson(json);
}

@freezed
class ETokenData with _$ETokenData {
  const factory ETokenData({
    @JsonKey(name: 'etoken_id') required String? etokenId,
    @JsonKey(name: 'serial_no') required String? serialNo,
  }) = _ETokenData;

  factory ETokenData.fromJson(Map<String, dynamic> json) =>
      _$ETokenDataFromJson(json);
}
