import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../model/shipments_screen_state.dart';

class ShipmentScreenStateNotifier
    extends
        AutoDisposeFamilyAsyncNotifier<
          ShipmentsScreenState,
          ({
            DomainMovementType movementType,
            DomainFacility pickUpFacility,
            List<DomainManifest> manifests,
          })
        > {
  @override
  FutureOr<ShipmentsScreenState> build(
    ({
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainManifest> manifests,
    })
    arg,
  ) {
    return _loadData(arg);
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadData(arg));
  }

  Future<ShipmentsScreenState> _loadData(
    ({
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainManifest> manifests,
    })
    param,
  ) async {
    developer.log(
      "${param.manifests}",
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
      return ShipmentsScreenState(
        facilities: (facilitiesResult as Success<List<DomainFacility>>).payload
            .where(
              (facility) =>
                  param.movementType.destinationPrimary!.toLowerCase().contains(
                    facility.type?.toLowerCase() ?? "",
                  ) ||
                  param.movementType.destinationSecondary!
                      .toLowerCase()
                      .contains(facility.type?.toLowerCase() ?? ""),
            )
            .toList(),
        locations: (locationsResult as Success<List<DomainLocation>>).payload
            .where(
              (location) =>
                  param.movementType.destinationPrimary!.toLowerCase().contains(
                    location.location?.toLowerCase() ?? "",
                  ) ||
                  param.movementType.destinationSecondary!
                      .toLowerCase()
                      .contains(location.location?.toLowerCase() ?? ""),
            )
            .toList(),
        movementType: param.movementType,
        shipments: param.manifests
            .map(
              (manifest) => DomainShipment(
                shipmentNo: Uuid().v4(),
                manifestNo: manifest.manifestNo,
                originType: param.pickUpFacility.type ?? '',
                destinationLocationType: '',
                destinationFacilityId: '',
                destinationFacilityName: '',
                pickupLatitude: 6.123456,
                pickupLongitude: 7.123456,
                sampleType: manifest.sampleType,
                sampleCount: manifest.sampleCount,
                routeNo: routeNo,
              ),
            )
            .toList(),
      );
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
      return data.copyWith(shipments: updatedShipments);
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
      return data.copyWith(
        selectedDestinationFacility: facility,
        shipments: updatedShipments,
      );
    });
  }
}
