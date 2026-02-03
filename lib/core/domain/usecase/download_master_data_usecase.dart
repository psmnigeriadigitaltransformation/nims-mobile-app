import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/data/repository/etoken_repository.dart';
import 'package:nims_mobile_app/core/data/repository/rejection_reasons_repository.dart';
import 'package:nims_mobile_app/core/utils/result.dart';
import 'package:nims_mobile_app/core/data/repository/facilities_repository.dart';

import '../../data/repository/locations_repository.dart';
import '../../data/repository/movement_types_repository.dart';
import '../../data/repository/samples_repository.dart';

class DownloadMasterDataUseCase {
  final FacilitiesRepository facilitiesRepository;
  final SamplesRepository sampleTypesRepository;
  final LocationsRepository locationsRepository;
  final MovementTypesRepository movementTypesRepository;
  final ETokenRepository eTokenRepository;
  final RejectionReasonsRepository rejectionReasonsRepository;

  DownloadMasterDataUseCase({
    required this.facilitiesRepository,
    required this.sampleTypesRepository,
    required this.locationsRepository,
    required this.movementTypesRepository,
    required this.eTokenRepository,
    required this.rejectionReasonsRepository,
  });

  Future<Result<bool>> execute(bool refresh) async {
    try {
      await facilitiesRepository.getFacilities(refresh);
      await sampleTypesRepository.getSampleTypes(refresh);
      await locationsRepository.getLocations(refresh);
      await movementTypesRepository.getMovementTypes(refresh);
      await rejectionReasonsRepository.getRejectionReasons(refresh);
      final int eTokenBalance = await eTokenRepository.getETokenBalance();
      if (eTokenBalance < 5) {
        await eTokenRepository.generateETokens(5);
      }
      return Success(true);
    } catch (e, s) {
      developer.log('Error downloading master data: $e');
      return Error(
        "Error downloading master data",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
