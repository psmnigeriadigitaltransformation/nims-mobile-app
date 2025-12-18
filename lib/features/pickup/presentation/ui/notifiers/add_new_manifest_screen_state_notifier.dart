import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/data/providers.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/domain/models/movement_type.dart';
import 'package:projects/core/ui/model/model/alert.dart';
import 'package:projects/features/auth/data/providers.dart';
import 'package:projects/features/facilities/data/providers.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/utils/result.dart';
import '../../../providers.dart';
import '../model/add_new_manifest_screen_state.dart';
import '../model/manifests_screen_state.dart';

class AddNewManifestScreenStateNotifier
    extends
        AutoDisposeFamilyAsyncNotifier<
          AddNewManifestScreenState,
          ({DomainMovementType movementType, DomainFacility pickUpFacility})
        > {
  @override
  Future<AddNewManifestScreenState> build(
    ({DomainMovementType movementType, DomainFacility pickUpFacility}) param,
  ) {
    return _loadData(param);
  }

  Future<AddNewManifestScreenState> _loadData(
    ({DomainMovementType movementType, DomainFacility pickUpFacility}) param,
  ) async {
    final facilitiesRepository = ref.read(facilitiesRepositoryProvider);
    final sampleTypesRepository = ref.read(samplesRepositoryProvider);

    final facilitiesResult = await facilitiesRepository.getFacilities(false);
    final sampleTypesResult = await sampleTypesRepository.getSampleTypes(false);

    if (facilitiesResult is Success && sampleTypesResult is Success) {
      return AddNewManifestScreenState(
        facilities: (facilitiesResult as Success<List<DomainFacility>>).payload
            .where(
              (facility) =>
                  param.movementType.destinationPrimary!.toLowerCase().contains(
                    facility.type?.toLowerCase() ?? "",
                  ) ||
                  param.movementType.destinationSecondary!
                      .toLowerCase()
                      .contains(facility.type?.toLowerCase() ?? ""),
            )
            .toList(),
        sampleTypes:
            (sampleTypesResult as Success<List<DomainSampleType>>).payload,
        movementType: param.movementType,
        pickUpFacility: param.pickUpFacility,
        manifestNo: Uuid().v4(),
      );
    } else {
      throw Exception("Something went wrong or an error occurred");
    }
  }

  Future<void> refreshState() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg));
  }

  onSelectDestinationFacility(DomainFacility facility) {
    developer.log(
      "AddNewManifestScreenStateNotifier:onSelectDestinationFacility $facility",
    );
    state = state.whenData(
      (data) => data.copyWith(selectedDestinationFacility: facility),
    );
  }

  onSelectSampleType(DomainSampleType sampleType) {
    developer.log(
      "AddNewManifestScreenStateNotifier:onSelectSampleType $sampleType",
    );
    state = state.whenData(
      (data) => data.copyWith(selectedSampleType: sampleType),
    );
  }

  onSavedSpecimen(DomainSample sample) {
    developer.log("AddNewManifestScreenStateNotifier:onSavedSpecimen $sample");
    state = state.whenData(
      (data) => data.copyWith(samples: [...data.samples, sample]),
    );
  }

  onConfirmDeleteSpecimen(DomainSample sample) {
    developer.log(
      "AddNewManifestScreenStateNotifier:onConfirmDeleteSpecimen $sample",
    );
    state = state.whenData(
      (data) => data.copyWith(
        samples: data.samples.where((s) => s != sample).toList(),
      ),
    );
  }

  Future<void> onSaveManifest(VoidCallback onSaveManifest) async {
    developer.log("AddNewManifestScreenStateNotifier:onSaveManifest");
    state = state.whenData((data) => data.copyWith(isSavingManifest: true));
    final data = state.valueOrNull;
    if (data == null) {
      state = state.whenData(
        (data) => data.copyWith(
          alert: Alert(
            show: true,
            message: "Something went wrong or an error occurred",
          ),
        ),
      );
    } else {
      final manifestRepository = ref.read(manifestRepositoryProvider);
      final authRepository = ref.read(authRepositoryProvider);
      final user = await authRepository.getUser();

      final result = await manifestRepository.saveManifest(
        DomainManifest(
          manifestNo: data.manifestNo,
          originId: data.pickUpFacility?.facilityId?.toString() ?? "",
          destinationId:
              data.selectedDestinationFacility?.facilityId?.toString() ?? "",
          sampleType: data.selectedSampleType?.fullName ?? "",
          sampleCount: data.samples.length,
          phlebotomyNo: '',
          lspCode: '',
          userId: user?.userId ?? "",
          originatingFacilityName: data.pickUpFacility?.facilityName ?? "",
        ),
        data.samples,
      );

      switch (result) {
        case Success<bool>():
          if (state.requireValue.movementType != null) {
            ref.read(
              manifestsScreenStateNotifierProvider((movementType: state.requireValue.movementType!)).notifier,
            ).onSaveManifest();
          }
          onSaveManifest();
        case Error<bool>():
          state = state.whenData(
            (data) => data.copyWith(
              alert: Alert(show: true, message: result.message),
            ),
          );
      }
    }
  }

  onDismissAlertDialog() {
    developer.log("AddNewManifestScreenStateNotifier:onDismissAlertDialog");
    state = state.whenData(
      (data) => data.copyWith(alert: Alert(show: false, message: "")),
    );
  }
}
