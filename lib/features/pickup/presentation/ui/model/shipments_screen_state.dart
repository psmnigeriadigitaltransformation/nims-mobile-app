import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/etoken_data.dart';
import 'package:nims_mobile_app/core/domain/models/lsp.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/domain/models/location.dart';
import '../../../../../core/domain/models/shipment.dart';

part 'shipments_screen_state.freezed.dart';

@freezed
class ShipmentsScreenState with _$ShipmentsScreenState {
  const ShipmentsScreenState._();

  const factory ShipmentsScreenState({
    required List<DomainFacility> facilities,
    required List<DomainLocation> locations,
    DomainMovementType? movementType,
    @Default([]) List<DomainShipment> shipments,
    DomainFacility? selectedDestinationFacility,
    @Default([]) List<DomainETokenData> usedETokens,
    DomainLsp? lsp,
  }) = _ShipmentsScreenState;

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
