import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';
import 'package:nims_mobile_app/features/auth/data/providers.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/result_pickup_screen_state.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/utils/result.dart';
import '../../../../dashboard/providers.dart';
import '../models/shipment_approval_screen_state.dart';
import '../models/shipments_screen_state.dart';

class SpecimenShipmentApprovalScreenStateNotifier
    extends
        AutoDisposeFamilyNotifier<
          ShipmentApprovalScreenState,
          ({
            DomainMovementType movementType,
            DomainFacility pickUpFacility,
            DomainFacility destinationFacility,
            List<DomainShipment> shipments,
          })
        > {
  @override
  ShipmentApprovalScreenState build(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainShipment> shipments,
    })
    param,
  ) {
    return _loadData(param);
  }

  _loadData(
    ({
      DomainFacility destinationFacility,
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      List<DomainShipment> shipments,
    })
    param,
  ) {
    return ShipmentApprovalScreenState(
      movementType: param.movementType,
      pickUpFacility: param.pickUpFacility,
      destinationFacility: param.destinationFacility,
      shipments: param.shipments,
    );
  }

  onUpdatePickUpTemperature(String temperature) {
    state = state.copyWith(pickUpTemperature: temperature);
  }

  onUpdateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  onUpdateDesignation(String designation) {
    state = state.copyWith(designation: designation);
  }

  onUpdateSignature(String signature) {
    state = state.copyWith(signature: signature);
  }

  onUpdatePhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  Future<void> refreshState() async {
    state = _loadData(arg);
  }

  Future<void> onApproveShipment() async {
    state = state.copyWith(isSavingShipmentRoute: true);
    final localService = ref.read(nimsLocalServiceProvider);
    final user = await ref.read(authRepositoryProvider).getUser();
    final lsp = await localService.getFirstCachedLsp();

    // Extract etoken_serial from the first specimen's manifest_no
    // Format: {LSP}-{etoken_serial} -> e.g., "LSP1-001" -> "001"
    final firstManifestNo = state.shipments.first.manifestNo;
    final manifestParts = firstManifestNo.split('-');
    final etokenSerial = manifestParts.length > 1 ? manifestParts.sublist(1).join('-') : firstManifestNo;

    // Generate approval_no with -PK suffix for pickup approval
    final approvalNo = '${lsp?.display ?? "UNKNOWN"}-AP-$etokenSerial-PK';
    final routeNo = state.shipments.first.routeNo;
    final shipmentRoute = DomainShipmentRoute(
      routeNo: routeNo,
      routeType: 'specimen_shipment_route',
      originFacilityId: state.pickUpFacility.facilityId?.toString() ?? "",
      destinationFacilityId:
          state.destinationFacility.facilityId?.toString() ?? "",
      lspCode: lsp?.lspCode ?? "",
      riderUserId: user?.userId ?? "",
      originFacilityName: state.pickUpFacility.facilityName ?? "",
      destinationFacilityName: state.destinationFacility.facilityName ?? "",
      latitude: GeoLocationService().latitude,
      longitude: GeoLocationService().longitude,
    );

    final approval = DomainApproval(
      approvalNo: approvalNo,
      routeNo: routeNo,
      approvalType: 'specimen_pickup',
      fullname: state.fullName,
      phone: state.phoneNumber,
      designation: state.designation,
      signature: state.signature,
      latitude: GeoLocationService().latitude,
      longitude: GeoLocationService().longitude,
      approvalDate: DateTime.now().toIso8601String(),
    );

    final result = await ref
        .read(shipmentRouteRepositoryProvider)
        .saveShipmentRoute(shipmentRoute, state.shipments, approval);

    switch (result) {
      case Success<bool>():
        // No etoken to delete - approval reuses etoken_serial from manifest
        ref.invalidate(dashboardScreenStateNotifierProvider);
        state = state.copyWith(
          showSuccessDialog: true,
          createdRouteNo: routeNo,
        );
      case Error<bool>():
        state = state.copyWith(
          alert: Alert(show: true, message: result.message),
        );
    }
  }

  onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }
}
