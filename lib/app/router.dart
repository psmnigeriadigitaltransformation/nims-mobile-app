import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import 'package:projects/features/dashboard/presentation/dashboard_screen.dart';
import 'package:projects/features/dashboard/presentation/route_details_screen.dart';
import 'package:projects/features/pickup/presentation/specimen/add_new_manifest_screen.dart';
import 'package:projects/features/pickup/presentation/result/result_pickup_screen.dart';
import 'package:projects/features/pickup/presentation/specimen/shipments_screen.dart';
import 'package:projects/features/pickup/presentation/specimen/manifests_screen.dart';
import '../features/delivery/presentation/result/result_delivery_approval_screen.dart';
import '../features/delivery/presentation/specimen/specimen_delivery_approval_screen.dart';
import '../features/pickup/presentation/result/result_shipment_approval_screen.dart';
import '../features/pickup/presentation/specimen/specimen_shipment_approval_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/pickup/presentation/specimen/manifest_details_screen.dart';

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
        return ManifestsScreen(routeType: routeType);
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
        return ResultShipmentApprovalScreen(routeType: routeType);
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
        return SpecimenShipmentApprovalScreen(routeType: routeType);
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
      name: manifestDetailsScreen,
      path: manifestDetailsPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
              (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return ManifestDetailsScreen(routeType: routeType);
      },
    ),
    GoRoute(
      name: shipmentsScreen,
      path: shipmentsPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
              (type) => type.name == state.uri.queryParameters[routeTypeQueryParam],
          orElse: () => RouteType.spokeToPCRLabGeneXpert,
        );
        if (kDebugMode) {
          print(routeType);
        }
        return ShipmentsScreen(routeType: routeType);
      },
    ),
  ],
);
