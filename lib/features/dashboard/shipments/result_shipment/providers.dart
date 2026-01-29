import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/result_shipment/result_shipment_details_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/result_shipment/result_shipment_details_screen_state_notifier.dart';

final resultShipmentDetailsScreenStateNotifierProvider = AsyncNotifierProvider.family<
    ResultShipmentDetailsScreenStateNotifier,
    ResultShipmentDetailsScreenState,
    ResultShipmentDetailsParams>(
  ResultShipmentDetailsScreenStateNotifier.new,
);
