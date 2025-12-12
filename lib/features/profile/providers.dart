import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';

import '../auth/data/providers.dart';

final userProvider = FutureProvider<DomainUser?>(
  (ref) => ref.watch(authRepositoryProvider).getUser(),
);
