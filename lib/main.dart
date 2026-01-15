import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/app/app.dart';
import 'package:nims_mobile_app/core/services/location/geo_location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Initialize location service with 2-minute update interval
  await GeoLocationService().initialize();

  runApp(const ProviderScope(child: MyApp()));
}
