import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'download_master_data_usecase.dart';

final downloadMasterDataUseCaseProvider = Provider(
      (ref) => DownloadMasterDataUseCase(
      facilitiesRepository: ref.watch(facilitiesRepositoryProvider),
      sampleTypesRepository: ref.watch(samplesRepositoryProvider),
      locationsRepository: ref.watch(locationsRepositoryProvider),
      movementTypesRepository: ref.watch(movementTypesRepositoryProvider),
      eTokenRepository: ref.watch(eTokenRepositoryProvider),
      rejectionReasonsRepository: ref.watch(rejectionReasonsRepositoryProvider),
  ),
);