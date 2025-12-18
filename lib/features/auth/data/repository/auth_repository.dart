import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/response_to_domain_mapper.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/utils/result.dart';
import 'package:projects/core/services/remote/models/login_response.dart';

import '../../../../core/services/remote/nims_api_service.dart';
import '../../../../core/services/local/nims_local_service.dart';

class AuthRepository {
  final NIMSAPIService _apiService;
  final NIMSLocalService _localService;

  AuthRepository(this._apiService, this._localService);

  Future<Result<LoginResponse>> login(String loginId, String password) async {
    try {
      final result = await _apiService.login(
        loginId: loginId,
        password: password,
        deviceId: "AB00012",
        deviceType: "mobile",
        deviceName: "iPhone 12",
      );
      developer.log("result: $result", name: "AuthRepository:login");
      switch (result) {
        case Success<LoginResponse>(payload: final response):
          developer.log(
            "response: $response",
            name: "AuthRepository:login:switch",
          );
          final user = response.data?.userData?.user;
          if (user != null) {
            await _localService.cacheUser(user.toDomain(response.data?.deviceSerialNo ?? ""));

            final platforms = user.platform;
            if (platforms != null && platforms.isNotEmpty == true) {
              await _localService.cachePlatforms(platforms.map((platform) => platform.toDomain(user.userId ?? "")).toList());
            }

            final systemPrivileges = user.systemPrivilege;
            if (systemPrivileges != null && systemPrivileges.isNotEmpty == true) {
              final systemPrivilegeIds = await _localService.cacheSystemPrivileges(systemPrivileges.map((systemPrivilege) => systemPrivilege.toDomain(user.userId ?? "")).toList());
              final privileges = systemPrivileges.indexed.map((indexedSystemPrivilege) => indexedSystemPrivilege.$2.privileges.toDomain(systemPrivilegeIds[indexedSystemPrivilege.$1])).toList();
              await _localService.cachePrivileges(privileges);
            }
            final lsps = user.lsp;
            if (lsps != null && lsps.isNotEmpty == true) {
              await _localService.cacheLsps(lsps.map((lsp) => lsp.toDomain(user.userId ?? "")).toList());
            }
          }
        case Error<LoginResponse>():
          developer.log("error", name: "AuthRepository:login:switch");
      }
      return result;
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "AuthRepository:login",
      );
      return Error<LoginResponse>(
        e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  Future<DomainUser?> getUser() async {
    try {
      return await _localService.getCachedUser();
    } catch (e, s) {
      developer.log(
        e.toString(),
        error: e,
        stackTrace: s,
        name: "AuthRepository:getUser",
      );
      return null;
    }
  }
}
