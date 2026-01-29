import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/dashboard/dashboard_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/dashboard/dashboard_screen_state.dart';




final dashboardScreenStateNotifierProvider =
AsyncNotifierProvider.autoDispose<DashboardScreenStateNotifier, DashboardScreenState>(
  DashboardScreenStateNotifier.new,
);





