import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/features/dashboard/presentation/ui/dashboard_screen_state_notifier.dart';
import 'package:projects/features/dashboard/presentation/ui/model/dashboard_screen_state.dart';

import '../../core/services/remote/models/login_response.dart';
import '../auth/data/providers.dart';

final dashboardScreenStateNotifierProvider =
AsyncNotifierProvider.autoDispose<DashboardScreenStateNotifier, DashboardScreenState>(
  DashboardScreenStateNotifier.new,
);
