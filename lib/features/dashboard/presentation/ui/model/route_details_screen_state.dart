import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'route_details_screen_state.freezed.dart';

@freezed
class RouteDetailsScreenState with _$RouteDetailsScreenState {
  const factory RouteDetailsScreenState({
    required ShipmentRoute route,
    @Default([]) List<Shipment> shipments,
    Approval? pickupApproval,
    Approval? deliveryApproval,
    @Default(true) bool isLoading,
  }) = _RouteDetailsScreenState;
}
