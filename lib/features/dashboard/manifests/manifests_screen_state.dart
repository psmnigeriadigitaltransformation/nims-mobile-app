import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart';

import '../../../core/domain/models/facility.dart';
import '../../../core/domain/models/manifest.dart';
import '../../../core/ui/model/alert.dart';

part 'manifests_screen_state.freezed.dart';

@freezed
class ManifestsScreenState with _$ManifestsScreenState {
  const factory ManifestsScreenState({
    required List<DomainManifest> manifests,
    @Default('') String searchQuery,
    Alert? alert,
    @Default(false) bool isDeleting,
    @Default({}) Map<String, String> shippedManifestStatuses,
    String? currentUserId,
  }) = _ManifestsScreenState;

}
