import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/ui/widgets/nims_alert_dialog.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import 'package:projects/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:projects/features/dashboard/presentation/ui/route_details_screen.dart';
import 'package:projects/features/facilities/presentation/ui/facilities_screen.dart';
import 'package:projects/features/pickup/presentation/ui/widgets/shipments_screen.dart';
import 'package:projects/features/profile/presentation/ui/profile_screen.dart';
import '../features/auth/presentation/ui/login/login_screen.dart';
import '../features/delivery/presentation/ui/result_delivery_approval_screen.dart';
import '../features/delivery/presentation/ui/specimen_delivery_approval_screen.dart';
import '../core/ui/widgets/sticky_header_delegate.dart';
import '../features/pickup/presentation/ui/widgets/add_new_manifest_screen.dart';
import '../features/pickup/presentation/ui/widgets/manifests_screen.dart';
import '../features/pickup/presentation/ui/widgets/result_pickup_screen.dart';
import '../features/pickup/presentation/ui/widgets/result_shipment_approval_screen.dart';
import '../features/pickup/presentation/ui/widgets/shipment_details_screen.dart';
import '../features/pickup/presentation/ui/widgets/specimen_shipment_approval_screen.dart';

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
      builder: (context, state) => FacilitiesScreen(),
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
        final movementTypeJson =
            state.uri.queryParameters[movementTypeQueryParam];
        if (movementTypeJson == null) {
          return NIMSAlertDialog(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );

          return ManifestsScreen(movementType: movementType);
        }
      },
    ),
    GoRoute(
      name: resultPickUpScreen,
      path: resultPickUpPath,
      builder: (context, state) {
        final movementTypeJson =
        state.uri.queryParameters[movementTypeQueryParam];
        if (movementTypeJson == null) {
          return NIMSAlertDialog(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );
          return ResultPickUpScreen(movementType: movementType);
        }

      },
    ),
    GoRoute(
      name: resultDispatchApprovalScreen,
      path: resultDispatchApprovalPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) =>
              type.name == state.uri.queryParameters[movementTypeQueryParam],
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
          (type) =>
              type.name == state.uri.queryParameters[movementTypeQueryParam],
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
          (type) =>
              type.name == state.uri.queryParameters[movementTypeQueryParam],
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
          (type) =>
              type.name == state.uri.queryParameters[movementTypeQueryParam],
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

        final movementTypeJson =
        state.uri.queryParameters[movementTypeQueryParam];
        if (movementTypeJson == null) {
          return NIMSAlertDialog(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );
          return AddNewManifestScreen(movementType: movementType);
        }
      },
    ),
    GoRoute(
      name: routeDetailsScreen,
      path: routeDetailsPath,
      builder: (context, state) {
        final routeType = RouteType.values.firstWhere(
          (type) =>
              type.name == state.uri.queryParameters[movementTypeQueryParam],
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
          (type) =>
              type.name == state.uri.queryParameters[movementTypeQueryParam],
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
        final movementTypeJson =
        state.uri.queryParameters[movementTypeQueryParam];
        if (movementTypeJson == null) {
          return NIMSAlertDialog(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );
          return ShipmentsScreen(movementType: movementType);
        }
      },
    ),
  ],
);
