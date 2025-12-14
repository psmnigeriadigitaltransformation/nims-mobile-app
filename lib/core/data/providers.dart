import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/repository/etoken_repository.dart';
import 'package:projects/core/data/repository/locations_repository.dart';
import 'package:projects/core/data/repository/movement_types_repository.dart';
import 'package:projects/core/data/repository/samples_repository.dart';
import 'package:projects/features/facilities/data/repository/facilities_repository.dart';

import '../../../core/services/providers.dart';

final locationsRepositoryProvider = Provider(
  (ref) => LocationsRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);

final samplesRepositoryProvider = Provider(
  (ref) => SamplesRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);

final movementTypesRepositoryProvider = Provider(
  (ref) => MovementTypesRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);

final eTokenRepositoryProvider = Provider(
      (ref) => ETokenRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);