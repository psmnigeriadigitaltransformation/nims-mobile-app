import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/domain/models/location.dart';

part 'shipments_screen_state.freezed.dart';

@freezed
class ShipmentsScreenState with _$ShipmentsScreenState {
  const factory ShipmentsScreenState({
    required List<DomainFacility> facilities,
    required List<DomainLocation> locations,
    required String movement
  }) = _ShipmentsScreenState;

  factory ShipmentsScreenState.initial() => const ShipmentsScreenState(
    facilities: [],
    locations: [],
    movement: "",
  );
}
