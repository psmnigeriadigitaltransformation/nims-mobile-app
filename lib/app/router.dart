import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_error_content.dart';
import 'package:nims_mobile_app/features/dashboard/domain/route_type.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/route_details_screen.dart';
import 'package:nims_mobile_app/features/facilities/presentation/ui/facilities_screen.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/widgets/shipment_screen.dart';
import 'package:nims_mobile_app/features/profile/presentation/ui/profile_screen.dart';
import '../features/auth/presentation/ui/login/login_screen.dart';
import '../features/delivery/presentation/ui/result_delivery_approval_screen.dart';
import '../features/delivery/presentation/ui/specimen_delivery_approval_screen.dart';
import '../features/pickup/presentation/ui/widgets/add_new_manifest_screen.dart';
import '../features/pickup/presentation/ui/widgets/manifest_details_screen.dart';
import '../features/pickup/presentation/ui/widgets/manifests_screen.dart'
    as pickup_manifests_screen;
import '../features/manifests/presentation/ui/manifests_screen.dart'
    as manifests_screen;
import '../features/pickup/presentation/ui/widgets/result_pickup_screen.dart';
import '../features/pickup/presentation/ui/widgets/result_shipment_approval_screen.dart';
import '../features/pickup/presentation/ui/widgets/shipment_details_screen.dart';
import '../features/pickup/presentation/ui/widgets/specimen_shipment_approval_screen.dart';
import '../features/pickup/presentation/ui/widgets/shipment_success_screen.dart';
import '../features/delivery/presentation/ui/delivery_success_screen.dart';
import '../features/shipments/presentation/ui/shipments_screen.dart';
import '../features/shipments/presentation/ui/shipment_details_screen.dart'
    as shipment_details;
import '../features/dashboard/presentation/ui/routes_screen.dart';

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
      name: manifestsScreen,
      path: manifestsPath,
      builder: (context, state) {
        return manifests_screen.ManifestsScreen();
      },
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

          return pickup_manifests_screen.ManifestsScreen(
            movementType: movementType,
          );
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
        final destinationFacilityJson =
            state.uri.queryParameters[destinationFacilityQueryParam];
        final routeNo = state.uri.queryParameters[routeQueryParam];

        developer.log(
          movementTypeJson.toString(),
          name: "GoRoute:specimenDeliveryApprovalScreen:movementTypeJson",
        );
        developer.log(
          shipmentsJson.toString(),
          name: "GoRoute:specimenDeliveryApprovalScreen:shipmentsJson",
        );
        developer.log(
          destinationFacilityJson.toString(),
          name:
              "GoRoute:specimenDeliveryApprovalScreen:destinationFacilityJson",
        );
        developer.log(
          routeNo.toString(),
          name: "GoRoute:specimenDeliveryApprovalScreen:routeNo",
        );

        if (movementTypeJson == null ||
            shipmentsJson == null ||
            destinationFacilityJson == null ||
            routeNo == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final movementType = DomainMovementType.fromJson(
            jsonDecode(movementTypeJson),
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
            destinationFacility: destinationFacility,
            shipments: shipments,
            routeNo: routeNo,
          );
        }
      },
    ),
    GoRoute(
      name: resultDeliveryApprovalScreen,
      path: resultDeliveryApprovalPath,
      builder: (context, state) {
        final routeJson = state.uri.queryParameters[routeQueryParam];
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];
        final destinationFacilityJson = state.uri.queryParameters[destinationFacilityQueryParam];
        final sampleCodesJson = state.uri.queryParameters[sampleCodesQueryParam];

        if (routeJson == null ||
            shipmentsJson == null ||
            destinationFacilityJson == null ||
            sampleCodesJson == null) {
          return NIMSErrorContent(
            message: "Missing required parameters",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        }

        final route = ShipmentRoute.fromJson(jsonDecode(routeJson));
        final shipments = (jsonDecode(shipmentsJson) as List)
            .map((s) => Shipment.fromJson(s))
            .toList();
        final destinationFacility = Facility.fromJson(jsonDecode(destinationFacilityJson));
        final sampleCodes = (jsonDecode(sampleCodesJson) as List).cast<String>();

        return ResultDeliveryApprovalScreen(
          route: route,
          shipments: shipments,
          destinationFacility: destinationFacility,
          sampleCodes: sampleCodes,
        );
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
        final routeJson = state.uri.queryParameters[routeQueryParam];
        if (routeJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final route = DomainShipmentRoute.fromJson(jsonDecode(routeJson));
          return RouteDetailsScreen(route: route);
        }
      },
    ),
    GoRoute(
      name: manifestDetailsScreen,
      path: manifestDetailsPath,
      builder: (context, state) {
        final manifestJson = state.uri.queryParameters[manifestsQueryParam];
        if (manifestJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final manifest = DomainManifest.fromJson(jsonDecode(manifestJson));
          return ManifestDetailsScreen(manifest: manifest);
        }
      },
    ),
    GoRoute(
      name: shipmentScreen,
      path: shipmentPath,
      builder: (context, state) {
        final movementTypeJson =
            state.uri.queryParameters[movementTypeQueryParam];
        final selectedManifestsJson =
            state.uri.queryParameters[manifestsQueryParam];
        final facilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];

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
    GoRoute(
      name: shipmentsScreen,
      path: shipmentsPath,
      builder: (context, state) {
        return ShipmentsScreen();
      },
    ),
    GoRoute(
      name: routesScreen,
      path: routesPath,
      builder: (context, state) {
        return const RoutesScreen();
      },
    ),
    GoRoute(
      name: shipmentDetailsScreen,
      path: shipmentDetailsPath,
      builder: (context, state) {
        final shipmentJson = state.uri.queryParameters[shipmentQueryParam];
        if (shipmentJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final shipment = DomainShipment.fromJson(jsonDecode(shipmentJson));
          return shipment_details.ShipmentDetailsScreen(shipment: shipment);
        }
      },
    ),
    GoRoute(
      name: shipmentSuccessScreen,
      path: shipmentSuccessPath,
      builder: (context, state) {
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];
        final pickupFacilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];
        final destinationFacilityJson =
            state.uri.queryParameters[destinationFacilityQueryParam];
        final routeNo = state.uri.queryParameters[routeQueryParam];

        if (shipmentsJson == null ||
            pickupFacilityJson == null ||
            destinationFacilityJson == null ||
            routeNo == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
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

          return ShipmentSuccessScreen(
            pickUpFacility: pickupFacility,
            destinationFacility: destinationFacility,
            shipments: shipments,
            routeNo: routeNo,
          );
        }
      },
    ),
    GoRoute(
      name: deliverySuccessScreen,
      path: deliverySuccessPath,
      builder: (context, state) {
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];
        final destinationFacilityJson =
            state.uri.queryParameters[destinationFacilityQueryParam];

        if (shipmentsJson == null || destinationFacilityJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final destinationFacility = DomainFacility.fromJson(
            jsonDecode(destinationFacilityJson),
          );
          final shipments = List<DomainShipment>.from(
            jsonDecode(
              shipmentsJson,
            ).map((shipmentJson) => DomainShipment.fromJson(shipmentJson)),
          );

          return DeliverySuccessScreen(
            destinationFacility: destinationFacility,
            shipments: shipments,
          );
        }
      },
    ),
  ],
);
