import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';

@freezed
class Alert with _$Alert {
  const factory Alert({
    required bool show,
    required String message,
  }) = _Alert;

}