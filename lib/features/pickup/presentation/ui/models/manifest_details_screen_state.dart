import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nims_mobile_app/core/domain/models/manifest.dart';
import 'package:nims_mobile_app/core/domain/models/sample.dart';

part 'manifest_details_screen_state.freezed.dart';

@freezed
class ManifestDetailsScreenState with _$ManifestDetailsScreenState {
  const factory ManifestDetailsScreenState({
    required Manifest manifest,
    @Default([]) List<Sample> samples,
    @Default(true) bool isLoading,
  }) = _ManifestDetailsScreenState;
}
