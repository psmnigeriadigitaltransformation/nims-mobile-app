import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/model/model/alert.dart';
import 'package:nims_mobile_app/features/auth/data/providers.dart';
import 'package:nims_mobile_app/features/facilities/data/providers.dart';

import '../../../../../core/utils/list_extensions.dart';
import '../../../../../core/utils/result.dart';
import '../../../providers.dart';
import '../models/add_new_manifest_screen_state.dart';
import '../models/manifests_screen_state.dart';

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
    final localService = ref.read(nimsLocalServiceProvider);
    final eTokenService = ref.read(eTokenServiceProvider);

    final facilitiesResult = await facilitiesRepository.getFacilities(false);
    final sampleTypesResult = await sampleTypesRepository.getSampleTypes(false);

    // Get LSP for manifest number generation
    final lsp = await localService.getFirstCachedLsp();

    if (lsp == null) {
      throw Exception("No LSP available. Please sync your data.");
    }

    // Get etoken (auto-downloads if needed)
    final etoken = await eTokenService.getNextEToken();

    // Generate manifest number using LSP display and EToken serial number
    final manifestNo = '${lsp.display}-${etoken.serialNo}';

    if (facilitiesResult is Success && sampleTypesResult is Success) {
      return AddNewManifestScreenState(
        facilities: (facilitiesResult as Success<List<DomainFacility>>).payload
            .where(
              (facility) =>
                  param.movementType.destinationPrimary?.toLowerCase().contains(
                    facility.type?.toLowerCase() ?? "",
                  ) == true ||
                  param.movementType.destinationSecondary
                      ?.toLowerCase()
                      .contains(facility.type?.toLowerCase() ?? "") == true,
            )
            .distinctBy((facility) => facility.facilityId),
        sampleTypes:
            (sampleTypesResult as Success<List<DomainSampleType>>).payload,
        movementType: param.movementType,
        pickUpFacility: param.pickUpFacility,
        manifestNo: manifestNo,
        usedEToken: etoken,
        lsp: lsp,
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
          isSavingManifest: false,
          alert: Alert(
            show: true,
            message: "Something went wrong or an error occurred",
          ),
        ),
      );
    } else {
      final manifestRepository = ref.read(manifestRepositoryProvider);
      final authRepository = ref.read(authRepositoryProvider);
      final localService = ref.read(nimsLocalServiceProvider);
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
          lspCode: data.lsp?.lspCode ?? "",
          userId: user?.userId ?? "",
          originatingFacilityName: data.pickUpFacility?.facilityName ?? "",
          destinationFacilityName: data.selectedDestinationFacility?.facilityName ?? "",
        ),
        data.samples,
      );

      switch (result) {
        case Success<bool>():
          // Delete the used etoken after successful save
          if (data.usedEToken?.etokenId != null) {
            await localService.deleteEToken(data.usedEToken!.etokenId!);
            developer.log(
              "Deleted used etoken: ${data.usedEToken!.etokenId}",
              name: "AddNewManifestScreenStateNotifier:onSaveManifest",
            );
          }
          state = state.whenData((data) => data.copyWith(isSavingManifest: false));
          if (state.requireValue.movementType != null) {
            ref.read(
              manifestsScreenStateNotifierProvider((movementType: state.requireValue.movementType!)).notifier,
            ).onSaveManifest();
          }
          onSaveManifest();
        case Error<bool>():
          state = state.whenData(
            (data) => data.copyWith(
              isSavingManifest: false,
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
