import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/manifest.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/add_new_manifest_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/manifest_details_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/result_shipment_approval_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/result_shipments_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/shipment_approval_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/add_new_manifest_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/manifest_details_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/manifests_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/manifests_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/result_pickup_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/shipments_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/result_pickup_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/result_shipment_approval_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/result_shipment_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/specimen_shipment_approval_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/specimen_shipment_screen_state_notifier.dart';

final manifestsScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      ManifestsScreenStateNotifier,
      ManifestsScreenState,
      ({DomainMovementType movementType})
    >(ManifestsScreenStateNotifier.new);

final addNewManifestScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      AddNewManifestScreenStateNotifier,
      AddNewManifestScreenState,
      ({DomainMovementType movementType, DomainFacility pickUpFacility})
    >(AddNewManifestScreenStateNotifier.new);

/// Provider key uses stable string identifier to ensure state persists across navigation
final shipmentsScreenStateNotifierProvider =
    AsyncNotifierProviderFamily<
      SpecimenShipmentScreenStateNotifier,
      SpeimenShipmentScreenState,
      String
    >(SpecimenShipmentScreenStateNotifier.new);

/// Helper to generate a stable key for specimen screen state
String shipmentsScreenKey(DomainMovementType movementType, DomainFacility facility) {
  return '${movementType.id}_${facility.facilityId}';
}

final shipmentApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
      SpecimenShipmentApprovalScreenStateNotifier,
      ShipmentApprovalScreenState,
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
String resultShipmentsScreenKey(DomainMovementType movementType, DomainFacility facility) {
  return 'result_${movementType.id}_${facility.facilityId}';
}

final resultShipmentApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
      ResultShipmentApprovalScreenStateNotifier,
      ResultShipmentApprovalScreenState,
      ({
        DomainMovementType movementType,
        DomainFacility pickUpFacility,
        DomainFacility destinationFacility,
        List<DomainShipment> shipments,
      List<String> shipmentSampleCodes,
      })
    >(ResultShipmentApprovalScreenStateNotifier.new);
