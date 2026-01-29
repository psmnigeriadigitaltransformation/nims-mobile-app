import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/shipments_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/shipments_screen_state_notifier.dart';

final shipmentsScreenStateNotifierProvider =
AsyncNotifierProvider.autoDispose<ShipmentsScreenStateNotifier, ShipmentsScreenState>(
  ShipmentsScreenStateNotifier.new,
);