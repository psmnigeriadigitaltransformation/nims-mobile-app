import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/features/facilities/presentation/ui/facilities_screen_state_notifier.dart';
import 'package:projects/features/facilities/presentation/ui/model/facilities_screen_state.dart';

final facilitiesScreenStateNotifierProvider =
    AsyncNotifierProvider.autoDispose<FacilitiesScreenStateNotifier, FacilitiesScreenState>(
      FacilitiesScreenStateNotifier.new,
    );
