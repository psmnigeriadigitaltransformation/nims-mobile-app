import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/model/shipment_details_screen_state.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/model/shipments_screen_state.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/shipment_details_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/shipments_screen_state_notifier.dart';

final shipmentsScreenStateNotifierProvider =
    AsyncNotifierProvider.autoDispose<ShipmentsScreenStateNotifier, ShipmentsScreenState>(
      ShipmentsScreenStateNotifier.new,
    );

final shipmentDetailsScreenStateNotifierProvider = AsyncNotifierProvider.family<
    ShipmentDetailsScreenStateNotifier,
    ShipmentDetailsScreenState,
    Shipment>(
  ShipmentDetailsScreenStateNotifier.new,
);
