import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/features/auth/data/repository/auth_repository.dart';
import 'package:projects/features/auth/data/providers.dart';

import '../../../../../core/ui/model/model/alert.dart';
import '../../../../../core/utils/result.dart';
import '../../../../../core/services/remote/models/login_response.dart';
import '../../model/login_screen_state.dart';

class LoginScreenStateNotifier extends Notifier<LoginScreenState> {
  late AuthRepository authRepository;

  @override
  LoginScreenState build() {
    authRepository = ref.watch(authRepositoryProvider);
    return LoginScreenState(
      isLoginLoading: false,
      alert: Alert(show: false, message: ''),
    );
  }

  Future<void> login({
    required String loginId,
    required String password,
    VoidCallback? onSuccess,
  }) async {
    state = state.copyWith(isLoginLoading: true);
    final result = await authRepository.login(loginId, password);
    switch (result) {
      case Success<LoginResponse>():
        developer.log(
          "success result: ${result.payload}",
          name: "LoginScreenStateNotifier:login",
        );
        onSuccess?.call();
      case Error<LoginResponse>():
        developer.log(
          "error message: ${result.message}",
          name: "LoginScreenStateNotifier:login",
        );
        state = state.copyWith(
          alert: Alert(show: true, message: result.message),
        );
    }
    state = state.copyWith(isLoginLoading: false);
  }

  void onDismissAlertDialog() {
    state = state.copyWith(alert: Alert(show: false, message: ""));
  }
}
