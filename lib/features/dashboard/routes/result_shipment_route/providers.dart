import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/dashboard/routes/result_shipment_route/result_shipment_route_details_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/routes/result_shipment_route/result_shipment_route_details_screen_state_notifier.dart';

import '../../../../core/domain/models/shipment_route.dart';

final resultShipmentRouteDetailsScreenStateNotifierProvider =
AsyncNotifierProvider.family<
    ResultShipmentRouteDetailsScreenStateNotifier,
    ResultShipmentRouteDetailsScreenState,
    ShipmentRoute
>(ResultShipmentRouteDetailsScreenStateNotifier.new);