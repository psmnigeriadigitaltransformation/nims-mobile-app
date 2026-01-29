import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/approval/specimen_shipment_approval/specimen_shipment_approval_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/models/specimen_shipments_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/approval/specimen_shipment_approval/specimen_shipment_approval_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/notifiers/specimen_shipment_screen_state_notifier.dart';


/// Provider key uses stable string identifier to ensure state persists across navigation
final specimenShipmentsScreenStateNotifierProvider =
    AsyncNotifierProviderFamily<
      SpecimenShipmentScreenStateNotifier,
      SpecimenShipmentScreenState,
      String
    >(SpecimenShipmentScreenStateNotifier.new);

/// Helper to generate a stable key for specimen screen state
String shipmentsScreenKey(
  DomainMovementType movementType,
  DomainFacility facility,
) {
  return '${movementType.id}_${facility.facilityId}';
}

final specimenShipmentApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
      SpecimenShipmentApprovalScreenStateNotifier,
      SpecimenShipmentApprovalScreenState,
      ({
        DomainMovementType movementType,
        DomainFacility pickUpFacility,
        DomainFacility destinationFacility,
        List<DomainShipment> shipments,
      })
    >(SpecimenShipmentApprovalScreenStateNotifier.new);