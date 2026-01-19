import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';
import '../../../../../core/utils/result.dart';

class ResultPickUpScreenStateNotifier
    extends AutoDisposeFamilyAsyncNotifier<ResultPickUpScreenState, MovementType> {
  Future<ResultPickUpScreenState> _fetchData(MovementType movementType) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final facilitiesResult = await facilitiesRepository.getFacilities(false);

    switch (facilitiesResult) {
      case Success(payload: final payload):
        // Filter facilities based on movement type origin
        final filteredFacilities = payload
            .where(
              (facility) =>
                  movementType.origin?.toLowerCase().contains(
                        facility.type?.toLowerCase() ?? "",
                      ) ??
                  false,
            )
            .toList();

        // Hardcoded sample data for now (will be replaced with real API data later)
        final hardcodedResults = [
          ResultSampleData(
            manifestNo: "MN-288939-29930",
            sampleType: "Sputum",
            sampleCodes: ["PC-1234-2993", "PC-2783-3145", "PC-90993-3145"],
          ),
          ResultSampleData(
            manifestNo: "MN-288939-31452",
            sampleType: "Blood",
            sampleCodes: ["PC-4567-1111", "PC-8901-2222"],
          ),
        ];

        return ResultPickUpScreenState(
          facilities: filteredFacilities,
          movementType: movementType,
          availableResults: hardcodedResults,
        );

      case Error(message: final m):
        throw Exception(m);
    }
  }

  Future<void> refreshState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchData(arg),
    );
  }

  @override
  FutureOr<ResultPickUpScreenState> build(MovementType arg) {
    return _fetchData(arg);
  }

  // Selection methods
  void onSelectFacility(Facility facility) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(selectedFacility: facility));
    });
  }

  void onToggleResultSelection(String sampleCode) {
    state.whenData((data) {
      final newSelection = Set<String>.from(data.selectedResultCodes);
      if (newSelection.contains(sampleCode)) {
        newSelection.remove(sampleCode);
      } else {
        newSelection.add(sampleCode);
      }
      state = AsyncData(data.copyWith(selectedResultCodes: newSelection));
    });
  }

  void onSelectAll() {
    state.whenData((data) {
      final allCodes = <String>{};
      for (final result in data.availableResults) {
        allCodes.addAll(result.sampleCodes);
      }
      state = AsyncData(data.copyWith(selectedResultCodes: allCodes));
    });
  }

  void onUnselectAll() {
    state.whenData((data) {
      state = AsyncData(data.copyWith(selectedResultCodes: {}));
    });
  }

  // Input update methods
  void onUpdateTemperature(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(temperature: value));
    });
  }

  void onUpdateFullName(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(fullName: value));
    });
  }

  void onUpdatePhoneNumber(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(phoneNumber: value));
    });
  }

  void onUpdateDesignation(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(designation: value));
    });
  }

  void onUpdateSignature(String value) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(signature: value));
    });
  }

  void onDismissAlertDialog() {
    state.whenData((data) {
      state = AsyncData(data.copyWith(alert: Alert(show: false, message: "")));
    });
  }

  /// Submit result pickup - creates route, shipment, and approval
  Future<void> onSubmitResultPickup() async {
    final currentData = state.valueOrNull;
    if (currentData == null) return;

    state = AsyncData(currentData.copyWith(isSubmitting: true));

    try {
      final localService = ref.read(nimsLocalServiceProvider);
      final movementType = currentData.movementType;
      final selectedFacility = currentData.selectedFacility;
      final user = await localService.getCachedUser();
      final lsp = await localService.getFirstCachedLsp();

      if (movementType == null || selectedFacility == null || user == null) {
        state = AsyncData(currentData.copyWith(
          isSubmitting: false,
          alert: Alert(show: true, message: "Missing required data"),
        ));
        return;
      }

      // Get etokens for route, shipment, and approval
      final routeEToken = await localService.getNextEToken();
      if (routeEToken == null) {
        state = AsyncData(currentData.copyWith(
          isSubmitting: false,
          alert: Alert(show: true, message: "No eTokens available. Please download more eTokens."),
        ));
        return;
      }
      await localService.deleteEToken(routeEToken.etokenId!);

      final shipmentEToken = await localService.getNextEToken();
      if (shipmentEToken == null) {
        state = AsyncData(currentData.copyWith(
          isSubmitting: false,
          alert: Alert(show: true, message: "No eTokens available. Please download more eTokens."),
        ));
        return;
      }
      await localService.deleteEToken(shipmentEToken.etokenId!);

      final approvalEToken = await localService.getNextEToken();
      if (approvalEToken == null) {
        state = AsyncData(currentData.copyWith(
          isSubmitting: false,
          alert: Alert(show: true, message: "No eTokens available. Please download more eTokens."),
        ));
        return;
      }

      final lspDisplay = lsp?.display ?? "UNKNOWN";
      final routeNo = '$lspDisplay-RO-${routeEToken.serialNo}';
      final shipmentNo = '$lspDisplay-SH-${shipmentEToken.serialNo}';
      final approvalNo = '$lspDisplay-AP-${approvalEToken.serialNo}';

      // Create route
      final route = DomainShipmentRoute(
        routeNo: routeNo,
        originFacilityId: selectedFacility.facilityId?.toString() ?? "",
        originFacilityName: selectedFacility.facilityName ?? "",
        destinationFacilityId: movementType.typeId?.toString() ?? "",
        destinationFacilityName: movementType.destinationPrimary ?? "",
        lspCode: lsp?.lspCode ?? "",
        riderUserId: user.userId ?? "",
        latitude: 0.0,
        longitude: 0.0,
        syncStatus: 'pending',
      );

      // Create shipment
      final shipment = DomainShipment(
        shipmentNo: shipmentNo,
        routeNo: routeNo,
        manifestNo: "", // Result pickup doesn't have manifest
        originType: selectedFacility.type ?? "",
        originFacilityName: selectedFacility.facilityName ?? "",
        destinationLocationType: movementType.destinationPrimary ?? "",
        destinationFacilityId: movementType.typeId?.toString() ?? "",
        destinationFacilityName: movementType.destinationPrimary ?? "",
        pickupLatitude: 0.0,
        pickupLongitude: 0.0,
        sampleType: "Result",
        sampleCount: currentData.selectedResultCodes.length,
        shipmentStatus: 'pending',
        syncStatus: 'pending',
      );

      // Create approval
      final approval = DomainApproval(
        approvalNo: approvalNo,
        routeNo: routeNo,
        approvalType: 'result_pickup',
        fullname: currentData.fullName,
        phone: currentData.phoneNumber,
        designation: currentData.designation,
        signature: currentData.signature,
        syncStatus: 'pending',
      );

      // Save via repository
      final resultPickupRepo = ref.read(resultPickupRepositoryProvider);
      final result = await resultPickupRepo.saveResultPickup(
        route: route,
        shipment: shipment,
        approval: approval,
        sampleCodes: currentData.selectedResultCodes.toList(),
        temperature: currentData.temperature,
      );

      switch (result) {
        case Success<bool>():
          // Delete used approval etoken after successful save
          await localService.deleteEToken(approvalEToken.etokenId!);
          developer.log(
            "Result pickup saved successfully",
            name: "ResultPickUpScreenStateNotifier:onSubmitResultPickup",
          );
          state = AsyncData(currentData.copyWith(
            isSubmitting: false,
            showSuccessScreen: true,
          ));
        case Error<bool>():
          developer.log(
            "Failed to save result pickup: ${result.message}",
            name: "ResultPickUpScreenStateNotifier:onSubmitResultPickup",
          );
          state = AsyncData(currentData.copyWith(
            isSubmitting: false,
            alert: Alert(show: true, message: result.message),
          ));
      }
    } catch (e, s) {
      developer.log(
        "Error in onSubmitResultPickup: $e",
        name: "ResultPickUpScreenStateNotifier:onSubmitResultPickup",
        error: e,
        stackTrace: s,
      );
      state = AsyncData(currentData.copyWith(
        isSubmitting: false,
        alert: Alert(show: true, message: e.toString()),
      ));
    }
  }
}
