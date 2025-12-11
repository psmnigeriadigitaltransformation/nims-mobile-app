import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../core/ui/model/model/alert.dart';

part 'facilities_screen_state.freezed.dart';

@freezed
class FacilitiesScreenState with _$FacilitiesScreenState {
  const factory FacilitiesScreenState({
    required List<FacilityItem> hubFacilities,
    required List<FacilityItem> spokeFacilities,
    required List<FacilityItem> pcrFacilities,
    required List<FacilityItem> geneXpertFacilities,
  }) = _FacilitiesScreenState;

  factory FacilitiesScreenState.initial() => const FacilitiesScreenState(
    hubFacilities: [],
    spokeFacilities: [],
    pcrFacilities: [],
    geneXpertFacilities: [],
  );
}
