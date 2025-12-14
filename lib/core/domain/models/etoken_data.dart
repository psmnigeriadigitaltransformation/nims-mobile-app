import 'package:freezed_annotation/freezed_annotation.dart';

part 'etoken_data.freezed.dart';
part 'etoken_data.g.dart';

@freezed
class ETokenData with _$ETokenData {
  const factory ETokenData({
    required int? id,
    @JsonKey(name: 'etoken_id') required String? etokenId,
    @JsonKey(name: 'serial_no') required String? serialNo,
  }) = _ETokenData;

  factory ETokenData.fromJson(Map<String, dynamic> json) =>
      _$ETokenDataFromJson(json);
}
