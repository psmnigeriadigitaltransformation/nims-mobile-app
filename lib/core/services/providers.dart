import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/local/nims_local_service.dart';
import '../../core/services/location/geo_location_service.dart';
import '../../core/services/remote/nims_api_service.dart';

final nimsApiServiceProvider = Provider((ref) => NIMSAPIService());
final nimsLocalServiceProvider = Provider((ref) => NIMSLocalService());
final geoLocationServiceProvider = Provider((ref) => GeoLocationService());
