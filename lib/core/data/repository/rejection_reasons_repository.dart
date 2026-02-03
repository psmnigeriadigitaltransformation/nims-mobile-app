import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/rejection_reasons_response.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

import '../../../core/services/remote/nims_api_service.dart';
import '../../../core/services/local/nims_local_service.dart';

class RejectionReasonsRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  RejectionReasonsRepository(
    this._apiService,
    this._localService,
  );

  /// Get rejection reasons - uses cache if available, fetches from server otherwise
  Future<Result<List<DomainRejectionReason>>> getRejectionReasons(bool refresh) async {
    try {
      final cachedReasons = await _localService.getCachedRejectionReasons();
      if (cachedReasons.isNotEmpty && !refresh) {
        return Success(cachedReasons);
      } else {
        final result = await _apiService.getRejectionReasons();
        developer.log(
          "result: $result",
          name: "RejectionReasonsRepository:getRejectionReasons",
        );
        switch (result) {
          case Success<RejectionReasonsResponse>(payload: final data):
            developer.log(
              "data: $data",
              name: "RejectionReasonsRepository:getRejectionReasons",
            );
            final reasons = data.data;
            if (reasons == null || reasons.isEmpty) {
              // Return cached reasons if API returns empty
              if (cachedReasons.isNotEmpty) {
                return Success(cachedReasons);
              }
              return Error("No rejection reasons available");
            }
            final domainReasons = reasons
                .map((reason) => reason.toDomain())
                .toList();
            await _localService.cacheRejectionReasons(domainReasons);
            return Success(domainReasons);
          case Error<RejectionReasonsResponse>():
            developer.log(
              "error: ${result.message}",
              name: "RejectionReasonsRepository:getRejectionReasons",
            );
            // Return cached reasons on error if available
            if (cachedReasons.isNotEmpty) {
              return Success(cachedReasons);
            }
            return Error(result.message);
        }
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "RejectionReasonsRepository:getRejectionReasons",
      );
      // Try to return cached reasons on exception
      final cachedReasons = await _localService.getCachedRejectionReasons();
      if (cachedReasons.isNotEmpty) {
        return Success(cachedReasons);
      }
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  /// Get rejection reasons as a list of strings (for UI dropdowns)
  Future<List<String>> getRejectionReasonStrings() async {
    final result = await getRejectionReasons(false);
    switch (result) {
      case Success<List<DomainRejectionReason>>(payload: final reasons):
        return reasons.map((r) => r.reason).toList();
      case Error<List<DomainRejectionReason>>():
        return [];
    }
  }
}
