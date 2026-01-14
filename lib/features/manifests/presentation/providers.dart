import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/facilities/presentation/ui/facilities_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/facilities/presentation/ui/model/facilities_screen_state.dart';
import 'package:nims_mobile_app/features/manifests/presentation/ui/manifests_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/manifests/presentation/ui/model/manifests_screen_state.dart';

final manifestsScreenStateNotifierProvider =
    AsyncNotifierProvider.autoDispose<ManifestsScreenStateNotifier, ManifestsScreenState>(
      ManifestsScreenStateNotifier.new,
    );
