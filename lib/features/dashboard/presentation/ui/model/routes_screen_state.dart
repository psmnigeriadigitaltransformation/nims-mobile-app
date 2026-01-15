import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';

part 'routes_screen_state.freezed.dart';

@freezed
class RoutesScreenState with _$RoutesScreenState {
  const factory RoutesScreenState({
    @Default([]) List<ShipmentRoute> routes,
    @Default([]) List<ShipmentRoute> filteredRoutes,
    @Default('') String searchQuery,
    @Default(true) bool isLoading,
  }) = _RoutesScreenState;
}
