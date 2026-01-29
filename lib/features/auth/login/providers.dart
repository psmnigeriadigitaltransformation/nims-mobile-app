import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_screen_state_notifier.dart';
import 'login_screen_state.dart';

final loginScreenStateNotifierProvider =
    NotifierProvider<LoginScreenStateNotifier, LoginScreenState>(
      LoginScreenStateNotifier.new,
    );
