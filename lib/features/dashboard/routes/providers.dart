import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/dashboard/routes/routes_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/routes/routes_screen_state_notifier.dart';

final routesScreenStateNotifierProvider =
AsyncNotifierProvider.autoDispose<RoutesScreenStateNotifier, RoutesScreenState>(
  RoutesScreenStateNotifier.new,
);



