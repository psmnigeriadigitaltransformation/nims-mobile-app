import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/manifest.dart';
import 'package:nims_mobile_app/core/domain/models/sample.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'specimen_shipment_details_screen_state.freezed.dart';

@freezed
class SpecimenShipmentDetailsScreenState with _$SpecimenShipmentDetailsScreenState {
  const factory SpecimenShipmentDetailsScreenState({
    required Shipment shipment,
    @Default([]) List<Sample> samples,
    ShipmentRoute? route,
    Manifest? manifest,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    @Default(true) bool isLoading,
  }) = _SpecimenShipmentDetailsScreenState;
}
