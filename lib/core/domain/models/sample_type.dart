import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_type.freezed.dart';
part 'sample_type.g.dart';

@freezed
class SampleType with _$SampleType {
  const factory SampleType({
    required int? id,
    required String? pick,
    @JsonKey(name: 'sample_id') required int? sampleId,
    @JsonKey(name: 'full_name') required String? fullName,
  }) = _SampleType;

  factory SampleType.fromJson(Map<String, dynamic> json)
  => _$SampleTypeFromJson(json);
}
