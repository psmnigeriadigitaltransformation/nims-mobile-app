import 'package:go_router/go_router.dart';

import '../core/ui/screens/textstyles_visualization_screen.dart';

const loginRoute = '/login';

final router = GoRouter(
  initialLocation: loginRoute,
  routes: [
    GoRoute(path: loginRoute, builder: (context, state) => TextStylesVisualizationScreen()),
  ],
);
