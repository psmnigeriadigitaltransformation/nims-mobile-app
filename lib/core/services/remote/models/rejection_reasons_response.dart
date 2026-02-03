import 'package:freezed_annotation/freezed_annotation.dart';

part 'rejection_reasons_response.freezed.dart';
part 'rejection_reasons_response.g.dart';

@freezed
class RejectionReasonsResponse with _$RejectionReasonsResponse {
  const factory RejectionReasonsResponse({
    @JsonKey(name: "result_code") required int? resultCode,
    required String? status,
    required String? message,
    required List<RejectionReasonItem>? data,
  }) = _RejectionReasonsResponse;

  factory RejectionReasonsResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectionReasonsResponseFromJson(json);
}

@freezed
class RejectionReasonItem with _$RejectionReasonItem {
  const factory RejectionReasonItem({
    required String? reason,
  }) = _RejectionReasonItem;

  factory RejectionReasonItem.fromJson(Map<String, dynamic> json) =>
      _$RejectionReasonItemFromJson(json);
}
