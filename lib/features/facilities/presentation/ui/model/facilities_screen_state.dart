import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../core/domain/models/facility.dart';
import '../../../../../core/ui/model/model/alert.dart';

part 'facilities_screen_state.freezed.dart';

@freezed
class FacilitiesScreenState with _$FacilitiesScreenState {
  const factory FacilitiesScreenState({
    required List<DomainFacility> hubFacilities,
    required List<DomainFacility> spokeFacilities,
    required List<DomainFacility> pcrFacilities,
    required List<DomainFacility> geneXpertFacilities,
  }) = _FacilitiesScreenState;

  factory FacilitiesScreenState.initial() => const FacilitiesScreenState(
    hubFacilities: [],
    spokeFacilities: [],
    pcrFacilities: [],
    geneXpertFacilities: [],
  );
}
