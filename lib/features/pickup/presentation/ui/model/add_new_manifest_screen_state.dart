import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/domain/models/location.dart';
import '../../../../../core/domain/models/sample_type.dart';

part 'add_new_manifest_screen_state.freezed.dart';

@freezed
class AddNewManifestScreenState with _$AddNewManifestScreenState {
  const factory AddNewManifestScreenState({
    required List<DomainFacility> facilities,
    required List<DomainSampleType> sampleTypes,
    required String movement
  }) = _SAddNewManifestScreenState;

  factory AddNewManifestScreenState.initial() => const AddNewManifestScreenState(
    facilities: [],
    sampleTypes: [],
    movement: "",
  );
}
