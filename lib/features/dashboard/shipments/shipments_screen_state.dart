import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../core/domain/models/facility.dart';
import '../../../core/domain/models/manifest.dart';
import '../../../core/domain/models/shipment.dart';
import '../../../core/ui/model/alert.dart';

part 'shipments_screen_state.freezed.dart';

@freezed
class ShipmentsScreenState with _$ShipmentsScreenState {
  const factory ShipmentsScreenState({
    required List<DomainShipment> shipments,
  }) = _ShipmentsScreenState;

}
