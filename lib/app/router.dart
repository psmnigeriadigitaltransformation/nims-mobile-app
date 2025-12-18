import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/ui/widgets/nims_error_content.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import 'package:projects/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:projects/features/dashboard/presentation/ui/route_details_screen.dart';
import 'package:projects/features/facilities/presentation/ui/facilities_screen.dart';
import 'package:projects/features/pickup/presentation/ui/widgets/shipment_screen.dart';
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
          return NIMSErrorContent(
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
          return NIMSErrorContent(
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
        final movementTypeJson =
            state.uri.queryParameters[movementTypeQueryParam];
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];
        final pickupFacilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];
        final destinationFacilityJson =
            state.uri.queryParameters[destinationFacilityQueryParam];

        developer.log(
          movementTypeJson.toString(),
          name: "GoRoute:specimenDispatchApprovalScreen:movementTypeJson",
        );
        developer.log(
          shipmentsJson.toString(),
          name: "GoRoute:specimenDispatchApprovalScreen:shipmentsJson",
        );
        developer.log(
          pickupFacilityJson.toString(),
          name: "GoRoute:specimenDispatchApprovalScreen:pickupFacilityJson",
        );
        developer.log(
          destinationFacilityJson.toString(),
          name:
              "GoRoute:specimenDispatchApprovalScreen:destinationFacilityJson",
        );

        if (movementTypeJson == null ||
            shipmentsJson == null ||
            pickupFacilityJson == null ||
            destinationFacilityJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );
          final pickupFacility = DomainFacility.fromJson(
            jsonDecode(pickupFacilityJson),
          );
          final destinationFacility = DomainFacility.fromJson(
            jsonDecode(destinationFacilityJson),
          );
          final shipments = List<DomainShipment>.from(
            jsonDecode(
              shipmentsJson,
            ).map((shipmentJson) => DomainShipment.fromJson(shipmentJson)),
          );

          return SpecimenShipmentApprovalScreen(
            movementType: movementType,
            pickUpFacility: pickupFacility,
            shipments: shipments,
            destinationFacility: destinationFacility,
          );
        }
      },
    ),
    GoRoute(
      name: specimenDeliveryApprovalScreen,
      path: specimenDeliveryApprovalPath,
      builder: (context, state) {
        final movementTypeJson =
            state.uri.queryParameters[movementTypeQueryParam];
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];
        final pickupFacilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];
        final destinationFacilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];

        developer.log(
          movementTypeJson.toString(),
          name: "GoRoute:specimenDispatchApprovalScreen:movementTypeJson",
        );
        developer.log(
          shipmentsJson.toString(),
          name: "GoRoute:specimenDispatchApprovalScreen:shipmentsJson",
        );
        developer.log(
          pickupFacilityJson.toString(),
          name: "GoRoute:specimenDispatchApprovalScreen:pickupFacilityJson",
        );
        developer.log(
          destinationFacilityJson.toString(),
          name:
              "GoRoute:specimenDispatchApprovalScreen:destinationFacilityJson",
        );

        if (movementTypeJson == null ||
            shipmentsJson == null ||
            pickupFacilityJson == null ||
            destinationFacilityJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );
          final pickupFacility = DomainFacility.fromJson(
            jsonDecode(pickupFacilityJson),
          );
          final destinationFacility = DomainFacility.fromJson(
            jsonDecode(destinationFacilityJson),
          );
          final shipments = List<DomainShipment>.from(
            jsonDecode(
              shipmentsJson,
            ).map((shipmentJson) => DomainShipment.fromJson(shipmentJson)),
          );

          return SpecimenDeliveryApprovalScreen(
            movementType: movementType,
            pickUpFacility: pickupFacility,
            shipments: shipments,
          );
        }
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
        final pickUpFacilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];
        if (movementTypeJson == null || pickUpFacilityJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );
          final pickUpFacility = DomainFacility.fromJson(
            jsonDecode(pickUpFacilityJson),
          );
          return AddNewManifestScreen(
            movementType: movementType,
            pickUpFacility: pickUpFacility,
          );
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
        final selectedManifestsJson =
            state.uri.queryParameters[manifestsQueryParam];
        final facilityJson = state.uri.queryParameters[pickupFacilityQueryParam];

        developer.log(
          movementTypeJson.toString(),
          name: "GoRoute:shipmentsScreen:movementTypeJson",
        );
        developer.log(
          selectedManifestsJson.toString(),
          name: "GoRoute:shipmentsScreen:selectedManifestsJson",
        );
        developer.log(
          facilityJson.toString(),
          name: "GoRoute:shipmentsScreen:facilityJson",
        );
        if (movementTypeJson == null ||
            selectedManifestsJson == null ||
            facilityJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
          );
          final manifests = List<DomainManifest>.from(
            jsonDecode(
              selectedManifestsJson,
            ).map((manifestJson) => DomainManifest.fromJson(manifestJson)),
          );
          developer.log(manifests.toString(), name: "manifests");
          final facility = DomainFacility.fromJson(jsonDecode(facilityJson));
          developer.log(manifests.toString(), name: "facility");

          return ShipmentScreen(
            movementType: movementType,
            manifests: manifests,
            pickUpFacility: facility,
          );
        }
      },
    ),
  ],
);
