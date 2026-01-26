
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Global RouteObserver for detecting route changes
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
