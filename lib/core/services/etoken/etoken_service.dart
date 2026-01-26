import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/data/repository/etoken_repository.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/local/nims_local_service.dart';
import 'package:nims_mobile_app/core/services/network/connectivity_service.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

/// Exception thrown when no etokens are available and cannot be downloaded
class NoETokensAvailableException implements Exception {
  final String message;
  final bool networkUnavailable;

  NoETokensAvailableException(this.message, {this.networkUnavailable = false});

  @override
  String toString() => message;
}

/// Service for managing etoken retrieval with automatic download capability.
///
/// When etokens are unavailable locally, this service will:
/// 1. Check network connectivity
/// 2. If connected, automatically download more etokens
/// 3. Return the etoken for use
/// 4. If offline or download fails, throw [NoETokensAvailableException]
class ETokenService {
  final NIMSLocalService _localService;
  final ETokenRepository _eTokenRepository;
  final ConnectivityService _connectivityService;

  /// Default number of etokens to download when running low
  static const int _defaultDownloadAmount = 20;

  /// Minimum threshold to trigger auto-download
  static const int _lowBalanceThreshold = 5;

  ETokenService(
    this._localService,
    this._eTokenRepository,
    this._connectivityService,
  );

  /// Get the next available etoken, automatically downloading more if needed.
  ///
  /// [requiredCount] - Number of etokens needed for the operation (default: 1)
  /// [onDownloadStarted] - Callback when download starts (for UI loading state)
  /// [onDownloadComplete] - Callback when download completes
  ///
  /// Throws [NoETokensAvailableException] if etokens cannot be obtained.
  Future<DomainETokenData> getNextEToken({
    int requiredCount = 1,
    Function()? onDownloadStarted,
    Function()? onDownloadComplete,
  }) async {
    developer.log(
      "Getting next etoken (required: $requiredCount)",
      name: "ETokenService:getNextEToken",
    );

    // First, try to get an etoken from local storage
    var etoken = await _localService.getNextEToken();

    if (etoken != null) {
      // Check if we should proactively download more (low balance)
      _checkAndDownloadInBackground();
      return etoken;
    }

    // No local etokens available, try to download
    developer.log(
      "No local etokens, attempting to download",
      name: "ETokenService:getNextEToken",
    );

    // Check network connectivity
    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      developer.log(
        "No network connection available",
        name: "ETokenService:getNextEToken",
      );
      throw NoETokensAvailableException(
        "No eTokens available and no network connection. Please connect to the internet and try again.",
        networkUnavailable: true,
      );
    }

    // Network available, download etokens
    onDownloadStarted?.call();

    try {
      final downloadResult = await _downloadETokens(_defaultDownloadAmount);

      onDownloadComplete?.call();

      if (downloadResult) {
        // Try to get etoken again after download
        etoken = await _localService.getNextEToken();
        if (etoken != null) {
          return etoken;
        }
      }

      // Download failed or returned empty
      throw NoETokensAvailableException(
        "Failed to download eTokens. Please try again later.",
      );
    } catch (e) {
      onDownloadComplete?.call();

      if (e is NoETokensAvailableException) {
        rethrow;
      }

      developer.log(
        "Error downloading etokens: $e",
        name: "ETokenService:getNextEToken",
      );
      throw NoETokensAvailableException(
        "Failed to download eTokens: ${e.toString()}",
      );
    }
  }

  /// Get multiple etokens at once, downloading more if needed.
  ///
  /// Returns a list of etokens. Throws [NoETokensAvailableException] if
  /// the required number cannot be obtained.
  Future<List<DomainETokenData>> getMultipleETokens({
    required int count,
    Function()? onDownloadStarted,
    Function()? onDownloadComplete,
  }) async {
    developer.log(
      "Getting $count etokens",
      name: "ETokenService:getMultipleETokens",
    );

    final etokens = <DomainETokenData>[];

    for (int i = 0; i < count; i++) {
      final etoken = await getNextEToken(
        requiredCount: count - i,
        onDownloadStarted: i == 0 ? onDownloadStarted : null,
        onDownloadComplete: i == count - 1 ? onDownloadComplete : null,
      );
      etokens.add(etoken);
    }

    return etokens;
  }

  /// Check current etoken balance
  Future<int> getBalance() async {
    return await _eTokenRepository.getETokenBalance();
  }

  /// Delete a used etoken
  Future<void> deleteEToken(String etokenId) async {
    await _localService.deleteEToken(etokenId);
  }

  /// Delete multiple used etokens
  Future<void> deleteETokens(List<String> etokenIds) async {
    await _localService.deleteETokens(etokenIds);
  }

  /// Download etokens from the server
  Future<bool> _downloadETokens(int amount) async {
    developer.log(
      "Downloading $amount etokens",
      name: "ETokenService:_downloadETokens",
    );

    final result = await _eTokenRepository.generateETokens(amount);

    switch (result) {
      case Success<List<DomainETokenData>>():
        developer.log(
          "Successfully downloaded ${result.payload.length} etokens",
          name: "ETokenService:_downloadETokens",
        );
        return result.payload.isNotEmpty;
      case Error<List<DomainETokenData>>():
        developer.log(
          "Failed to download etokens: ${result.message}",
          name: "ETokenService:_downloadETokens",
        );
        return false;
    }
  }

  /// Check balance and download more in background if low
  void _checkAndDownloadInBackground() async {
    try {
      final balance = await getBalance();
      if (balance < _lowBalanceThreshold) {
        final isConnected = await _connectivityService.isConnected;
        if (isConnected) {
          developer.log(
            "Low etoken balance ($balance), downloading more in background",
            name: "ETokenService:_checkAndDownloadInBackground",
          );
          // Don't await - run in background
          _downloadETokens(_defaultDownloadAmount);
        }
      }
    } catch (e) {
      // Ignore errors in background download
      developer.log(
        "Background etoken download check failed: $e",
        name: "ETokenService:_checkAndDownloadInBackground",
      );
    }
  }
}
