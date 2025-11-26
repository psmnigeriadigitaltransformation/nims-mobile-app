import 'package:go_router/go_router.dart';
import 'package:projects/features/dashboard/presentation/dashboard_screen.dart';

import '../features/auth/presentation/login_screen.dart';

const loginScreen = '/login_screen';
const loginPath = '/login';

const dashboardScreen = '/dashboard_screen';
const dashboardPath = '/dashboard';

final router = GoRouter(
  initialLocation: loginPath,
  routes: [
    GoRoute(
      name: loginScreen,
      path: loginPath,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      name: dashboardScreen,
      path: dashboardPath,
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
