import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/model/shipments_screen_state.dart';
import 'package:nims_mobile_app/features/shipments/presentation/ui/shipments_screen_state_notifier.dart';

final shipmentsScreenStateNotifierProvider =
AsyncNotifierProvider.autoDispose<ShipmentsScreenStateNotifier, ShipmentsScreenState>(
      ShipmentsScreenStateNotifier.new,
    );
