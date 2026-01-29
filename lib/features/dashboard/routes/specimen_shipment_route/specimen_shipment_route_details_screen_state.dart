import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'specimen_shipment_route_details_screen_state.freezed.dart';

@freezed
class SpecimenShipmentRouteDetailsScreenState with _$SpecimenShipmentRouteDetailsScreenState {
  const factory SpecimenShipmentRouteDetailsScreenState({
    required ShipmentRoute route,
    @Default([]) List<Shipment> shipments,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    @Default(true) bool isLoading,
  }) = _RouteDetailsScreenState;
}
