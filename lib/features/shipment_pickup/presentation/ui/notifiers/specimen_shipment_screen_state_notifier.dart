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

    // We only need 1 etoken for the route
    // Shipments extract their etoken_serial from the manifest_no
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
      // Extract etoken_serial from manifest_no (format: {LSP}-{etoken_serial})
      // e.g., "LSP1-001" -> etoken_serial = "001"
      final manifestParts = manifest.manifestNo.split('-');
      final etokenSerial = manifestParts.length > 1 ? manifestParts.sublist(1).join('-') : manifest.manifestNo;

      // Generate shipment_no using the same etoken_serial as the manifest
      final shipmentNo = '${lsp.display}-SH-$etokenSerial';

      shipments.add(DomainShipment(
        shipmentNo: shipmentNo,
        manifestNo: manifest.manifestNo,
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
      _cachedState = SpecimenShipmentScreenState(
        facilities: (facilitiesResult as Success<List<DomainFacility>>).payload
            .where(
              (facility) =>
                  movementType.destinationPrimary!.toLowerCase().contains(
                    facility.type?.toLowerCase() ?? "",
                  ) ||
                  movementType.destinationSecondary!
                      .toLowerCase()
                      .contains(facility.type?.toLowerCase() ?? ""),
            )
            .distinctBy((facility) => facility.facilityId),
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
      final updatedShipments = data.shipments.map((shp) {
        return shp.copyWith(
          destinationFacilityName: facility.facilityName ?? "",
          destinationFacilityId: facility.facilityId?.toString() ?? "",
        );
      }).toList();
      final newState = data.copyWith(
        selectedDestinationFacility: facility,
        shipments: updatedShipments,
      );
      _cachedState = newState;
      return newState;
    });
  }
}
