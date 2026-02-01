import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../../core/domain/models/facility.dart';
import '../../../../core/domain/models/movement_type.dart';
import '../../../../core/ui/model/alert.dart';
import '../../../../core/domain/models/manifest.dart';

part 'select_manifests_screen_state.freezed.dart';

@freezed
class SelectManifestsScreenState with _$SelectManifestsScreenState {
  const SelectManifestsScreenState._();

  const factory SelectManifestsScreenState({
    @Default([]) List<DomainFacility> facilities,
    DomainMovementType? movementType,
    DomainFacility? selectedPickUpFacility,
    // @Default([]) List<DomainManifest> manifest,
    @Default([]) List<int> selectedManifestIndices,
    @Default(false) bool isFetchingManifests,
    @Default(Alert(show: false, message: "")) Alert alert,
    @Default([]) List<DomainManifest> manifests,
    /// Map of manifest_no to stage for manifests already in shipments
    @Default({}) Map<String, String> shippedManifestStatuses,
    /// Current user's ID to check manifest ownership
    String? currentUserId,
  }) = _SelectManifestsScreenState;

  bool get isFacilitySelected => selectedPickUpFacility != null;

  List<DomainManifest> get selectedManifests =>
      selectedManifestIndices.map((index) => manifests[index]).toList();
}
