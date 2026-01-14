import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/features/auth/data/repository/auth_repository.dart';
import 'package:nims_mobile_app/features/auth/domain/usecase/download_msater_data.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';

import '../../../core/services/providers.dart';

final downloadMasterDataUseCaseProvider = Provider(
  (ref) => DownloadMasterDataUseCase(
    facilitiesRepository: ref.watch(facilitiesRepositoryProvider),
    sampleTypesRepository: ref.watch(samplesRepositoryProvider),
    locationsRepository: ref.watch(locationsRepositoryProvider),
    movementTypesRepository: ref.watch(movementTypesRepositoryProvider),
    eTokenRepository: ref.watch(eTokenRepositoryProvider)
  ),
);
