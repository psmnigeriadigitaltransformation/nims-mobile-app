import 'package:freezed_annotation/freezed_annotation.dart';

part 'rejection_reason.freezed.dart';
part 'rejection_reason.g.dart';

@freezed
class RejectionReason with _$RejectionReason {
  const factory RejectionReason({
    int? id,
    required String reason,
  }) = _RejectionReason;

  factory RejectionReason.fromJson(Map<String, dynamic> json) =>
      _$RejectionReasonFromJson(json);
}
