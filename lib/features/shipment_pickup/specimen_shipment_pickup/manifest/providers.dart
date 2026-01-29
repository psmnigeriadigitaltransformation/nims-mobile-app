import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/manifest/add_new_manifest_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/manifest/add_new_manifest_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/manifest/manifests_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/shipment_pickup/specimen_shipment_pickup/manifest/select_manifests_screen_state.dart';

final selectManifestsScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      SelectManifestsScreenStateNotifier,
      SelectManifestsScreenState,
      ({DomainMovementType movementType})
    >(SelectManifestsScreenStateNotifier.new);

final addNewManifestScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      AddNewManifestScreenStateNotifier,
      AddNewManifestScreenState,
      ({DomainMovementType movementType, DomainFacility pickUpFacility})
    >(AddNewManifestScreenStateNotifier.new);

