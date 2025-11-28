import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import 'package:projects/features/dashboard/presentation/dashboard_screen.dart';
import 'package:projects/features/pickup/presentation/pickup_screen.dart';
import '../features/auth/presentation/login_screen.dart';

final router = GoRouter(
  initialLocation: pickUpPath,
  routes: [
    GoRoute(
      name: loginScreen,
      path: loginPath,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: dashboardScreen,
      path: dashboardPath,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      name: pickUpScreen,
      path: pickUpPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.geneXpertToSpoke,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return PickUpScreen(routeType: routeType,);
      },
    ),
  ],
);
