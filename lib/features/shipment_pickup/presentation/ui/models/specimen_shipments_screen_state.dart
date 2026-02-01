import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/etoken_data.dart';
import 'package:nims_mobile_app/core/domain/models/lsp.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/alert.dart';
import '../../../../../core/domain/models/location.dart';
import '../../../../../core/domain/models/shipment.dart';

part 'specimen_shipments_screen_state.freezed.dart';

@freezed
class SpecimenShipmentScreenState with _$SpecimenShipmentScreenState {
  const SpecimenShipmentScreenState._();

  const factory SpecimenShipmentScreenState({
    required List<DomainFacility> facilities,
    required List<DomainLocation> locations,
    DomainMovementType? movementType,
    @Default([]) List<DomainShipment> shipments,
    DomainFacility? selectedDestinationFacility,
    @Default([]) List<DomainETokenData> usedETokens,
    DomainLsp? lsp,
    /// Maps facilityId to all its types (for auto-detection when facility has multiple types)
    @Default({}) Map<int, List<String>> facilityTypesMap,
  }) = _SpecimenShipmentsScreenState;

  // factory ShipmentsScreenState.initial() => const ShipmentsScreenState(
  //   facilities: [],
  //   locations: [],
  //   movement: "",
  // );
  bool get isGoToApprovalButtonEnabled =>
  selectedDestinationFacility != null &&
      shipments.isNotEmpty &&
      shipments.every(
        (shipment) => shipment.destinationLocationType.isNotEmpty,
      );
}
