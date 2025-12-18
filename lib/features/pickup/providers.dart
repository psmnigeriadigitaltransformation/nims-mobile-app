import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/domain/models/movement_type.dart';
import 'package:projects/core/utils/result.dart';
import 'package:projects/features/pickup/presentation/ui/model/add_new_manifest_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/model/shipment_approval_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/add_new_manifest_screen_state_notifier.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/manifests_screen_state_notifier.dart';
import 'package:projects/features/pickup/presentation/ui/model/manifests_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/model/shipments_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/result_pickup_screen_state_notifier.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/shipment_approval_screen_state_notifier.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/shipment_screen_state_notifier.dart';

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

final shipmentsScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      ShipmentScreenStateNotifier,
      ShipmentsScreenState,
      ({
        DomainMovementType movementType,
        DomainFacility pickUpFacility,
        List<DomainManifest> manifests,
      })
    >(ShipmentScreenStateNotifier.new);

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
