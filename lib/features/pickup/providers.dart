import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projects/features/pickup/presentation/ui/model/add_new_manifest_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/add_new_manifest_screen_state_notifier.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/manifests_screen_state_notifier.dart';
import 'package:projects/features/pickup/presentation/ui/model/manifests_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/model/result_pickup_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/model/shipments_screen_state.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/result_pickup_screen_state_notifier.dart';
import 'package:projects/features/pickup/presentation/ui/notifiers/shipments_screen_state_notifier.dart';

final resultPickUpScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      ResultPickUpScreenStateNotifier,
      ResultPickUpScreenState,
      String
    >(ResultPickUpScreenStateNotifier.new);

final manifestsScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      ManifestsScreenStateNotifier,
      ManifestsScreenState,
      String
    >(ManifestsScreenStateNotifier.new);

final shipmentsScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      ShipmentsScreenStateNotifier,
      ShipmentsScreenState,
      String
    >(ShipmentsScreenStateNotifier.new);

final addNewManifestScreenStateNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      AddNewManifestScreenStateNotifier,
      AddNewManifestScreenState,
      String
    >(AddNewManifestScreenStateNotifier.new);
