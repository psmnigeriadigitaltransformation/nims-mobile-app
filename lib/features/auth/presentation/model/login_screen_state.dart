import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/ui/model/model/alert.dart';

part 'login_screen_state.freezed.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    required bool isLoginLoading,
    required Alert alert,
  }) = _LoginScreenState;

}