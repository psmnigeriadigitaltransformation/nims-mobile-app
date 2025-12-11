import 'dart:convert';
import 'dart:developer' as developer;

import 'package:projects/core/domain/models/facility.dart';
import 'package:projects/core/domain/models/location.dart';
import 'package:projects/core/domain/models/movement_type.dart';
import 'package:projects/core/domain/models/platform.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/services/remote/models/facilities_response.dart';
import 'package:sqflite/sqflite.dart';

import '../remote/models/locations_response.dart';
import '../remote/models/login_response.dart';
import '../remote/models/movement_types_response.dart';
import '../remote/models/sample_types_response.dart';
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

  Future<void> updateCachedUser(DomainUser user) async {
    developer.log("user: $user", name: "NIMSLocalService:updateCachedUser");
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

  Future<void> updateCachedPlatforms(List<DomainPlatform> platforms) async {
    developer.log(
      "platforms: $platforms",
      name: "NIMSLocalService:updateCachedUserPlatforms",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    batch.delete("platforms");

    for (final platform in platforms) {
      batch.insert(
        "platforms",
        platform.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<int>> updateCachedSystemPrivileges(
    List<DomainSystemPrivilege> systemPrivileges,
  ) async {
    developer.log(
      "systemPrivileges: $systemPrivileges",
      name: "NIMSLocalService:updateCachedSystemPrivileges",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
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
      name: "NIMSLocalService:updateCachedSystemPrivileges",
    );
    return systemPrivilegeIds;
  }

  Future<void> updateCachedPrivileges(List<DomainPrivilege> privileges) async {
    developer.log(
      "privileges: $privileges",
      name: "NIMSLocalService:updateCachedPrivileges",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    batch.delete("privileges");

    for (final privilege in privileges) {
      batch.insert(
        "privileges",
        privilege.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> updateCachedLsps(List<DomainLsp> lsps) async {
    developer.log(
      "lsps: $lsps",
      name: "NIMSLocalService:updateCachedPrivileges",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    batch.delete("lsps");

    for (final lsp in lsps) {
      batch.insert(
        "lsps",
        lsp.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> updateCachedFacilities(List<DomainFacility> facilities) async {
    developer.log(
      "facilities: $facilities",
      name: "NIMSLocalService:cacheFacilities",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    batch.delete("facilities");

    for (final facility in facilities) {
      batch.insert(
        "facilities",
        facility.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> updateCachedSampleTypes(
    List<DomainSampleType> sampleTypes,
  ) async {
    developer.log(
      "sample_types: $sampleTypes",
      name: "NIMSLocalService:cacheSampleTypes",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    batch.delete("sample_types");

    for (final sampleType in sampleTypes) {
      batch.insert(
        "sample_types",
        sampleType.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> updateCachedLocations(List<DomainLocation> locations) async {
    developer.log(
      "locations: $locations",
      name: "NIMSLocalService:cacheLocations",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    batch.delete("locations");

    for (final location in locations) {
      batch.insert(
        "locations",
        location.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> updateCachedMovementTypes(
    List<DomainMovementType> movementTypes,
  ) async {
    developer.log(
      "movement types: $movementTypes",
      name: "NIMSLocalService:cacheMovementTypes",
    );
    final db = await NIMSDatabase().instance;
    final batch = db.batch();
    batch.delete("movement_types");

    for (final movementType in movementTypes) {
      batch.insert(
        "movement_types",
        movementType.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  // to be refactored

  Future<FacilitiesData?> getCachedFacilities() async {
    final db = await NIMSDatabase().instance;
    final result = await db.query('facilities');

    if (result.isNotEmpty) {
      return FacilitiesData.fromJson(result.first);
    }
    return null;
  }
}
