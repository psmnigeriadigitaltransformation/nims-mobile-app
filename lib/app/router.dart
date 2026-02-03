import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer' as developers;
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/providers.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_error_content.dart';
import 'package:nims_mobile_app/features/dashboard/dashboard_screen.dart';
import '../core/domain/models/result.dart';
import '../features/auth/login/login_screen.dart';
import '../features/dashboard/facilities/facilities_screen.dart';
import '../features/dashboard/manifests/manifests_screen.dart';
import '../features/dashboard/routes/result_shipment_route/result_shipment_route_details_screen.dart';
import '../features/dashboard/routes/specimen_shipment_route/specimen_shipment_route_details_screen.dart';
import '../features/dashboard/shipments/shipments_screen.dart';
import '../features/shipment_delivery/result_shipment_delivery/result_delivery_approval_screen.dart';
import '../features/shipment_delivery/result_shipment_delivery/result_delivery_success_screen.dart';
import '../features/shipment_delivery/specimen_shipment_delivery/specimen_delivery_approval_screen.dart';
import '../features/shipment_delivery/specimen_shipment_delivery/specimen_delivery_success_screen.dart';
import '../features/shipment_pickup/specimen_shipment_pickup/manifest/add_new_manifest_screen.dart';
import '../features/shipment_pickup/specimen_shipment_pickup/manifest/manifest_details_screen.dart';
import '../features/shipment_pickup/specimen_shipment_pickup/manifest/select_manifests_screen.dart';
import '../features/shipment_pickup/presentation/ui/widgets/result/result_shipment_approval_screen.dart';
import '../features/shipment_pickup/presentation/ui/widgets/result/result_shipment_screen.dart';
import '../features/shipment_pickup/presentation/ui/widgets/result/result_shipment_success_screen.dart';
import '../features/shipment_pickup/presentation/ui/widgets/result/results_screen.dart';
import '../features/shipment_pickup/specimen_shipment_pickup/approval/specimen_shipment_approval/specimen_shipment_approval_screen.dart';
import '../features/shipment_pickup/specimen_shipment_pickup/specimen/specimen_shipment_screen.dart';
import '../features/shipment_pickup/specimen_shipment_pickup/specimen/specimen_shipment_success_screen.dart';
import '../features/dashboard/shipments/specimen_shipment/specimen_shipment_details_screen.dart';
import '../features/dashboard/shipments/result_shipment/result_shipment_details_screen.dart';
import '../features/dashboard/routes/routes_screen.dart';

final router = GoRouter(
  initialLocation: loginPath,
  observers: [routeObserver],
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
      name: manifestsScreen,
      path: manifestsPath,
      builder: (context, state) {
        return ManifestsScreen();
      },
    ),
    GoRoute(
      name: selectManifestsScreen,
      path: selectManifestsPath,
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

          return SelectManifestsScreen(movementType: movementType);
        }
      },
    ),
    GoRoute(
      name: selectResultsScreen,
      path: selectResultsPath,
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
          return SelectResultsScreen(movementType: movementType);
        }
      },
    ),
    GoRoute(
      name: resultShipmentScreen,
      path: resultShipmentPath,
      builder: (context, state) {
        final movementTypeJson =
            state.uri.queryParameters[movementTypeQueryParam];
        final selectedResultsJson =
            state.uri.queryParameters[selectedResultsQueryParam];
        final facilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];

        developer.log(
          movementTypeJson.toString(),
          name: "GoRoute:resultShipmentScreen:movementTypeJson",
        );
        developer.log(
          selectedResultsJson.toString(),
          name: "GoRoute:resultShipmentScreen:selectedResultsJson",
        );
        developer.log(
          facilityJson.toString(),
          name: "GoRoute:resultShipmentScreen:facilityJson",
        );

        if (movementTypeJson == null ||
            selectedResultsJson == null ||
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
          final selectedResults = List<LabResult>.from(
            jsonDecode(
              selectedResultsJson,
            ).map((resultJson) => LabResult.fromJson(resultJson)),
          );
          final facility = DomainFacility.fromJson(jsonDecode(facilityJson));

          return ResultShipmentScreen(
            movementType: movementType,
            selectedResults: selectedResults,
            pickUpFacility: facility,
          );
        }
      },
    ),
    GoRoute(
      name: resultDispatchApprovalScreen,
      path: resultDispatchApprovalPath,
      builder: (context, state) {
        final movementTypeJson =
            state.uri.queryParameters[movementTypeQueryParam];
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];
        final pickupFacilityJson =
            state.uri.queryParameters[pickupFacilityQueryParam];
        final destinationFacilityJson =
            state.uri.queryParameters[destinationFacilityQueryParam];
        final sampleCodesJson =
            state.uri.queryParameters[sampleCodesQueryParam];

        developer.log(
          movementTypeJson.toString(),
          name: "GoRoute:resultDispatchApprovalScreen:movementTypeJson",
        );
        developer.log(
          shipmentsJson.toString(),
          name: "GoRoute:resultDispatchApprovalScreen:shipmentsJson",
        );
        developer.log(
          pickupFacilityJson.toString(),
          name: "GoRoute:resultDispatchApprovalScreen:pickupFacilityJson",
        );
        developer.log(
          destinationFacilityJson.toString(),
          name: "GoRoute:resultDispatchApprovalScreen:destinationFacilityJson",
        );

        if (movementTypeJson == null ||
            shipmentsJson == null ||
            pickupFacilityJson == null ||
            destinationFacilityJson == null ||
            sampleCodesJson == null) {
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
          final shipmentSampleCodes = List<String>.from(
            jsonDecode(sampleCodesJson),
          );

          return ResultShipmentApprovalScreen(
            movementType: movementType,
            pickUpFacility: pickupFacility,
            destinationFacility: destinationFacility,
            shipments: shipments,
            shipmentSampleCodes: shipmentSampleCodes,
          );
        }
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
        final routeJson = state.uri.queryParameters[routeQueryParam];
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];

        developer.log(
          routeJson.toString(),
          name: "GoRoute:specimenDeliveryApprovalScreen:routeJson",
        );
        developer.log(
          shipmentsJson.toString(),
          name: "GoRoute:specimenDeliveryApprovalScreen:shipmentsJson",
        );

        if (routeJson == null || shipmentsJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final route = DomainShipmentRoute.fromJson(jsonDecode(routeJson));
          final shipments = List<DomainShipment>.from(
            jsonDecode(
              shipmentsJson,
            ).map((shipmentJson) => DomainShipment.fromJson(shipmentJson)),
          );

          return SpecimenDeliveryApprovalScreen(
            route: route,
            shipments: shipments,
          );
        }
      },
    ),
    GoRoute(
      name: resultDeliveryApprovalScreen,
      path: resultDeliveryApprovalPath,
      builder: (context, state) {
        final routeJson = state.uri.queryParameters[routeQueryParam];
        final shipmentJson = state.uri.queryParameters[shipmentQueryParam];

        developer.log(
          routeJson.toString(),
          name: "GoRoute:resultDeliveryApprovalScreen:routeJson",
        );
        developer.log(
          shipmentJson.toString(),
          name: "GoRoute:resultDeliveryApprovalScreen:shipmentJson",
        );

        if (routeJson == null || shipmentJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final route = DomainShipmentRoute.fromJson(jsonDecode(routeJson));
          final shipment = DomainShipment.fromJson(jsonDecode(shipmentJson));
          return ResultDeliveryApprovalScreen(route: route, shipment: shipment);
        }
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
      name: specimenShipmentRouteDetailsScreen,
      path: specimenShipmentRouteDetailsPath,
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
          return SpecimenShipmentRouteDetailsScreen(route: route);
        }
      },
    ),
    GoRoute(
      name: resultShipmentRouteDetailsScreen,
      path: resultShipmentRouteDetailsPath,
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
          return ResultShipmentRouteDetailsScreen(route: route);
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
          developer.log(manifests.toString(), name: "manifest");
          final facility = DomainFacility.fromJson(jsonDecode(facilityJson));
          developer.log(manifests.toString(), name: "facility");

          return SpecimenShipmentScreen(
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
        final sampleCodesJson =
            state.uri.queryParameters[shipmentSampleCodesQueryParam];
        final isDeliveryModeStr =
            state.uri.queryParameters[isDeliveryModeQueryParam];
        if (shipmentJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final shipment = DomainShipment.fromJson(jsonDecode(shipmentJson));
          final isDeliveryMode = isDeliveryModeStr == 'true';
          // Navigate based on payload type
          if (shipment.payloadType.toLowerCase() == 'result') {
            final sampleCodes = sampleCodesJson != null
                ? List<String>.from(jsonDecode(sampleCodesJson))
                : <String>[];
            return ResultShipmentDetailsScreen(
              shipment: shipment,
              sampleCodes: sampleCodes,
            );
          }
          return SpecimenShipmentDetailsScreen(
            shipment: shipment,
            isDeliveryMode: isDeliveryMode,
          );
        }
      },
    ),
    GoRoute(
      name: resultShipmentDetailsScreen,
      path: resultShipmentDetailsPath,
      builder: (context, state) {
        final shipmentJson = state.uri.queryParameters[shipmentQueryParam];
        final sampleCodesJson =
            state.uri.queryParameters[shipmentSampleCodesQueryParam];
        if (shipmentJson == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final shipment = DomainShipment.fromJson(jsonDecode(shipmentJson));
          final sampleCodes = sampleCodesJson != null
              ? List<String>.from(jsonDecode(sampleCodesJson))
              : <String>[];
          return ResultShipmentDetailsScreen(
            shipment: shipment,
            sampleCodes: sampleCodes,
          );
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

          return SpecimenShipmentSuccessScreen(
            pickUpFacility: pickupFacility,
            destinationFacility: destinationFacility,
            shipments: shipments,
            routeNo: routeNo,
          );
        }
      },
    ),
    GoRoute(
      name: resultShipmentSuccessScreen,
      path: resultShipmentSuccessPath,
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

          return ResultShipmentSuccessScreen(
            pickUpFacility: pickupFacility,
            destinationFacility: destinationFacility,
            shipments: shipments,
            routeNo: routeNo,
          );
        }
      },
    ),
    GoRoute(
      name: specimenDeliverySuccessScreen,
      path: specimenDeliverySuccessPath,
      builder: (context, state) {
        final shipmentsJson = state.uri.queryParameters[shipmentsQueryParam];
        final destinationFacilityName =
            state.uri.queryParameters[destinationFacilityNameQueryParam];

        if (shipmentsJson == null || destinationFacilityName == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final shipments = List<DomainShipment>.from(
            jsonDecode(
              shipmentsJson,
            ).map((shipmentJson) => DomainShipment.fromJson(shipmentJson)),
          );

          return SpecimenDeliverySuccessScreen(
            destinationFacilityName: destinationFacilityName,
            shipments: shipments,
          );
        }
      },
    ),
    GoRoute(
      name: resultDeliverySuccessScreen,
      path: resultDeliverySuccessPath,
      builder: (context, state) {
        final shipmentJson = state.uri.queryParameters[shipmentQueryParam];
        final destinationFacilityName =
            state.uri.queryParameters[destinationFacilityNameQueryParam];

        developers.log(shipmentJson.toString(), name: "shipmentJson");
        developers.log(
          destinationFacilityName.toString(),
          name: "destinationFacilityJson",
        );

        if (shipmentJson == null || destinationFacilityName == null) {
          return NIMSErrorContent(
            message: "Something went wrong",
            onTapActionButton: () => context.pop(),
            actionButtonLabel: "Go Back",
          );
        } else {
          final shipment = DomainShipment.fromJson(jsonDecode(shipmentJson));

          return ResultDeliverySuccessScreen(
            destinationFacilityName: destinationFacilityName,
            shipment: shipment,
          );
        }
      },
    ),
  ],
);
