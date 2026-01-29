import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/dashboard/routes/specimen_shipment_route/specimen_shipment_route_details_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/routes/specimen_shipment_route/specimen_shipment_route_details_screen_state_notifier.dart';

import '../../../../core/domain/models/shipment_route.dart';

final specimenShipmentRouteDetailsScreenStateNotifierProvider =
AsyncNotifierProvider.family<
    SpecimenShipmentRouteDetailsScreenStateNotifier,
    SpecimenShipmentRouteDetailsScreenState,
    ShipmentRoute
>(SpecimenShipmentRouteDetailsScreenStateNotifier.new);