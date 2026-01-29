import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/alert.dart';

import '../../../core/domain/mappers/typedefs.dart';
import '../../../core/utils/result.dart';
import '../../dashboard/providers.dart';
import '../../dashboard/routes/providers.dart';
import '../../dashboard/routes/specimen_shipment_route/providers.dart';
import 'specimen_delivery_approval_screen_state.dart';

class SpecimenDeliveryApprovalScreenStateNotifier
    extends
        AutoDisposeFamilyNotifier<
          SpecimenDeliveryApprovalScreenState,
          ({DomainShipmentRoute route, List<DomainShipment> shipments})
        > {
  @override
  SpecimenDeliveryApprovalScreenState build(
    ({DomainShipmentRoute route, List<DomainShipment> shipments}) param,
  ) {
    return _loadData(param);
  }

  _loadData(
    ({DomainShipmentRoute route, List<DomainShipment> shipments}) param,
  ) {
    return SpecimenDeliveryApprovalScreenState(
      route: param.route,
      shipments: param.shipments,
    );
  }

  onUpdateDeliveryTemperature(String temperature) {
    state = state.copyWith(deliveryTemperature: temperature);
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

  Future<void> onApproveDelivery() async {
    state = state.copyWith(isSavingDelivery: true);

    final localService = ref.read(nimsLocalServiceProvider);
    final lsp = await localService.getFirstCachedLsp();

    // Extract etoken_serial from the first specimen's manifest_no
    // Format: {LSP}-{etoken_serial} -> e.g., "LSP1-001" -> "001"
    final firstManifestNo = state.shipments.first.manifestNo;
    final manifestParts = firstManifestNo.split('-');
    final etokenSerial = manifestParts.length > 1
        ? manifestParts.sublist(1).join('-')
        : firstManifestNo;

    // Generate approval_no with -DL suffix for shipment_delivery approval
    final approvalNo = '${lsp?.display ?? "UNKNOWN"}-AP-$etokenSerial-DL';

    final deliveryApproval = DomainApproval(
      approvalNo: approvalNo,
      routeNo: state.route.routeNo,
      approvalType: 'specimen_delivery',
      fullname: state.fullName,
      phone: state.phoneNumber,
      designation: state.designation,
      signature: state.signature,
      latitude: ref.read(geoLocationServiceProvider).latitude,
      longitude: ref.read(geoLocationServiceProvider).longitude,
      approvalDate: DateTime.now().toIso8601String(),
    );

    final result = await ref
        .read(shipmentsRepositoryProvider)
        .saveDeliveryApproval(state.shipments, deliveryApproval, state.route.routeNo);

    switch (result) {
      case Success<bool>():
        // No etoken to delete - approval reuses etoken_serial from manifest
        // Update delivery_date on all shipments
        final deliveryDate = DateTime.now().toIso8601String();
        for (final shipment in state.shipments) {
          await localService.updateShipmentDeliveryDate(
            shipment.shipmentNo,
            deliveryDate,
          );
        }
        developer.log(
          "Delivery approval saved successfully",
          name: "DeliveryApprovalScreenStateNotifier:onApproveDelivery",
        );
        // Invalidate all relevant providers to refresh data
        ref.invalidate(dashboardScreenStateNotifierProvider);
        ref.invalidate(routesScreenStateNotifierProvider);
        // Invalidate route details for this specific route
        ref.invalidate(specimenShipmentRouteDetailsScreenStateNotifierProvider);
        state = state.copyWith(
          showSuccessScreen: true,
          isSavingDelivery: false,
        );
      case Error<bool>():
        developer.log(
          "Failed to save shipment_delivery approval: ${result.message}",
          name: "DeliveryApprovalScreenStateNotifier:onApproveDelivery",
        );
        state = state.copyWith(
          alert: Alert(show: true, message: result.message),
          isSavingDelivery: false,
        );
    }
  }

  onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }
}
