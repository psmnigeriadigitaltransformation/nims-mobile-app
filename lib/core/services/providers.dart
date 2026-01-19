import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/local/nims_local_service.dart';
import '../../core/services/location/geo_location_service.dart';
import '../../core/services/network/connectivity_service.dart';
import '../../core/services/remote/nims_api_service.dart';
import '../../core/services/sync/sync_service.dart';

final nimsApiServiceProvider = Provider((ref) => NIMSAPIService());
final nimsLocalServiceProvider = Provider((ref) => NIMSLocalService());
final geoLocationServiceProvider = Provider((ref) => GeoLocationService());

final connectivityServiceProvider = Provider((ref) {
  final service = ConnectivityService();
  ref.onDispose(() => service.dispose());
  return service;
});

final syncServiceProvider = Provider((ref) {
  final apiService = ref.watch(nimsApiServiceProvider);
  final localService = ref.watch(nimsLocalServiceProvider);
  final connectivityService = ref.watch(connectivityServiceProvider);

  final syncService = SyncService(
    apiService,
    localService,
    connectivityService,
  );

  ref.onDispose(() => syncService.dispose());
  return syncService;
});
