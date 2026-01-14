import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/repository/etoken_repository.dart';
import 'package:nims_mobile_app/core/data/repository/locations_repository.dart';
import 'package:nims_mobile_app/core/data/repository/manifest_repository.dart';
import 'package:nims_mobile_app/core/data/repository/movement_types_repository.dart';
import 'package:nims_mobile_app/core/data/repository/samples_repository.dart';
import 'package:nims_mobile_app/core/data/repository/shipment_routes_repository.dart';
import 'package:nims_mobile_app/core/data/repository/shipments_repository.dart';
import 'package:nims_mobile_app/features/facilities/data/repository/facilities_repository.dart';

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

final manifestRepositoryProvider = Provider(
      (ref) => ManifestRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);

final shipmentRouteRepositoryProvider = Provider(
      (ref) => ShipmentRoutesRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);

final shipmentsRepositoryProvider = Provider(
      (ref) => ShipmentsRepository(
    ref.watch(nimsApiServiceProvider),
    ref.watch(nimsLocalServiceProvider),
  ),
);