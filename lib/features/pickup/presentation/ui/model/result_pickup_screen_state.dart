import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';

part 'result_pickup_screen_state.freezed.dart';

@freezed
class ResultPickUpScreenState with _$ResultPickUpScreenState {
  const factory ResultPickUpScreenState({
    required List<DomainFacility> facilities,
    required String movement
  }) = _ResultPickUpScreenStatee;

  factory ResultPickUpScreenState.initial() => const ResultPickUpScreenState(
    facilities: [],
    movement: ""
  );
}
