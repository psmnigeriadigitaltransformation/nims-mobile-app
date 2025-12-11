import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/ui/login/login_screen_state_notifier.dart';
import 'model/login_screen_state.dart';

final loginScreenStateNotifierProvider =
    NotifierProvider<LoginScreenStateNotifier, LoginScreenState>(
      LoginScreenStateNotifier.new,
    );
