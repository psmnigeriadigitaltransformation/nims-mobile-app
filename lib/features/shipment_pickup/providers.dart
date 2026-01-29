import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/manifest.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/approval/specimen_shipment_approval/specimen_shipment_approval_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/manifest/manifest_details_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/models/result_pickup_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/models/result_shipment_approval_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/models/result_shipments_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/manifest/manifest_details_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/notifiers/result_pickup_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/notifiers/result_shipment_approval_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipment_pickup/presentation/ui/notifiers/result_shipment_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/approval/specimen_shipment_approval/specimen_shipment_approval_screen_state_notifier.dart';


/// Helper to generate a stable key for specimen screen state
String shipmentsScreenKey(
  DomainMovementType movementType,
  DomainFacility facility,
) {
  return '${movementType.id}_${facility.facilityId}';
}

final shipmentApprovalScreenStateNotifierProvider =
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

final resultPickUpScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      ResultPickUpScreenStateNotifier,
      ResultPickUpScreenState,
      MovementType
    >(ResultPickUpScreenStateNotifier.new);

final manifestDetailsScreenStateNotifierProvider =
    AsyncNotifierProvider.family<
      ManifestDetailsScreenStateNotifier,
      ManifestDetailsScreenState,
      Manifest
    >(ManifestDetailsScreenStateNotifier.new);

/// Provider key uses stable string identifier to ensure state persists across navigation
final resultShipmentsScreenStateNotifierProvider =
    AsyncNotifierProviderFamily<
      ResultShipmentScreenStateNotifier,
      ResultShipmentScreenState,
      String
    >(ResultShipmentScreenStateNotifier.new);

/// Helper to generate a stable key for result specimen screen state
String resultShipmentsScreenKey(
  DomainMovementType movementType,
  DomainFacility facility,
) {
  return 'result_${movementType.id}_${facility.facilityId}';
}

final resultShipmentApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
      ResultShipmentApprovalScreenStateNotifier,
      ResultShipmentApprovalScreenState,
      ({
        DomainFacility destinationFacility,
        DomainMovementType movementType,
        DomainFacility pickUpFacility,
        List<String> shipmentSampleCodes,
        List<DomainShipment> shipments,
      })
    >(ResultShipmentApprovalScreenStateNotifier.new);
