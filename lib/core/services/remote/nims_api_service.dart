import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:nims_mobile_app/core/network/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:nims_mobile_app/core/services/remote/models/results_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/create_specimen_shipment_route_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/delete_manifest_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/delete_sample_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/etoken_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/locations_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/login_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/movement_types_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/reject_sample_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/rejection_reasons_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/create_specimen_shipment_route_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/delete_manifest_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/delete_sample_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/reject_sample_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/result_delivery_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/create_result_shipment_route_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/specimen_delivery_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/update_manifest_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/request/update_sample_request_body.dart';
import 'package:nims_mobile_app/core/services/remote/models/result_delivery_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/result_pickup_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/sample_types_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/specimen_delivery_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/update_manifest_response.dart';
import 'package:nims_mobile_app/core/services/remote/models/update_sample_response.dart';

import '../../../../../core/utils/result.dart';
import '../local/shared_preferences_helper.dart';
import 'models/create_manifest_response.dart';
import 'models/facilities_response.dart';
import 'models/manifest_samples_response.dart';
import 'models/request/create_manifest_request_body.dart';

class NIMSAPIService {
  /// Save data to a JSON file in the app's documents directory for debugging
  Future<void> _saveToJsonFile(String filename, dynamic data) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final file = File('${directory.path}/${filename}_$timestamp.json');
      final jsonString = const JsonEncoder.withIndent('  ').convert(data);
      await file.writeAsString(jsonString);
      developer.log(
        "Data saved to: ${file.path}",
        name: "NIMSAPIService:_saveToJsonFile",
      );
    } catch (e, s) {
      developer.log(
        "Failed to save JSON file: $e",
        name: "NIMSAPIService:_saveToJsonFile",
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<Result<LoginResponse>> login({
    required String loginId,
    required String password,
    required String deviceId,
    required String deviceType,
    required String deviceName,
  }) async {
    try {

      final data = {
        "loginId": loginId,
        "password": password,
        "deviceId": deviceId,
        "deviceType": deviceType,
        "deviceName": deviceName,
      };
      await _saveToJsonFile("login", data);

      final response = await dio.post(
        "auth/login",
        data: data,
      );
      developer.log(
        "api login response: $response",
        name: "NIMSAPIService:login",
      );
      if (response.statusCode != 200) throw response;
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
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
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
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<SampleTypesResponse>> getSampleTypes() async {
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
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
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
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<MovementTypesResponse>> getMovementTypes() async {
    try {
      final response = await dio.get("movements/lists/types");
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
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<ETokenResponse>> generateETokens(int amount) async {
    try {
      final response = await dio.get(
        "generate/etokens",
        queryParameters: {"length": amount},
      );
      developer.log(
        "api generate e-tokens response: $response",
        name: "NIMSAPIService:getSampleTypes",
      );
      final decodedResponse = ETokenResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:generateETokens");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<CreateManifestResponse>> createManifests({
    required List<ManifestRequestItem> manifests,
  }) async {
    try {
      final data = manifests.map((manifest) => manifest.toJson()).toList();
      await _saveToJsonFile("createManifests", data);

      final response = await dio.post(
        "manifests/create",
        data: data,
      );
      developer.log(
        "api create manifest response: $response",
        name: "NIMSAPIService:createManifests",
      );
      final decodedResponse = CreateManifestResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(CreateManifestResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:createManifests");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<UpdateManifestResponse>> updateManifest({
    required UpdateManifestRequest manifest,
  }) async {
    try {
      final data = manifest.toJson();
      await _saveToJsonFile("updateManifest", data);

      final response = await dio.post(
        "manifests/update",
        data: data,
      );
      developer.log(
        "api update manifests response: $response",
        name: "NIMSAPIService:updateManifest",
      );
      final decodedResponse = UpdateManifestResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(UpdateManifestResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:updateManifest");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<DeleteManifestResponse>> deleteManifest({
    required DeleteManifestRequest manifest,
  }) async {
    try {
      final data = manifest.toJson();
      await _saveToJsonFile("deleteManifest", data);

      final response = await dio.post(
        "manifests/delete",
        data: data,
      );
      developer.log(
        "api delete manifests response: $response",
        name: "NIMSAPIService:updateManifest",
      );
      final decodedResponse = DeleteManifestResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(DeleteManifestResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:deleteManifest");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<UpdateSampleResponse>> updateSample({
    required UpdateSampleRequest sample,
  }) async {
    try {
      final data = sample.toJson();
      await _saveToJsonFile("updateSample", data);

      final response = await dio.post(
        "sample/update",
        data: data,
      );
      developer.log(
        "api update sample response: $response",
        name: "NIMSAPIService:updateManifest",
      );
      final decodedResponse = UpdateSampleResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(UpdateSampleResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:updateSample");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<DeleteSampleResponse>> deleteSample({
    required DeleteSampleRequest sample,
  }) async {
    try {
      final data = sample.toJson();
      await _saveToJsonFile("deleteSample", data);

      final response = await dio.post(
        "sample/delete",
        data: data,
      );
      developer.log(
        "api delete sample response: $response",
        name: "NIMSAPIService:deleteSample",
      );
      final decodedResponse = DeleteSampleResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(DeleteSampleResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:deleteSample");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<RejectSampleResponse>> rejectSample({
    required RejectSampleRequest sample,
  }) async {
    try {
      final data = sample.toJson();
      await _saveToJsonFile("rejectSample", data);

      final response = await dio.post(
        "sample/reject",
        data: data,
      );
      developer.log(
        "api reject sample response: $response",
        name: "NIMSAPIService:rejectSample",
      );
      final decodedResponse = RejectSampleResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(RejectSampleResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:rejectSample");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<CreateSpecimenShipmentRouteResponse>> createSpecimenShipmentRoute({
    required CreateSpecimenShipmentRouteRequest shipmentRoute,
  }) async {
    try {
      final data = [shipmentRoute.toJson()];
      await _saveToJsonFile("createShipmentRoute", data);

      final response = await dio.post(
        "shipment/sample/pickup",
        data: data,
      );

      developer.log(
        "api create shipment data: $data",
        name: "NIMSAPIService:createShipmentRoute",
      );

      developer.log(
        "api create specimen shipment route response: $response",
        name: "NIMSAPIService:createShipmentRoute",
      );
      final decodedResponse = CreateSpecimenShipmentRouteResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(CreateSpecimenShipmentRouteResponse.fromJson(response.data));
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:createShipmentRoute");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<SpecimenDeliveryResponse>> deliverSpecimenShipments({
    required List<SpecimenDeliveryRequest> deliveries,
  }) async {
    try {
      final data = deliveries.map((delivery) => delivery.toJson()).toList();
      await _saveToJsonFile("deliverSpecimenShipments", data);

      final response = await dio.post(
        "shipment/sample/deliver",
        data: data,
      );
      developer.log(
        "api deliver specimen shipments response: $response",
        name: "NIMSAPIService:deliverSpecimenShipments",
      );
      final decodedResponse = SpecimenDeliveryResponse.fromJson(response.data);
      if (decodedResponse.status?.toLowerCase() == "success") {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ?? "Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:deliverSpecimenShipments");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<ResultPickupResponse>> createResultShipmentRoute({
    required List<CreateResultShipmentRouteRequest> routes,
  }) async {
    try {
      final data = routes.map((pickup) => pickup.toJson()).toList();
      await _saveToJsonFile("createResultShipmentRoute", data);
      developer.log(
        "api createResultShipmentRoute data: $data",
        name: "NIMSAPIService:createResultShipmentRoute",
      );
      final response = await dio.post(
        "shipment/result/pickup",
        data: data,
      );
      developer.log(
        "api pickup results response: $response",
        name: "NIMSAPIService:createResultShipmentRoute",
      );
      final decodedResponse = ResultPickupResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:createResultShipmentRoute");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<ResultDeliveryResponse>> deliverResultShipments({
    required List<ResultDeliveryRequest> deliveries,
  }) async {
    try {
      final data = deliveries.map((delivery) => delivery.toJson()).toList();
      await _saveToJsonFile("deliverResults", data);

      final response = await dio.post(
        "shipment/result/deliver",
        data: data,
      );
      developer.log(
        "api deliver results response: $response",
        name: "NIMSAPIService:deliverResults",
      );
      final decodedResponse = ResultDeliveryResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:deliverResults");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<ResultsResponse>> getFacilityResults({
    required String facilityId,
  }) async {
    try {
      final response = await dio.get(
        "sample/result/pickup",
        queryParameters: {"facilityId": facilityId},
      );
      developer.log(
        "api get facility results response: $response",
        name: "NIMSAPIService:getFacilityResults",
      );
      final decodedResponse = ResultsResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:getFacilityResults");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }

  Future<Result<ManifestSamplesResponse>> getHubManifestsAndSamples({
    required String facilityId,
  }) async {
    try {
      final response = await dio.get(
        "manifests/sample",
        queryParameters: {"facilityId": facilityId},
      );
      developer.log(
        "api get manifest samples response: $response",
        name: "NIMSAPIService:getManifestSamples",
      );
      final decodedResponse = ManifestSamplesResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:getManifestSamples");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }


  Future<Result<RejectionReasonsResponse>> getRejectionReasons() async {
    try {
      final response = await dio.get("sample/rejection/lists");
      developer.log(
        "api get rejection reasons response: $response",
        name: "NIMSAPIService:getRejectionReasons",
      );
      final decodedResponse = RejectionReasonsResponse.fromJson(response.data);
      if (decodedResponse.resultCode == 200) {
        return Success(decodedResponse);
      } else {
        return Error(
          decodedResponse.message ??
              "${decodedResponse.resultCode}: Request failed! please try again",
        );
      }
    } catch (e, s) {
      developer.log("e: $e, s: $s", name: "NIMSAPIService:getRejectionReasons");
      return Error(e.toString(), exception: Exception(e.toString()), stackTrace: s);
    }
  }
}
