import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class NIMSLocalService {
  Future<DomainUser?> getCachedUser() async {
    final db = await NIMSDatabase().instance;
    final result = await db.query('users');
    if (result.isNotEmpty) {
      return DomainUser.fromJson(result.first);
    }
    return null;
  }

  Future<void> cacheUser(DomainUser user) async {
    developer.log("user: $user", name: "NIMSLocalService:cacheUser");
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      txn.delete('users');
      txn.insert(
        'users',
        user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<void> clearCachedUser() async {
    developer.log("clearCachedUser", name: "NIMSLocalService:clearCachedUser");
    final db = await NIMSDatabase().instance;
    await db.delete('users');
  }

  Future<void> cachePlatforms(List<DomainPlatform> platforms) async {
    developer.log(
      "platforms: $platforms",
      name: "NIMSLocalService:cacheUserPlatforms",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("platforms");
      for (final platform in platforms) {
        batch.insert(
          "platforms",
          platform.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }

  Future<List<int>> cacheSystemPrivileges(
    List<DomainSystemPrivilege> systemPrivileges,
  ) async {
    developer.log(
      "systemPrivileges: $systemPrivileges",
      name: "NIMSLocalService:cacheSystemPrivileges",
    );
    final db = await NIMSDatabase().instance;
    late List<int> spIds;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("system_privileges");
      for (final systemPrivilege in systemPrivileges) {
        batch.insert(
          "system_privileges",
          systemPrivilege.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      final results = await batch.commit();
      final systemPrivilegeIds =
          (results.isNotEmpty
                  ? results.getRange(1, results.length).toList()
                  : [1])
              .cast<int>();
      developer.log(
        "results: $systemPrivilegeIds",
        name: "NIMSLocalService:cacheSystemPrivileges",
      );
      spIds = systemPrivilegeIds;
    });
    return spIds;
  }

  Future<void> cachePrivileges(List<DomainPrivilege> privileges) async {
    developer.log(
      "privileges: $privileges",
      name: "NIMSLocalService:cachePrivileges",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("privileges");
      for (final privilege in privileges) {
        batch.insert(
          "privileges",
          privilege.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }

  Future<void> cacheLsps(List<DomainLsp> lsps) async {
    developer.log("lsps: $lsps", name: "NIMSLocalService:cachePrivileges");
    final db = await NIMSDatabase().instance;
    db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("lsps");
      for (final lsp in lsps) {
        batch.insert(
          "lsps",
          lsp.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }

  Future<void> cacheFacilities(List<DomainFacility> facilities) async {
    developer.log(
      "facilities: $facilities",
      name: "NIMSLocalService:cacheFacilities",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("facilities");
      for (final facility in facilities) {
        batch.insert(
          "facilities",
          facility.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }

  Future<List<DomainFacility>> getCachedFacilities() async {
    final db = await NIMSDatabase().instance;
    final result = await db.query('facilities');
    developer.log(
      "facilities: $result",
      name: "NIMSLocalService:getCachedFacilities",
    );
    return result.map((facility) => DomainFacility.fromJson(facility)).toList();
  }

  Future<List<DomainFacility>> getCachedFacilitiesBySearchQuery(
    String query,
  ) async {
    developer.log(
      "query: $query",
      name: "NIMSLocalService:getCachedFacilitiesBySearchQuery",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "facilities",
      where:
          "facility_name LIKE ? OR facility_code LIKE ? OR lab_code LIKE ? OR type LIKE ?",
      whereArgs: ["%$query%", "%$query%", "%$query%", "%$query%"],
    );
    developer.log(
      "facilities: $result",
      name: "NIMSLocalService:getCachedFacilitiesBySearchQuery",
    );
    final facilities = result.map((f) => DomainFacility.fromJson(f)).toList();
    // Deduplicate by facilityId
    final seenIds = <int>{};
    return facilities.where((f) {
      final id = f.facilityId;
      if (id == null || seenIds.contains(id)) return false;
      seenIds.add(id);
      return true;
    }).toList();
  }

  Future<void> cacheSampleTypes(List<DomainSampleType> sampleTypes) async {
    developer.log(
      "sample_types: $sampleTypes",
      name: "NIMSLocalService:cacheSampleTypes",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("sample_types");

      for (final sampleType in sampleTypes) {
        batch.insert(
          "sample_types",
          sampleType.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }

  Future<List<DomainSampleType>> getCachedSampleTypes() async {
    final db = await NIMSDatabase().instance;
    final result = await db.query('sample_types');
    developer.log(
      "sample_types: $result",
      name: "NIMSLocalService:getCachedSampleTypes",
    );
    return result
        .map((sampleType) => DomainSampleType.fromJson(sampleType))
        .toList();
  }

  Future<void> cacheLocations(List<DomainLocation> locations) async {
    developer.log(
      "locations: $locations",
      name: "NIMSLocalService:cacheLocations",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("locations");

      for (final location in locations) {
        batch.insert(
          "locations",
          location.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }

  Future<List<DomainLocation>> getCachedLocations() async {
    final db = await NIMSDatabase().instance;
    final result = await db.query('locations');
    developer.log(
      "locations: $result",
      name: "NIMSLocalService:getCachedLocations",
    );
    return result.map((location) => DomainLocation.fromJson(location)).toList();
  }

  Future<void> cacheMovementTypes(
    List<DomainMovementType> movementTypes,
  ) async {
    developer.log(
      "movement types: $movementTypes",
      name: "NIMSLocalService:cacheMovementTypes",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete("movement_types");

      for (final movementType in movementTypes) {
        batch.insert(
          "movement_types",
          movementType.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }

  Future<List<DomainMovementType>> getCachedMovementTypes() async {
    final db = await NIMSDatabase().instance;
    final result = await db.query('movement_types');
    developer.log(
      "movement_types: $result",
      name: "NIMSLocalService:getCachedMovementTypes",
    );
    return result
        .map((location) => DomainMovementType.fromJson(location))
        .toList();
  }

  Future<void> cacheETokenData(List<DomainETokenData> eTokenDataList) async {
    developer.log(
      "etoken data list: $eTokenDataList",
      name: "NIMSLocalService:cacheETokenData",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    for (final eTokenData in eTokenDataList) {
      batch.insert(
        "etoken_data",
        eTokenData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true, continueOnError: true);
  }

  Future<int> countETokenData() async {
    developer.log(
      "count eToken data called",
      name: "NIMSLocalService:countETokenData",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM etoken_data',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<void> cacheManifest(
    DomainManifest manifest,
    List<DomainSample> samples,
  ) async {
    developer.log(
      "manifest: $manifest",
      name: "NIMSLocalService:cacheManifest",
    );
    developer.log("samples: $samples", name: "NIMSLocalService:cacheManifest");
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.insert("manifests", manifest.toJson());
      for (final sample in samples) {
        batch.insert("samples", sample.toJson());
      }
      await batch.commit(noResult: true);
    });
  }

  Future<void> deleteManifest(String manifestNo) async {
    developer.log(
      "manifestNo: $manifestNo",
      name: "NIMSLocalService:deleteManifest",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      // Delete samples linked to the manifest first
      await txn.delete(
        "samples",
        where: "manifest_no = ?",
        whereArgs: [manifestNo],
      );
      // Delete the manifest
      await txn.delete(
        "manifests",
        where: "manifest_no = ?",
        whereArgs: [manifestNo],
      );
    });
  }

  Future<List<DomainManifest>> getCacheManifestsByOriginId(
    String originId,
  ) async {
    developer.log(
      "originId: $originId",
      name: "NIMSLocalService:getCacheManifestsByOriginId",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "manifests",
      where: "origin_id = ?",
      whereArgs: [originId],
      orderBy: "created_at DESC",
    );
    developer.log(
      "manifestsCC: $result",
      name: "NIMSLocalService:getCacheManifestsByOriginId",
    );
    return result.map((manifest) => DomainManifest.fromJson(manifest)).toList();
  }

  /// Returns a map of manifest_no to shipment_status for all manifests that are in shipments
  Future<Map<String, String>> getShippedManifestStatuses() async {
    developer.log(
      "Getting shipped manifest statuses",
      name: "NIMSLocalService:getShippedManifestStatuses",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "shipments",
      columns: ["manifest_no", "shipment_status"],
    );
    developer.log(
      "shippedManifests: $result",
      name: "NIMSLocalService:getShippedManifestStatuses",
    );
    final Map<String, String> statusMap = {};
    for (final row in result) {
      statusMap[row['manifest_no'] as String] = row['shipment_status'] as String;
    }
    return statusMap;
  }

  Future<void> cacheShipmentRoute(
    DomainShipmentRoute route,
    List<DomainShipment> shipments,
    DomainApproval approval,
  ) async {
    developer.log(
      "shipment route: $route",
      name: "NIMSLocalService:cacheShipmentRoute",
    );
    developer.log(
      "shipments: $shipments",
      name: "NIMSLocalService:cacheShipmentRoute",
    );
    developer.log(
      "approval: $approval",
      name: "NIMSLocalService:cacheShipmentRoute",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.insert("routes", route.toJson());
      for (final shipment in shipments) {
        batch.insert("shipments", shipment.toJson());
      }
      batch.insert("approvals", approval.toJson());
      await batch.commit(noResult: true);
    });
  }

  Future<List<DomainManifest>> getCachedManifestsBySearchQuery(
    String query,
  ) async {
    developer.log(
      "query: $query",
      name: "NIMSLocalService:getCachedManifestsBySearchQuery",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "manifests",
      where:
          "manifest_no LIKE ? OR sample_type LIKE ? OR originating_facility_name LIKE ? OR phlebotomy_no LIKE ?",
      whereArgs: ["%$query%", "%$query%", "%$query%", "%$query%"],
      orderBy: "created_at DESC",
    );
    developer.log(
      "manifestsCC: $result",
      name: "NIMSLocalService:getCachedManifestsBySearchQuery",
    );
    return result.map((manifest) => DomainManifest.fromJson(manifest)).toList();
  }

  Future<List<DomainShipment>> getCachedShipmentsBySearchQuery(
    String query,
  ) async {
    developer.log(
      "query: $query",
      name: "NIMSLocalService:getCachedShipmentsBySearchQuery",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "shipments",
      where:
          "shipment_no LIKE ? OR route_no LIKE ? OR manifest_no LIKE ? OR destination_location_type LIKE ? OR destination_facility_name LIKE ? OR sample_type LIKE ?",
      whereArgs: [
        "%$query%",
        "%$query%",
        "%$query%",
        "%$query%",
        "%$query%",
        "%$query%",
      ],
      orderBy: "pickup_date DESC",
    );
    developer.log(
      "shipments: $result",
      name: "NIMSLocalService:getCachedShipmentsBySearchQuery",
    );
    return result.map((shipment) => DomainShipment.fromJson(shipment)).toList();
  }

  Future<List<ShipmentRoute>> getCachedShipmentRoutesBySearchQuery(
    String query,
  ) async {
    developer.log(
      "query: $query",
      name: "NIMSLocalService:getCachedShipmentRoutesBySearchQuery",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "routes",
      where: """
        (route_no
         || origin_facility_name
         || destination_facility_name) LIKE ?
      """,
      whereArgs: ["%$query%"],
      orderBy: "created_at DESC",
    );
    developer.log(
      "manifestsCC: $result",
      name: "NIMSLocalService:getCachedShipmentRoutesBySearchQuery",
    );
    return result.map((route) => DomainShipmentRoute.fromJson(route)).toList();
  }

  Future<List<DomainSample>> getCachedSamplesByManifestNo(
    String manifestNo,
  ) async {
    developer.log(
      "manifestNo: $manifestNo",
      name: "NIMSLocalService:getCachedSamplesByManifestNo",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "samples",
      where: "manifest_no = ?",
      whereArgs: [manifestNo],
    );
    developer.log(
      "samples: $result",
      name: "NIMSLocalService:getCachedSamplesByManifestNo",
    );
    return result.map((sample) => DomainSample.fromJson(sample)).toList();
  }

  Future<DomainShipmentRoute?> getCachedRouteByRouteNo(String routeNo) async {
    developer.log(
      "routeNo: $routeNo",
      name: "NIMSLocalService:getCachedRouteByRouteNo",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "routes",
      where: "route_no = ?",
      whereArgs: [routeNo],
      limit: 1,
    );
    developer.log(
      "route: $result",
      name: "NIMSLocalService:getCachedRouteByRouteNo",
    );
    if (result.isNotEmpty) {
      return DomainShipmentRoute.fromJson(result.first);
    }
    return null;
  }

  Future<List<DomainApproval>> getCachedApprovalsByRouteNo(
    String routeNo,
  ) async {
    developer.log(
      "routeNo: $routeNo",
      name: "NIMSLocalService:getCachedApprovalsByRouteNo",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "approvals",
      where: "route_no = ?",
      whereArgs: [routeNo],
    );
    developer.log(
      "approvals: $result",
      name: "NIMSLocalService:getCachedApprovalsByRouteNo",
    );
    return result.map((approval) => DomainApproval.fromJson(approval)).toList();
  }

  /// Get cached pickup approvals by route number (approval_type = 'pickup')
  Future<List<DomainApproval>> getCachedPickupApprovalsByRouteNo(
    String routeNo,
  ) async {
    developer.log(
      "routeNo: $routeNo",
      name: "NIMSLocalService:getCachedPickupApprovalsByRouteNo",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "approvals",
      where: "route_no = ? AND approval_type = ?",
      whereArgs: [routeNo, 'pickup'],
    );
    developer.log(
      "pickup approvals: $result",
      name: "NIMSLocalService:getCachedPickupApprovalsByRouteNo",
    );
    return result.map((approval) => DomainApproval.fromJson(approval)).toList();
  }

  Future<List<DomainShipment>> getCachedShipmentsByRouteNo(
    String routeNo,
  ) async {
    developer.log(
      "routeNo: $routeNo",
      name: "NIMSLocalService:getCachedShipmentsByRouteNo",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "shipments",
      where: "route_no = ?",
      whereArgs: [routeNo],
    );
    developer.log(
      "shipments: $result",
      name: "NIMSLocalService:getCachedShipmentsByRouteNo",
    );
    return result.map((shipment) => DomainShipment.fromJson(shipment)).toList();
  }

  // ==================== SYNC-RELATED METHODS ====================

  /// Get all manifests with pending sync status
  Future<List<DomainManifest>> getPendingManifests() async {
    developer.log(
      "Getting pending manifests",
      name: "NIMSLocalService:getPendingManifests",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "manifests",
      where: "sync_status = ? OR sync_status = ?",
      whereArgs: ['pending', 'failed'],
      orderBy: "created_at ASC",
    );
    developer.log(
      "pending manifests: $result",
      name: "NIMSLocalService:getPendingManifests",
    );
    return result.map((m) => DomainManifest.fromJson(m)).toList();
  }

  /// Get all samples with pending sync status
  Future<List<DomainSample>> getPendingSamples() async {
    developer.log(
      "Getting pending samples",
      name: "NIMSLocalService:getPendingSamples",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "samples",
      where: "sync_status = ? OR sync_status = ?",
      whereArgs: ['pending', 'failed'],
    );
    return result.map((s) => DomainSample.fromJson(s)).toList();
  }

  /// Get all routes with pending sync status
  Future<List<DomainShipmentRoute>> getPendingRoutes() async {
    developer.log(
      "Getting pending routes",
      name: "NIMSLocalService:getPendingRoutes",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "routes",
      where: "sync_status = ? OR sync_status = ?",
      whereArgs: ['pending', 'failed'],
      orderBy: "created_at ASC",
    );
    developer.log(
      "pending routes: $result",
      name: "NIMSLocalService:getPendingRoutes",
    );
    return result.map((r) => DomainShipmentRoute.fromJson(r)).toList();
  }

  /// Get all shipments with pending sync status
  Future<List<DomainShipment>> getPendingShipments() async {
    developer.log(
      "Getting pending shipments",
      name: "NIMSLocalService:getPendingShipments",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "shipments",
      where: "sync_status = ? OR sync_status = ?",
      whereArgs: ['pending', 'failed'],
    );
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Get all approvals with pending sync status
  Future<List<DomainApproval>> getPendingApprovals() async {
    developer.log(
      "Getting pending approvals",
      name: "NIMSLocalService:getPendingApprovals",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "approvals",
      where: "sync_status = ? OR sync_status = ?",
      whereArgs: ['pending', 'failed'],
    );
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Update sync status for a record in any table
  Future<void> updateSyncStatus(
    String table,
    String idColumn,
    String idValue,
    String status,
  ) async {
    developer.log(
      "Updating sync status: $table.$idColumn=$idValue to $status",
      name: "NIMSLocalService:updateSyncStatus",
    );
    final db = await NIMSDatabase().instance;
    await db.update(
      table,
      {'sync_status': status},
      where: "$idColumn = ?",
      whereArgs: [idValue],
    );
  }

  /// Get a manifest by its manifest number
  Future<DomainManifest?> getManifestByNo(String manifestNo) async {
    developer.log(
      "manifestNo: $manifestNo",
      name: "NIMSLocalService:getManifestByNo",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "manifests",
      where: "manifest_no = ?",
      whereArgs: [manifestNo],
      limit: 1,
    );
    developer.log(
      "manifest: $result",
      name: "NIMSLocalService:getManifestByNo",
    );
    if (result.isNotEmpty) {
      return DomainManifest.fromJson(result.first);
    }
    return null;
  }

  /// Update a manifest locally
  Future<void> updateManifestLocally(DomainManifest manifest) async {
    developer.log(
      "Updating manifest: ${manifest.manifestNo}",
      name: "NIMSLocalService:updateManifestLocally",
    );
    final db = await NIMSDatabase().instance;
    final data = manifest.toJson();
    data.remove('id'); // Don't update the id
    await db.update(
      "manifests",
      data,
      where: "manifest_no = ?",
      whereArgs: [manifest.manifestNo],
    );
  }

  /// Delete a manifest locally (with its samples)
  Future<void> deleteManifestLocally(String manifestNo) async {
    developer.log(
      "Deleting manifest locally: $manifestNo",
      name: "NIMSLocalService:deleteManifestLocally",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      // Delete samples first (due to foreign key constraint)
      await txn.delete(
        "samples",
        where: "manifest_no = ?",
        whereArgs: [manifestNo],
      );
      // Delete the manifest
      await txn.delete(
        "manifests",
        where: "manifest_no = ?",
        whereArgs: [manifestNo],
      );
    });
  }

  /// Get a sample by its sample code
  Future<DomainSample?> getSampleByCode(String sampleCode) async {
    developer.log(
      "sampleCode: $sampleCode",
      name: "NIMSLocalService:getSampleByCode",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "samples",
      where: "sample_code = ?",
      whereArgs: [sampleCode],
      limit: 1,
    );
    developer.log(
      "sample: $result",
      name: "NIMSLocalService:getSampleByCode",
    );
    if (result.isNotEmpty) {
      return DomainSample.fromJson(result.first);
    }
    return null;
  }

  /// Update a sample locally
  Future<void> updateSampleLocally(DomainSample sample) async {
    developer.log(
      "Updating sample: ${sample.sampleCode}",
      name: "NIMSLocalService:updateSampleLocally",
    );
    final db = await NIMSDatabase().instance;
    final data = sample.toJson();
    data.remove('id'); // Don't update the id
    await db.update(
      "samples",
      data,
      where: "sample_code = ?",
      whereArgs: [sample.sampleCode],
    );
  }

  /// Delete a sample locally
  Future<void> deleteSampleLocally(String sampleCode) async {
    developer.log(
      "Deleting sample locally: $sampleCode",
      name: "NIMSLocalService:deleteSampleLocally",
    );
    final db = await NIMSDatabase().instance;
    await db.delete(
      "samples",
      where: "sample_code = ?",
      whereArgs: [sampleCode],
    );
  }

  /// Get all cached manifests
  Future<List<DomainManifest>> getAllCachedManifests() async {
    developer.log(
      "Getting all cached manifests",
      name: "NIMSLocalService:getAllCachedManifests",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "manifests",
      orderBy: "created_at DESC",
    );
    return result.map((m) => DomainManifest.fromJson(m)).toList();
  }

  /// Get all cached shipments
  Future<List<DomainShipment>> getAllCachedShipments() async {
    developer.log(
      "Getting all cached shipments",
      name: "NIMSLocalService:getAllCachedShipments",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "shipments",
      orderBy: "pickup_date DESC",
    );
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Get all cached routes
  Future<List<DomainShipmentRoute>> getAllCachedRoutes() async {
    developer.log(
      "Getting all cached routes",
      name: "NIMSLocalService:getAllCachedRoutes",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "routes",
      orderBy: "created_at DESC",
    );
    return result.map((r) => DomainShipmentRoute.fromJson(r)).toList();
  }

  /// Update manifest sample count after sample deletion
  Future<void> updateManifestSampleCount(String manifestNo, int newCount) async {
    developer.log(
      "Updating manifest $manifestNo sample count to $newCount",
      name: "NIMSLocalService:updateManifestSampleCount",
    );
    final db = await NIMSDatabase().instance;
    await db.update(
      "manifests",
      {'sample_count': newCount},
      where: "manifest_no = ?",
      whereArgs: [manifestNo],
    );
  }

  /// Update shipment status to delivered and save delivery approval
  Future<void> saveDeliveryApproval(
    List<String> shipmentNos,
    DomainApproval deliveryApproval,
  ) async {
    developer.log(
      "Saving delivery approval for shipments: $shipmentNos",
      name: "NIMSLocalService:saveDeliveryApproval",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      // Update shipment status to 'delivered' for each shipment
      for (final shipmentNo in shipmentNos) {
        await txn.update(
          "shipments",
          {'shipment_status': 'delivered'},
          where: "shipment_no = ?",
          whereArgs: [shipmentNo],
        );
      }
      // Save the delivery approval
      await txn.insert(
        "approvals",
        deliveryApproval.toJson(),
      );
    });
  }

  /// Get pending specimen delivery approvals (approvals with type='delivery' and pending/failed sync status)
  Future<List<DomainApproval>> getPendingSpecimenDeliveries() async {
    developer.log(
      "Getting pending specimen deliveries",
      name: "NIMSLocalService:getPendingSpecimenDeliveries",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "approvals",
      where: "approval_type = ? AND (sync_status = ? OR sync_status = ?)",
      whereArgs: ['delivery', 'pending', 'failed'],
      orderBy: "rowid ASC",
    );
    developer.log(
      "pending specimen deliveries: $result",
      name: "NIMSLocalService:getPendingSpecimenDeliveries",
    );
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Get shipments by route number that have been delivered
  Future<List<DomainShipment>> getDeliveredShipmentsByRouteNo(
    String routeNo,
  ) async {
    developer.log(
      "routeNo: $routeNo",
      name: "NIMSLocalService:getDeliveredShipmentsByRouteNo",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "shipments",
      where: "route_no = ? AND shipment_status = ?",
      whereArgs: [routeNo, 'delivered'],
    );
    developer.log(
      "delivered shipments: $result",
      name: "NIMSLocalService:getDeliveredShipmentsByRouteNo",
    );
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Cache result pickup (route, shipment, approval)
  Future<void> cacheResultPickup(
    DomainShipmentRoute route,
    DomainShipment shipment,
    DomainApproval approval,
  ) async {
    developer.log(
      "Caching result pickup: route=${route.routeNo}",
      name: "NIMSLocalService:cacheResultPickup",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.insert("routes", route.toJson());
      batch.insert("shipments", shipment.toJson());
      batch.insert("approvals", approval.toJson());
      await batch.commit(noResult: true);
    });
  }

  /// Get pending result pickup approvals
  Future<List<DomainApproval>> getPendingResultPickups() async {
    developer.log(
      "Getting pending result pickups",
      name: "NIMSLocalService:getPendingResultPickups",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "approvals",
      where: "approval_type = ? AND (sync_status = ? OR sync_status = ?)",
      whereArgs: ['result_pickup', 'pending', 'failed'],
      orderBy: "rowid ASC",
    );
    developer.log(
      "pending result pickups: $result",
      name: "NIMSLocalService:getPendingResultPickups",
    );
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Get pending result delivery approvals
  Future<List<DomainApproval>> getPendingResultDeliveries() async {
    developer.log(
      "Getting pending result deliveries",
      name: "NIMSLocalService:getPendingResultDeliveries",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query(
      "approvals",
      where: "approval_type = ? AND (sync_status = ? OR sync_status = ?)",
      whereArgs: ['result_delivery', 'pending', 'failed'],
      orderBy: "rowid ASC",
    );
    developer.log(
      "pending result deliveries: $result",
      name: "NIMSLocalService:getPendingResultDeliveries",
    );
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Save result delivery approval
  Future<void> saveResultDeliveryApproval(
    String routeNo,
    List<String> shipmentNos,
    DomainApproval approval,
  ) async {
    developer.log(
      "Saving result delivery approval for route: $routeNo, shipments: $shipmentNos",
      name: "NIMSLocalService:saveResultDeliveryApproval",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      // Update shipment status to 'delivered' for each shipment
      for (final shipmentNo in shipmentNos) {
        await txn.update(
          "shipments",
          {'shipment_status': 'delivered'},
          where: "shipment_no = ?",
          whereArgs: [shipmentNo],
        );
      }
      // Save the delivery approval
      await txn.insert(
        "approvals",
        approval.toJson(),
      );
    });
  }

  /// Get total count of pending records across all tables
  Future<int> getTotalPendingCount() async {
    developer.log(
      "Getting total pending count",
      name: "NIMSLocalService:getTotalPendingCount",
    );
    final db = await NIMSDatabase().instance;

    int totalCount = 0;

    // Count pending manifests
    final manifestsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM manifests WHERE sync_status = 'pending' OR sync_status = 'failed'",
    );
    totalCount += Sqflite.firstIntValue(manifestsResult) ?? 0;

    // Count pending routes
    final routesResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM routes WHERE sync_status = 'pending' OR sync_status = 'failed'",
    );
    totalCount += Sqflite.firstIntValue(routesResult) ?? 0;

    // Count pending approvals
    final approvalsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM approvals WHERE sync_status = 'pending' OR sync_status = 'failed'",
    );
    totalCount += Sqflite.firstIntValue(approvalsResult) ?? 0;

    developer.log(
      "Total pending count: $totalCount",
      name: "NIMSLocalService:getTotalPendingCount",
    );
    return totalCount;
  }

  /// Get count of records with 'failed' sync status across all tables
  Future<int> getFailedSyncCount() async {
    developer.log(
      "Getting failed sync count",
      name: "NIMSLocalService:getFailedSyncCount",
    );
    final db = await NIMSDatabase().instance;

    int totalCount = 0;

    // Count failed manifests
    final manifestsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM manifests WHERE sync_status = 'failed'",
    );
    totalCount += Sqflite.firstIntValue(manifestsResult) ?? 0;

    // Count failed routes
    final routesResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM routes WHERE sync_status = 'failed'",
    );
    totalCount += Sqflite.firstIntValue(routesResult) ?? 0;

    // Count failed approvals
    final approvalsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM approvals WHERE sync_status = 'failed'",
    );
    totalCount += Sqflite.firstIntValue(approvalsResult) ?? 0;

    developer.log(
      "Total failed count: $totalCount",
      name: "NIMSLocalService:getFailedSyncCount",
    );
    return totalCount;
  }

  // ==================== LSP AND ETOKEN METHODS ====================

  /// Get the first available LSP for the current user
  Future<DomainLsp?> getFirstCachedLsp() async {
    developer.log(
      "Getting first cached LSP",
      name: "NIMSLocalService:getFirstCachedLsp",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query('lsps', limit: 1);
    developer.log(
      "lsp: $result",
      name: "NIMSLocalService:getFirstCachedLsp",
    );
    if (result.isNotEmpty) {
      return DomainLsp.fromJson(result.first);
    }
    return null;
  }

  /// Get the next available etoken and return it
  Future<DomainETokenData?> getNextEToken() async {
    developer.log(
      "Getting next etoken",
      name: "NIMSLocalService:getNextEToken",
    );
    final db = await NIMSDatabase().instance;
    final result = await db.query('etoken_data', limit: 1);
    developer.log(
      "etoken: $result",
      name: "NIMSLocalService:getNextEToken",
    );
    if (result.isNotEmpty) {
      return DomainETokenData.fromJson(result.first);
    }
    return null;
  }

  /// Delete a used etoken by its ID
  Future<void> deleteEToken(String etokenId) async {
    developer.log(
      "Deleting etoken: $etokenId",
      name: "NIMSLocalService:deleteEToken",
    );
    final db = await NIMSDatabase().instance;
    await db.delete('etoken_data', where: 'etoken_id = ?', whereArgs: [etokenId]);
  }

  /// Delete multiple etokens by their IDs
  Future<void> deleteETokens(List<String> etokenIds) async {
    developer.log(
      "Deleting etokens: $etokenIds",
      name: "NIMSLocalService:deleteETokens",
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      for (final etokenId in etokenIds) {
        await txn.delete('etoken_data', where: 'etoken_id = ?', whereArgs: [etokenId]);
      }
    });
  }

  /// Update shipment status (e.g., from 'pending' to 'in-transit' after sync)
  Future<void> updateShipmentStatus(String shipmentNo, String status) async {
    developer.log(
      "Updating shipment $shipmentNo status to $status",
      name: "NIMSLocalService:updateShipmentStatus",
    );
    final db = await NIMSDatabase().instance;
    await db.update(
      'shipments',
      {'shipment_status': status},
      where: 'shipment_no = ?',
      whereArgs: [shipmentNo],
    );
  }

  /// Update shipment delivery date when shipment is delivered
  Future<void> updateShipmentDeliveryDate(String shipmentNo, String deliveryDate) async {
    developer.log(
      "Updating shipment $shipmentNo delivery_date to $deliveryDate",
      name: "NIMSLocalService:updateShipmentDeliveryDate",
    );
    final db = await NIMSDatabase().instance;
    await db.update(
      'shipments',
      {'delivery_date': deliveryDate},
      where: 'shipment_no = ?',
      whereArgs: [shipmentNo],
    );
  }
}
