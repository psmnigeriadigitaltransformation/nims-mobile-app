import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'result_shipment_details_screen_state.freezed.dart';

/// Parameters for result shipment details screen
class ResultShipmentDetailsParams {
  final Shipment shipment;
  final List<String> sampleCodes;

  const ResultShipmentDetailsParams({
    required this.shipment,
    this.sampleCodes = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultShipmentDetailsParams &&
          runtimeType == other.runtimeType &&
          shipment.shipmentNo == other.shipment.shipmentNo;

  @override
  int get hashCode => shipment.shipmentNo.hashCode;
}

@freezed
class ResultShipmentDetailsScreenState with _$ResultShipmentDetailsScreenState {
  const factory ResultShipmentDetailsScreenState({
    required Shipment shipment,
    @Default([]) List<LabResult> results,
    ShipmentRoute? route,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    @Default(true) bool isLoading,
  }) = _ResultShipmentDetailsScreenState;
}
