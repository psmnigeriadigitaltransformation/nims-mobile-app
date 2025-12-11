import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/features/facilities/data/repository/facilities_repository.dart';

import '../../../core/services/providers.dart';

final facilitiesRepositoryProvider = Provider(
  (ref) => FacilitiesRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);