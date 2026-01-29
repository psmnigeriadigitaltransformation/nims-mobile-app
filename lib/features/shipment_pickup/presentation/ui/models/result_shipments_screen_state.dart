import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/etoken_data.dart';
import 'package:nims_mobile_app/core/domain/models/lsp.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../core/domain/models/location.dart';
import '../../../../../core/domain/models/shipment.dart';

part 'result_shipments_screen_state.freezed.dart';

@freezed
class ResultShipmentScreenState with _$ResultShipmentScreenState {
  const ResultShipmentScreenState._();

  const factory ResultShipmentScreenState({
    required List<DomainFacility> facilities,
    required List<DomainLocation> locations,
    DomainMovementType? movementType,
    @Default([]) List<DomainShipment> shipments,
    DomainFacility? selectedDestinationFacility,
    @Default([]) List<DomainETokenData> usedETokens,
    DomainLsp? lsp,
    // Map of manifest_no to list of sample codes for that specimen
    @Default([]) List<String> shipmentSampleCodes,
  }) = _ResultShipmentsScreenState;

  bool get isGoToApprovalButtonEnabled =>
      selectedDestinationFacility != null &&
      shipments.isNotEmpty &&
      shipments.every(
        (shipment) => shipment.destinationLocationType.isNotEmpty,
      );
}
