import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/utils/list_extensions.dart';
import 'package:nims_mobile_app/features/dashboard/facilities/providers.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../models/specimen_shipments_screen_state.dart';

class SpecimenShipmentScreenStateNotifier
    extends FamilyAsyncNotifier<SpecimenShipmentScreenState, String> {
  // Cached data to avoid reloading on navigation back
  SpecimenShipmentScreenState? _cachedState;

  @override
  FutureOr<SpecimenShipmentScreenState> build(String arg) async {
    // Return cached state if available (when navigating back)
    if (_cachedState != null) {
      return _cachedState!;
    }
    // Initial state will be set via initialize() method
    return SpecimenShipmentScreenState(
      facilities: [],
      locations: [],
      movementType: null,
      shipments: [],
    );
  }

  /// Initialize the state with the required data - call this once when first navigating to the screen
  Future<void> initialize({
    required DomainMovementType movementType,
    required DomainFacility pickUpFacility,
    required List<DomainManifest> manifests,
  }) async {
    // Skip if already initialized with data
    if (_cachedState != null && _cachedState!.shipments.isNotEmpty) {
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadData(
      movementType: movementType,
      pickUpFacility: pickUpFacility,
      manifests: manifests,
    ));
  }

  Future<void> refreshState() async {
    if (_cachedState == null) return;
    state = AsyncData(_cachedState!);
  }

  /// Clear the cached state - call this when user navigates back from this screen
  void clearCache() {
    _cachedState = null;
  }

  Future<SpecimenShipmentScreenState> _loadData({
    required DomainMovementType movementType,
    required DomainFacility pickUpFacility,
    required List<DomainManifest> manifests,
  }) async {
    developer.log(
      "$manifests",
      name: "ShipmentsScreenStateNotifier:_loadData",
    );

    final facilitiesResult = await ref
        .read(facilitiesRepositoryProvider)
        .getFacilities(false);

    final locationsResult = await ref
        .read(locationsRepositoryProvider)
        .getLocations(false);

    final localService = ref.read(nimsLocalServiceProvider);
    final eTokenService = ref.read(eTokenServiceProvider);

    // Get LSP for ID generation
    final lsp = await localService.getFirstCachedLsp();
    if (lsp == null) {
      throw Exception("No LSP available. Please sync your data.");
    }

    // We need 1 etoken for the route + 1 etoken per shipment
    final usedETokens = <DomainETokenData>[];

    // Get etoken for route (auto-downloads if needed)
    final routeEToken = await eTokenService.getNextEToken();
    usedETokens.add(routeEToken);

    // Generate route number with fresh etoken
    final routeNo = '${lsp.display}-RO-${routeEToken.serialNo}';

    // Delete the route etoken after use
    await eTokenService.deleteEToken(routeEToken.etokenId!);

    final shipments = <DomainShipment>[];
    for (final manifest in manifests) {
      // Get fresh etoken for each shipment
      final shipmentEToken = await eTokenService.getNextEToken();
      usedETokens.add(shipmentEToken);

      // Generate shipment_no using fresh etoken
      final shipmentNo = '${lsp.display}-SH-${shipmentEToken.serialNo}';

      // Delete the shipment etoken after use
      await eTokenService.deleteEToken(shipmentEToken.etokenId!);

      shipments.add(DomainShipment(
        shipmentNo: shipmentNo,
        manifestNo: manifest.manifestNo,
        originId: manifest.originId,
        originType: pickUpFacility.type ?? '',
        originFacilityName: pickUpFacility.facilityName ?? '',
        destinationLocationType: '',
        destinationFacilityId: '',
        destinationFacilityName: '',
        pickupLatitude: ref.read(geoLocationServiceProvider).latitude,
        pickupLongitude: ref.read(geoLocationServiceProvider).longitude,
        sampleType: manifest.sampleType,
        sampleCount: manifest.sampleCount,
        payloadType: 'specimen',
        routeNo: routeNo,
        pickupDate: DateTime.now().toIso8601String(),
      ));
    }

    if (facilitiesResult is Success && locationsResult is Success) {
      // Filter facilities based on movement type
      final filteredFacilities = (facilitiesResult as Success<List<DomainFacility>>).payload
          .where(
            (facility) =>
                // Exclude pickup facility from destination list
                facility.facilityId != pickUpFacility.facilityId &&
                (movementType.destinationPrimary!.toLowerCase().contains(
                  facility.type?.toLowerCase() ?? "",
                ) ||
                movementType.destinationSecondary!
                    .toLowerCase()
                    .contains(facility.type?.toLowerCase() ?? "")),
          )
          .toList();

      // Build map of facilityId -> all types BEFORE deduplication
      final facilityTypesMap = <int, List<String>>{};
      for (final facility in filteredFacilities) {
        final facilityId = facility.facilityId;
        final facilityType = facility.type;
        if (facilityId != null && facilityType != null && facilityType.isNotEmpty) {
          facilityTypesMap.putIfAbsent(facilityId, () => []);
          if (!facilityTypesMap[facilityId]!.contains(facilityType)) {
            facilityTypesMap[facilityId]!.add(facilityType);
          }
        }
      }

      developer.log(
        "Facility types map: $facilityTypesMap",
        name: "SpecimenShipmentScreenStateNotifier:_loadData",
      );

      _cachedState = SpecimenShipmentScreenState(
        facilities: filteredFacilities.distinctBy((facility) => facility.facilityId),
        locations: (locationsResult as Success<List<DomainLocation>>).payload
            .where(
              (location) =>
                  movementType.destinationPrimary!.toLowerCase().contains(
                    location.location?.toLowerCase() ?? "",
                  ) ||
                  movementType.destinationSecondary!
                      .toLowerCase()
                      .contains(location.location?.toLowerCase() ?? ""),
            )
            .toList(),
        movementType: movementType,
        shipments: shipments,
        usedETokens: usedETokens,
        lsp: lsp,
        facilityTypesMap: facilityTypesMap,
      );
      return _cachedState!;
    } else {
      throw Exception("Something went wrong or an error occurred");
    }
  }

  updateDestinationLocationType(
    DomainLocation location,
    DomainShipment shipment,
  ) {
    state = state.whenData((data) {
      final matchingShipment = data.shipments.firstWhere(
        (shp) => shp.shipmentNo == shipment.shipmentNo,
      );
      final updatedShipment = matchingShipment.copyWith(
        destinationLocationType: location.location ?? "",
      );
      final updatedShipments = data.shipments.map((shp) {
        if (shp.shipmentNo == shipment.shipmentNo) {
          return updatedShipment;
        } else {
          return shp;
        }
      }).toList();
      final newState = data.copyWith(shipments: updatedShipments);
      _cachedState = newState;
      return newState;
    });
  }

  updateDestinationFacility(DomainFacility facility) {
    state = state.whenData((data) {
      // Get all types for this facility from the map
      final allFacilityTypes = data.facilityTypesMap[facility.facilityId] ?? [];

      developer.log(
        "Facility ${facility.facilityName} (ID: ${facility.facilityId}) has types: $allFacilityTypes",
        name: "SpecimenShipmentScreenStateNotifier:updateDestinationFacility",
      );

      // Auto-detect destination location type based on all facility types
      // Use contains matching: facility.type contains location OR location contains facility.type
      // Collect all unique matching locations
      final matchedLocations = <String>{};

      for (final facilityType in allFacilityTypes) {
        final facilityTypeLower = facilityType.toLowerCase();
        for (final location in data.locations) {
          final locationType = location.location?.toLowerCase() ?? '';
          if (locationType.isNotEmpty &&
              (facilityTypeLower.contains(locationType) || locationType.contains(facilityTypeLower))) {
            matchedLocations.add(location.location!);
          }
        }
      }

      // Determine auto-detected location type
      String? autoDetectedLocationType;
      if (matchedLocations.length == 1) {
        // Exactly one match - auto-detect
        autoDetectedLocationType = matchedLocations.first;
      } else if (matchedLocations.length > 1) {
        // Multiple different matches - ambiguous, leave blank for manual selection
        developer.log(
          "Ambiguous auto-detection: facility types $allFacilityTypes matched multiple locations: $matchedLocations. Leaving blank for manual selection.",
          name: "SpecimenShipmentScreenStateNotifier:updateDestinationFacility",
        );
        autoDetectedLocationType = null;
      }
      // If no matches, autoDetectedLocationType remains null

      developer.log(
        "Auto-detected location type: $autoDetectedLocationType (matched locations: $matchedLocations)",
        name: "SpecimenShipmentScreenStateNotifier:updateDestinationFacility",
      );

      // Lock the dropdown if exactly one location was reliably detected
      final isLocked = matchedLocations.length == 1;

      final updatedShipments = data.shipments.map((shp) {
        return shp.copyWith(
          destinationFacilityName: facility.facilityName ?? "",
          destinationFacilityId: facility.facilityId?.toString() ?? "",
          // Auto-set location type if detected, otherwise clear for manual selection
          destinationLocationType: autoDetectedLocationType ?? '',
        );
      }).toList();
      final newState = data.copyWith(
        selectedDestinationFacility: facility,
        shipments: updatedShipments,
        isDestinationLocationTypeLocked: isLocked,
      );
      _cachedState = newState;
      return newState;
    });
  }
}
