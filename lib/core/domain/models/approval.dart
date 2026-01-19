import 'package:freezed_annotation/freezed_annotation.dart';

part 'approval.freezed.dart';
part 'approval.g.dart';

@freezed
class Approval with _$Approval {
  const factory Approval({
    int? id,
    @JsonKey(name: 'approval_no') required String approvalNo,
    @JsonKey(name: 'route_no') required String routeNo,
    @JsonKey(name: 'approval_type') required String approvalType,
    @JsonKey(name: 'full_name') required String fullname,
    required String phone,
    required String designation,
    required String signature,
    @JsonKey(name: 'sync_status') @Default('pending') String syncStatus,
    // @JsonKey(name: 'approval_date') String? approvalDate,
  }) = _Approval;

  factory Approval.fromJson(Map<String, dynamic> json) =>
      _$ApprovalFromJson(json);
}
