import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/domain/models/manifest.dart';

part 'manifests_screen_state.freezed.dart';

@freezed
class ManifestsScreenState with _$ManifestsScreenState {
  const ManifestsScreenState._();

  const factory ManifestsScreenState({
    @Default([]) List<DomainFacility> facilities,
    DomainMovementType? movementType,
    DomainFacility? selectedPickUpFacility,
    // @Default([]) List<DomainManifest> manifests,
    @Default([]) List<int> selectedManifestIndices,
    @Default(false) bool isFetchingManifests,
    @Default(Alert(show: false, message: "")) Alert alert,
    @Default([]) List<DomainManifest> manifests,
  }) = _ManifestsScreenState;

  // factory ManifestsScreenState.initial() =>
  //     const ManifestsScreenState();

  bool get isFacilitySelected => selectedPickUpFacility != null;

  List<DomainManifest> get selectedManifests =>
      selectedManifestIndices.map((index) => manifests[index]).toList();
}
