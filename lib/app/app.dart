import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/app/providers.dart';
import 'package:projects/app/router.dart';
import 'package:projects/core/ui/theme/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "NIMS",
      debugShowCheckedModeBanner: false,
      theme: NIMSTheme.lightTheme,
      darkTheme: NIMSTheme.darkTheme,
      themeMode: ref.watch(themeModeProvider),
      routerConfig: router,
    );
  }
}