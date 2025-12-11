import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:projects/core/network/dio.dart';
import 'package:projects/core/services/remote/models/locations_response.dart';
import 'package:projects/core/services/remote/models/login_response.dart';
import 'package:projects/core/services/remote/models/movement_types_response.dart';
import 'package:projects/core/services/remote/models/sample_types_response.dart';

import '../../../../../core/utils/result.dart';
import '../local/shared_preferences_helper.dart';
import 'models/create_manifest_response.dart';
import 'models/facilities_response.dart';

class NIMSAPIService {
  Future<Result<LoginResponse>> login({
    required String loginId,
    required String password,
    required String deviceId,
    required String deviceType,
    required String deviceName,
  }) async {
    try {
      final response = await dio.post(
        "auth/login",
        data: {
          "loginId": loginId,
          "password": password,
          "deviceId": deviceId,
          "deviceType": deviceType,
          "deviceName": deviceName,
        },
      );
      developer.log(
        "api login response: $response",
        name: "NIMSAPIService:login",
      );
      final decodedResponse = LoginResponse.fromJson(response.data);

      await SharedPreferencesHelper.saveToken(decodedResponse.data?.jwt ?? "");
      if (decodedResponse.resultCode == 200) {
        return Success(LoginResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:login");
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<FacilitiesResponse>> getFacilities({
    required String riderId,
  }) async {
    try {
      final response = await dio.get(
        "facilities",
        queryParameters: {"riderId": riderId},
      );
      developer.log(
        "api facilities response: $response",
        name: "NIMSAPIService:facilities",
      );
      final decodedResponse = FacilitiesResponse.fromJson(response.data);

      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:facilities");
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<SampleTypesResponse>> getSampleTypes({
    required String riderId,
  }) async {
    try {
      final response = await dio.get("samples/types");
      developer.log(
        "api get sample types response: $response",
        name: "NIMSAPIService:getSampleTypes",
      );
      final decodedResponse = SampleTypesResponse.fromJson(response.data);

      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:getSampleTypes");
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<LocationResponse>> getLocations() async {
    try {
      final response = await dio.get("locations/lists");
      developer.log(
        "api get locations response: $response",
        name: "NIMSAPIService:getLocations",
      );
      final decodedResponse = LocationResponse.fromJson(response.data);

      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:getLocations");
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<MovementTypesResponse>> getMovementTypes() async {
    try {
      final response = await dio.get("movements/types/lists");
      developer.log(
        "api get movement types response: $response",
        name: "NIMSAPIService:getMovementTypes",
      );
      final decodedResponse = MovementTypesResponse.fromJson(response.data);

      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:getMovementTypes");
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }

  Future<Result<ManifestSaveResponse>> createManifest({
    required String riderId,
  }) async {
    try {
      final response = await dio.get(
        "create/manifests",
        queryParameters: {"riderId": riderId},
      );
      developer.log(
        "api create manifest response: $response",
        name: "NIMSAPIService:createManifest",
      );
      final decodedResponse = ManifestSaveResponse.fromJson(response.data);

      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:createManifest");
      return Error(e.toString(), exception: e as Exception, stackTrace: s);
    }
  }
}
