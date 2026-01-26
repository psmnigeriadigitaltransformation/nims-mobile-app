import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/sample.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'shipment_details_screen_state.freezed.dart';

@freezed
class ShipmentDetailsScreenState with _$ShipmentDetailsScreenState {
  const factory ShipmentDetailsScreenState({
    required Shipment shipment,
    @Default([]) List<Sample> samples,
    ShipmentRoute? route,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    @Default(true) bool isLoading,
  }) = _ShipmentDetailsScreenState;
}
