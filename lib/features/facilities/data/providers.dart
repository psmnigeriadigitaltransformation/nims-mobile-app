import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/features/facilities/data/repository/facilities_repository.dart';

import '../../../core/services/providers.dart';

final facilitiesRepositoryProvider = Provider(
  (ref) => FacilitiesRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);