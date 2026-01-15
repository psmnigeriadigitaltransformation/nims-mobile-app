import 'dart:async';
import 'dart:developer' as developer;

import 'package:geolocator/geolocator.dart';

class CachedLocation {
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  CachedLocation({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  @override
  String toString() =>
      'CachedLocation(lat: $latitude, lng: $longitude, timestamp: $timestamp)';
}

class GeoLocationService {
  static final GeoLocationService _instance = GeoLocationService._internal();
  factory GeoLocationService() => _instance;
  GeoLocationService._internal();

  CachedLocation? _cachedLocation;
  Timer? _updateTimer;
  bool _isInitialized = false;

  /// Duration between location updates (2 minutes)
  static const Duration _updateInterval = Duration(minutes: 2);

  /// Get the cached location
  CachedLocation? get cachedLocation => _cachedLocation;

  /// Get latitude (returns 0.0 if no cached location)
  double get latitude => _cachedLocation?.latitude ?? 0.0;

  /// Get longitude (returns 0.0 if no cached location)
  double get longitude => _cachedLocation?.longitude ?? 0.0;

  /// Check if location is available
  bool get hasLocation => _cachedLocation != null;

  /// Initialize the service and start periodic updates
  Future<void> initialize() async {
    if (_isInitialized) {
      developer.log(
        "GeoLocationService already initialized",
        name: "GeoLocationService:initialize",
      );
      return;
    }

    developer.log(
      "Initializing GeoLocationService",
      name: "GeoLocationService:initialize",
    );

    // Check and request permissions
    final hasPermission = await _checkAndRequestPermission();
    if (!hasPermission) {
      developer.log(
        "Location permission denied",
        name: "GeoLocationService:initialize",
      );
      return;
    }

    // Get initial location
    await _updateLocation();

    // Start periodic updates every 2 minutes
    _updateTimer = Timer.periodic(_updateInterval, (_) => _updateLocation());

    _isInitialized = true;
    developer.log(
      "GeoLocationService initialized successfully",
      name: "GeoLocationService:initialize",
    );
  }

  /// Check and request location permission
  Future<bool> _checkAndRequestPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      developer.log(
        "Location services are disabled",
        name: "GeoLocationService:_checkAndRequestPermission",
      );
      return false;
    }

    // Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        developer.log(
          "Location permission denied",
          name: "GeoLocationService:_checkAndRequestPermission",
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      developer.log(
        "Location permission permanently denied",
        name: "GeoLocationService:_checkAndRequestPermission",
      );
      return false;
    }

    return true;
  }

  /// Update the cached location
  Future<void> _updateLocation() async {
    try {
      developer.log(
        "Updating cached location...",
        name: "GeoLocationService:_updateLocation",
      );

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );

      _cachedLocation = CachedLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: DateTime.now(),
      );

      developer.log(
        "Location updated: $_cachedLocation",
        name: "GeoLocationService:_updateLocation",
      );
    } catch (e, s) {
      developer.log(
        "Failed to update location: $e",
        error: e,
        stackTrace: s,
        name: "GeoLocationService:_updateLocation",
      );
    }
  }

  /// Force an immediate location update
  Future<void> forceUpdate() async {
    await _updateLocation();
  }

  /// Dispose the service and stop periodic updates
  void dispose() {
    _updateTimer?.cancel();
    _updateTimer = null;
    _isInitialized = false;
    developer.log(
      "GeoLocationService disposed",
      name: "GeoLocationService:dispose",
    );
  }
}
