import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../model/shipments_screen_state.dart';

class ShipmentScreenStateNotifier
    extends FamilyAsyncNotifier<ShipmentsScreenState, String> {
  // Cached data to avoid reloading on navigation back
  ShipmentsScreenState? _cachedState;

  @override
  FutureOr<ShipmentsScreenState> build(String arg) async {
    // Return cached state if available (when navigating back)
    if (_cachedState != null) {
      return _cachedState!;
    }
    // Initial state will be set via initialize() method
    return ShipmentsScreenState(
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

  Future<ShipmentsScreenState> _loadData({
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

    if (facilitiesResult is Success && locationsResult is Success) {
      final routeNo = Uuid().v4();
      _cachedState = ShipmentsScreenState(
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
            .toList(),
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
        shipments: manifests
            .map(
              (manifest) => DomainShipment(
                shipmentNo: Uuid().v4(),
                manifestNo: manifest.manifestNo,
                originType: pickUpFacility.type ?? '',
                destinationLocationType: '',
                destinationFacilityId: '',
                destinationFacilityName: '',
                pickupLatitude: GeoLocationService().latitude,
                pickupLongitude: GeoLocationService().longitude,
                sampleType: manifest.sampleType,
                sampleCount: manifest.sampleCount,
                routeNo: routeNo,
              ),
            )
            .toList(),
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
