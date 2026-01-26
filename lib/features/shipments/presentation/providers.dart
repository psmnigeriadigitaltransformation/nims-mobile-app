import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/models/result_shipment_details_screen_state.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/models/shipment_details_screen_state.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/models/shipments_screen_state.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/notifiers/result_shipment_details_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/notifiers/specimen_shipment_details_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/notifiers/shipments_screen_state_notifier.dart';

final shipmentsScreenStateNotifierProvider =
    AsyncNotifierProvider.autoDispose<ShipmentsScreenStateNotifier, ShipmentsScreenState>(
      ShipmentsScreenStateNotifier.new,
    );

final specimenShipmentDetailsScreenStateNotifierProvider = AsyncNotifierProvider.family<
    ShipmentDetailsScreenStateNotifier,
    ShipmentDetailsScreenState,
    Shipment>(
  ShipmentDetailsScreenStateNotifier.new,
);

final resultShipmentDetailsScreenStateNotifierProvider = AsyncNotifierProvider.family<
    ResultShipmentDetailsScreenStateNotifier,
    ResultShipmentDetailsScreenState,
    ResultShipmentDetailsParams>(
  ResultShipmentDetailsScreenStateNotifier.new,
);
