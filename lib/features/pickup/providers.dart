import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/add_new_manifest_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/shipment_approval_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/add_new_manifest_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/manifests_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/manifests_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/model/shipments_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/result_pickup_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/shipment_approval_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/notifiers/shipment_screen_state_notifier.dart';

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
      ShipmentScreenStateNotifier,
      ShipmentsScreenState,
      String
    >(ShipmentScreenStateNotifier.new);

/// Helper to generate a stable key for shipment screen state
String shipmentsScreenKey(DomainMovementType movementType, DomainFacility facility) {
  return '${movementType.id}_${facility.facilityId}';
}

final shipmentApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
      ShipmentApprovalScreenStateNotifier,
      ShipmentApprovalScreenState,
      ({
        DomainMovementType movementType,
        DomainFacility pickUpFacility,
        DomainFacility destinationFacility,
        List<DomainShipment> shipments,
      })
    >(ShipmentApprovalScreenStateNotifier.new);

final resultPickUpScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      ResultPickUpScreenStateNotifier,
      ResultPickUpScreenState,
      DomainMovementType
    >(ResultPickUpScreenStateNotifier.new);
