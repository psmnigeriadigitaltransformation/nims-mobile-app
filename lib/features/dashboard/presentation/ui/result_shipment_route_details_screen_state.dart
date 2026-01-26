import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'result_shipment_route_details_screen_state.freezed.dart';

@freezed
class ResultShipmentRouteDetailsScreenState with _$ResultShipmentRouteDetailsScreenState {
  const factory ResultShipmentRouteDetailsScreenState({
    required ShipmentRoute route,
    required DomainShipment shipment,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    @Default(true) bool isLoading,
  }) = _ResultShipmentRouteDetailsScreenState;
}
