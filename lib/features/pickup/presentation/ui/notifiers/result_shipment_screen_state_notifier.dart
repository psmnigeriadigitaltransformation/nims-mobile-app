import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/utils/list_extensions.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart' as result_util;
import '../models/result_shipments_screen_state.dart';

class ResultShipmentScreenStateNotifier
    extends FamilyAsyncNotifier<ResultShipmentScreenState, String> {
  // Cached data to avoid reloading on navigation back
  ResultShipmentScreenState? _cachedState;

  @override
  FutureOr<ResultShipmentScreenState> build(String arg) async {
    // Return cached state if available (when navigating back)
    if (_cachedState != null) {
      return _cachedState!;
    }
    // Initial state will be set via initialize() method
    return ResultShipmentScreenState(
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
    required List<LabResult> selectedResults,
  }) async {
    // Skip if already initialized with data
    if (_cachedState != null && _cachedState!.shipments.isNotEmpty) {
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadData(
          movementType: movementType,
          pickUpFacility: pickUpFacility,
          selectedResults: selectedResults,
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

  Future<ResultShipmentScreenState> _loadData({
    required DomainMovementType movementType,
    required DomainFacility pickUpFacility,
    required List<LabResult> selectedResults,
  }) async {
    developer.log(
      "Loading data for ${selectedResults.length} selected results",
      name: "ResultShipmentsScreenStateNotifier:_loadData",
    );

    final facilitiesResult =
        await ref.read(facilitiesRepositoryProvider).getFacilities(false);

    final locationsResult =
        await ref.read(locationsRepositoryProvider).getLocations(false);

    final localService = ref.read(nimsLocalServiceProvider);
    final eTokenService = ref.read(eTokenServiceProvider);

    // Get LSP for ID generation
    final lsp = await localService.getFirstCachedLsp();
    if (lsp == null) {
      throw Exception("No LSP available. Please sync your data.");
    }

    // // Group results by manifest_no
    // final resultsByManifest = <String, List<LabResult>>{};
    // for (final result in selectedResults) {
    //   resultsByManifest.putIfAbsent(result.manifestNo, () => []).add(result);
    // }
    //
    // developer.log(
    //   "Grouped into ${resultsByManifest.length} shipments by manifest",
    //   name: "ResultShipmentsScreenStateNotifier:_loadData",
    // );

    final usedETokens = <DomainETokenData>[];

    // Get etoken for route (auto-downloads if needed)
    final routeEToken = await eTokenService.getNextEToken();
    usedETokens.add(routeEToken);

    // Generate route number with fresh etoken
    final routeNo = '${lsp.display}-RO-${routeEToken.serialNo}';

    // Delete the route etoken after use
    await eTokenService.deleteEToken(routeEToken.etokenId!);

    // Get etoken for shipment (auto-downloads if needed)
    final shipmentEToken = await eTokenService.getNextEToken();
    usedETokens.add(shipmentEToken);

    // Generate shipment no. with fresh etoken
    final shipmentNo = '${lsp.display}-SH-${shipmentEToken.serialNo}';

    // Delete the shipment etoken after use
    await eTokenService.deleteEToken(shipmentEToken.etokenId!);

    // final shipments = <DomainShipment>[];
    final sampleCodes = selectedResults.map((r) => r.sampleCode).toList();


    // Extract etoken_serial from manifest_no (format: {LSP}-{etoken_serial})
    // e.g., "LSP1-001" -> etoken_serial = "001"
    // final manifestParts = manifestNo.split('-');
    // final etokenSerial = manifestParts.length > 1 ? manifestParts.sublist(1).join('-') : manifestNo;

    // Generate shipment_no using the same etoken_serial as the manifest
    // final shipmentNo = '${lsp.display}-SH-$etokenSerial';

    final shipment = DomainShipment(
      shipmentNo: shipmentNo,
      manifestNo: "",
      originType: pickUpFacility.type ?? '',
      originFacilityName: pickUpFacility.facilityName ?? '',
      destinationLocationType: movementType.destinationPrimary ?? "",
      destinationFacilityId: '',
      destinationFacilityName: '',
      pickupLatitude: GeoLocationService().latitude,
      pickupLongitude: GeoLocationService().longitude,
      sampleType: "EID", //to be changed
      sampleCount: selectedResults.length,
      payloadType: 'result',
      routeNo: routeNo,
      pickupDate: DateTime.now().toIso8601String(),
    );

    // for (final result in selectedResults) {
    //   final manifestNo = result.manifestNo;
      // final resultsForManifest = entry.value;


      // Extract etoken_serial from manifest_no (format: {LSP}-{etoken_serial})
      // e.g., "LSP1-001" -> etoken_serial = "001"
      // final manifestParts = manifestNo.split('-');
      // final etokenSerial = manifestParts.length > 1 ? manifestParts.sublist(1).join('-') : manifestNo;

      // Generate shipment_no using the same etoken_serial as the manifest
      // final shipmentNo = '${lsp.display}-SH-$etokenSerial';

      // Store the sample codes for this specimen
      // sampleCodes[shipmentNo] =
      //     resultsForManifest.map((r) => r.sampleCode).toList();

      // shipments.add(DomainShipment(
      //   shipmentNo: shipmentNo,
      //   manifestNo: manifestNo,
      //   originType: pickUpFacility.type ?? '',
      //   originFacilityName: pickUpFacility.facilityName ?? '',
      //   destinationLocationType: '',
      //   destinationFacilityId: '',
      //   destinationFacilityName: '',
      //   pickupLatitude: GeoLocationService().latitude,
      //   pickupLongitude: GeoLocationService().longitude,
      //   sampleType: '',
      //   sampleCount: resultsForManifest.length,
      //   payloadType: 'result',
      //   routeNo: routeNo,
      //   pickupDate: DateTime.now().toIso8601String(),
      // ));
    // }



    if (facilitiesResult is result_util.Success &&
        locationsResult is result_util.Success) {
      _cachedState = ResultShipmentScreenState(
        facilities:
            (facilitiesResult as result_util.Success<List<DomainFacility>>)
                .payload
                .where(
                  (facility) =>
                      movementType.destinationPrimary!.toLowerCase().contains(
                            facility.type?.toLowerCase() ?? "",
                          ) ||
                      movementType.destinationSecondary
                          ?.toLowerCase()
                          .contains(facility.type?.toLowerCase() ?? "") == true,
                )
                .distinctBy((facility) => facility.facilityId),
        locations:
            (locationsResult as result_util.Success<List<DomainLocation>>)
                .payload
                .where(
                  (location) =>
                      movementType.destinationPrimary!.toLowerCase().contains(
                            location.location?.toLowerCase() ?? "",
                          ) ||
                      movementType.destinationSecondary
                          ?.toLowerCase()
                          .contains(location.location?.toLowerCase() ?? "") == true,
                )
                .toList(),
        movementType: movementType,
        shipments: [shipment],
        usedETokens: usedETokens,
        lsp: lsp,
        shipmentSampleCodes: sampleCodes,
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
