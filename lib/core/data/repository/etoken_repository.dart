import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/services/remote/models/etoken_response.dart';
import 'package:nims_mobile_app/core/utils/result.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class ETokenRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  ETokenRepository(this._apiService, this._localService);

  Future<Result<List<DomainETokenData>>> generateETokens(int amount) async {
    try {
      final result = await _apiService.generateETokens(amount);
      developer.log(
        "result: $result",
        name: "ETokenRepository:generateETokens",
      );
      switch (result) {
        case Success<ETokenResponse>(payload: final data):
          developer.log(
            "data: $data",
            name: "ETokenRepository:generateETokens",
          );
          final eTokenDataList = result.payload.data;
          if (eTokenDataList == null || eTokenDataList.isEmpty) {
            return Error("No sample type available");
          }
          final domainETokenDataList = eTokenDataList
              .map((sampleType) => sampleType.toDomain())
              .toList();
          await _localService.cacheETokenData(domainETokenDataList);
          return Success(domainETokenDataList);
        case Error<ETokenResponse>():
          developer.log(
            "error: ${result.message}",
            name: "ETokenRepository:generateETokens",
          );
          return Error(result.message);
      }
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "ETokenRepository:generateETokens",
      );
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<int> getETokenBalance() => _localService.countETokenData();
}
