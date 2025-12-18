import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/domain/models/location.dart';
import '../../../../../core/domain/models/sample.dart';
import '../../../../../core/domain/models/sample_type.dart';

part 'add_new_manifest_screen_state.freezed.dart';

@freezed
class AddNewManifestScreenState with _$AddNewManifestScreenState {
  const AddNewManifestScreenState._();

  const factory AddNewManifestScreenState({
    @Default([]) List<DomainFacility> facilities,
    @Default([]) List<DomainSampleType> sampleTypes,
    @Default([]) List<DomainSample> samples,
    DomainMovementType? movementType,
    DomainFacility? selectedDestinationFacility,
    DomainFacility? pickUpFacility,
    DomainSampleType? selectedSampleType,
    required String manifestNo,
    @Default(false) bool isSavingManifest,
    @Default(Alert(show: false, message: "")) Alert alert
  }) = _AddNewManifestScreenState;

  // factory AddNewManifestScreenState.initial() =>
  //     const AddNewManifestScreenState();

  bool get isDestinationFacilitySelected => selectedDestinationFacility != null;

  bool get _isSampleTypeSelected => selectedSampleType != null;

  bool get _isSampleListEmpty => samples.isEmpty;

  bool get isSaveManifestButtonEnabled =>
      isDestinationFacilitySelected &&
      _isSampleTypeSelected &&
      !_isSampleListEmpty;

  bool get isSpecimenCountTitleAndAddSpecimenButtonVisible =>
      isDestinationFacilitySelected && _isSampleTypeSelected;
}
