import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import 'package:projects/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:projects/features/dashboard/presentation/ui/route_details_screen.dart';
import 'package:projects/features/facilities/presentation/ui/facilities_screen.dart';
import 'package:projects/features/pickup/presentation/ui/result_pickup_screen.dart';
import 'package:projects/features/pickup/presentation/ui/shipments_screen.dart';
import 'package:projects/features/profile/presentation/ui/profile_screen.dart';
import '../features/auth/presentation/ui/login/login_screen.dart';
import '../features/delivery/presentation/ui/result_delivery_approval_screen.dart';
import '../features/delivery/presentation/ui/specimen_delivery_approval_screen.dart';
import '../core/ui/widgets/sticky_header_delegate.dart';
import '../features/pickup/presentation/ui/add_new_manifest_screen.dart';
import '../features/pickup/presentation/ui/manifests_screen.dart';
import '../features/pickup/presentation/ui/result_shipment_approval_screen.dart';
import '../features/pickup/presentation/ui/shipment_details_screen.dart';
import '../features/pickup/presentation/ui/specimen_shipment_approval_screen.dart';

final router = GoRouter(
  initialLocation: loginPath,
  routes: [
    GoRoute(
      name: loginScreen,
      path: loginPath,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: dashboardScreen,
      path: dashboardPath,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      name: facilitiesScreen,
      path: facilitiesPath,
      builder: (context, state) => const FacilitiesScreen(),
    ),
    GoRoute(
      name: profileScreen,
      path: profilePath,
      builder: (context, state) => const ProfileScreen(),
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
        return ShipmentDetailsScreen(routeType: routeType);
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
