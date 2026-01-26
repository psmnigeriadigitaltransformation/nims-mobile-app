import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'routes_screen_state.freezed.dart';

@freezed
class RoutesScreenState with _$RoutesScreenState {
  const factory RoutesScreenState({
    @Default([]) List<RouteWithShipments> routes,
    @Default([]) List<RouteWithShipments> filteredRoutes,
    @Default('') String searchQuery,
    @Default(true) bool isLoading,
  }) = _RoutesScreenState;
}

/// A helper class to hold a route along with its shipments
class RouteWithShipments {
  final ShipmentRoute route;
  final List<Shipment> shipments;

  RouteWithShipments({
    required this.route,
    required this.shipments,
  });

  /// Number of shipments in this route
  int get shipmentCount => shipments.length;

  /// Total sample count across all shipments
  int get totalSampleCount => shipments.fold(0, (sum, s) => sum + s.sampleCount);

  /// Payload type (specimen or result) - returns the most common type
  String? get payloadType {
    if (shipments.isEmpty) return null;
    // Return the payload type of the first shipment
    // (typically all shipments in a route have the same type)
    return shipments.first.payloadType;
  }

  /// Route number
  String get routeNo => route.routeNo;

  /// Origin facility name
  String get originFacilityName => route.originFacilityName;

  /// Destination facility name
  String get destinationFacilityName => route.destinationFacilityName;

  /// Sync status
  String get syncStatus => route.syncStatus;

  /// LSP code
  String get lspCode => route.lspCode;
}
