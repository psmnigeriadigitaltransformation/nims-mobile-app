import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/dashboard/facilities/facilities_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/dashboard/facilities/facilities_screen_state.dart';

final facilitiesScreenStateNotifierProvider =
AsyncNotifierProvider.autoDispose<FacilitiesScreenStateNotifier, FacilitiesScreenState>(
  FacilitiesScreenStateNotifier.new,
);