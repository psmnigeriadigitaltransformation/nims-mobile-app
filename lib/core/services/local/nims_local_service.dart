import 'dart:developer' as developer;

import 'package:projects/core/domain/mappers/typedefs.dart';
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
}
