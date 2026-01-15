import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/dashboard_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/dashboard_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/route_details_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/routes_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/route_details_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/routes_screen_state_notifier.dart';

import '../../core/services/remote/models/login_response.dart';
import '../auth/data/providers.dart';

final dashboardScreenStateNotifierProvider =
AsyncNotifierProvider.autoDispose<DashboardScreenStateNotifier, DashboardScreenState>(
  DashboardScreenStateNotifier.new,
);

final routeDetailsScreenStateNotifierProvider =
    AsyncNotifierProvider.family<
      RouteDetailsScreenStateNotifier,
      RouteDetailsScreenState,
      ShipmentRoute
    >(RouteDetailsScreenStateNotifier.new);

final routesScreenStateNotifierProvider =
    AsyncNotifierProvider.autoDispose<RoutesScreenStateNotifier, RoutesScreenState>(
      RoutesScreenStateNotifier.new,
    );
