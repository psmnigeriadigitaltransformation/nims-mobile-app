import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/specimen_shipment/specimen_shipment_details_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/specimen_shipment/specimen_shipment_details_screen_state_notifier.dart';

final specimenShipmentDetailsScreenStateNotifierProvider = AsyncNotifierProvider.family<
    ShipmentDetailsScreenStateNotifier,
    SpecimenShipmentDetailsScreenState,
    Shipment>(
  ShipmentDetailsScreenStateNotifier.new,
);

