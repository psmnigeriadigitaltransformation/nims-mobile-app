import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import 'package:projects/features/dashboard/presentation/dashboard_screen.dart';
import 'package:projects/features/dashboard/presentation/dashboard_manifest_details_screen.dart';
import 'package:projects/features/dashboard/presentation/route_details_screen.dart';
import 'package:projects/features/pickup/presentation/specimen/add_new_manifest_screen.dart';
import 'package:projects/features/pickup/presentation/result/result_pickup_screen.dart';
import 'package:projects/features/pickup/presentation/specimen/specimen_pickup_screen.dart';
import '../features/delivery/presentation/result/result_delivery_approval_screen.dart';
import '../features/delivery/presentation/specimen/specimen_delivery_approval_screen.dart';
import '../features/pickup/presentation/result/result_dispatch_approval_screen.dart';
import '../features/pickup/presentation/specimen/specimen_dispatch_approval_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/pickup/presentation/specimen/dispatch_approval_manifest_details_screen.dart';

final router = GoRouter(
  initialLocation: loginPath,
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
      name: specimenPickUpScreen,
      path: specimenPickUpPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return SpecimenPickUpScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: resultPickUpScreen,
      path: resultPickUpPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.geneXpertToSpoke,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return ResultPickUpScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: resultDispatchApprovalScreen,
      path: resultDispatchApprovalPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.geneXpertToSpoke,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return ResultDispatchApprovalScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: specimenDispatchApprovalScreen,
      path: specimenDispatchApprovalPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return SpecimenDispatchApprovalScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: specimenDeliveryApprovalScreen,
      path: specimenDeliveryApprovalPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return SpecimenDeliveryApprovalScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: resultDeliveryApprovalScreen,
      path: resultDeliveryApprovalPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return ResultDeliveryApprovalScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: addNewManifestScreen,
      path: addNewManifestPath,
      builder: (context, state) {
        return AddNewManifestScreen();
      },
    ),
    GoRoute(
      name: routeDetailsScreen,
      path: routeDetailsPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return RouteDetailsScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: dashboardManifestDetailsScreen,
      path: dashboardManifestDetailsPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return DashboardManifestDetailsScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: dispatchApprovalManifestDetailsScreen,
      path: dispatchApprovalManifestDetailsPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
              (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return DispatchApprovalManifestDetailsScreen(routeType: routeType);
      },
    ),
  ],
);
