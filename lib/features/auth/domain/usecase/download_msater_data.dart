import 'dart:developer' as developer;

import 'package:projects/core/utils/result.dart';
import 'package:projects/features/facilities/data/repository/facilities_repository.dart';

import '../../../../core/data/repository/locations_repository.dart';
import '../../../../core/data/repository/movement_types_repository.dart';
import '../../../../core/data/repository/samples_repository.dart';

class DownloadMasterDataUseCase {
  final FacilitiesRepository facilitiesRepository;
  final SamplesRepository sampleTypesRepository;
  final LocationsRepository locationsRepository;
  final MovementTypesRepository movementTypesRepository;

  DownloadMasterDataUseCase({
    required this.facilitiesRepository,
    required this.sampleTypesRepository,
    required this.locationsRepository,
    required this.movementTypesRepository,
  });

  Future<Result<bool>> execute(bool refresh) async {
    try {
      await facilitiesRepository.getFacilities(refresh);
      await sampleTypesRepository.getSampleTypes(refresh);
      await locationsRepository.getLocations(refresh);
      await movementTypesRepository.getMovementTypes(refresh);
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
