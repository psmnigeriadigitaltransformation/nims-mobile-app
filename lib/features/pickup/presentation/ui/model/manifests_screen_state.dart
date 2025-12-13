import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';

import '../../../../../../core/domain/models/facility.dart';
import '../../../../../../core/domain/models/movement_type.dart';
import '../../../../../../core/ui/model/model/alert.dart';

part 'manifests_screen_state.freezed.dart';

@freezed
class ManifestsScreenState with _$ManifestsScreenState {
  const factory ManifestsScreenState({
    required List<DomainFacility> facilities,
    required String movement
  }) = _ManifestsScreenStatee;

  factory ManifestsScreenState.initial() => const ManifestsScreenState(
    facilities: [],
    movement: ""
  );
}
