import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Service for monitoring network connectivity status.
/// Provides real-time connectivity updates and methods to check connection state.
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  final _connectivityController = StreamController<bool>.broadcast();

  bool _isConnected = false;

  /// Stream of connectivity changes (true = connected, false = disconnected)
  Stream<bool> get connectivityStream => _connectivityController.stream;

  /// Current connectivity status
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return _hasConnection(result);
  }

  /// Synchronous access to last known connectivity status
  bool get isConnectedSync => _isConnected;

  /// Start monitoring connectivity changes
  void startMonitoring() {
    // Check initial status
    _connectivity.checkConnectivity().then((result) {
      _isConnected = _hasConnection(result);
      _connectivityController.add(_isConnected);
    });

    // Listen for changes
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      final connected = _hasConnection(result);
      if (connected != _isConnected) {
        _isConnected = connected;
        _connectivityController.add(_isConnected);
      }
    });
  }

  /// Stop monitoring connectivity changes
  void stopMonitoring() {
    _subscription?.cancel();
    _subscription = null;
  }

  /// Dispose resources
  void dispose() {
    stopMonitoring();
    _connectivityController.close();
  }

  /// Check if any connectivity result indicates a connection
  bool _hasConnection(List<ConnectivityResult> results) {
    return results.any((result) =>
      result == ConnectivityResult.wifi ||
      result == ConnectivityResult.mobile ||
      result == ConnectivityResult.ethernet
    );
  }
}
