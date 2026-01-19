import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/app/providers.dart';
import 'package:nims_mobile_app/app/router.dart';
import 'package:nims_mobile_app/core/services/providers.dart';
import 'package:nims_mobile_app/core/ui/theme/theme.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // Initialize connectivity monitoring and auto-sync
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSyncServices();
    });
  }

  void _initializeSyncServices() {
    // Start connectivity monitoring
    final connectivityService = ref.read(connectivityServiceProvider);
    connectivityService.startMonitoring();

    // Start auto-sync (will sync when network becomes available)
    final syncService = ref.read(syncServiceProvider);
    syncService.startAutoSync();

    // Attempt initial sync if already online
    syncService.syncAll();
  }

  @override
  Widget build(BuildContext context) {
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
