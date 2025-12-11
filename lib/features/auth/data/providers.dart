import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/features/auth/data/repository/auth_repository.dart';

import '../../../core/services/providers.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);
