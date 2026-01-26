import 'package:sqflite/sqflite.dart';

import '../../../domain/mappers/typedefs.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for user-related tables.
///
/// Handles operations for:
/// - users
/// - platforms
/// - system_privileges
/// - privileges
/// - lsps
class UserDao extends BaseDao {
  @override
  String get logName => 'UserDao';

  // ==================== USERS ====================

  /// Gets the cached user, if any
  Future<DomainUser?> getCachedUser() async {
    log('Getting cached user', method: 'getCachedUser');
    final result = await getByUniqueId(Tables.users, Columns.id, 1);
    if (result != null) {
      return DomainUser.fromJson(result);
    }
    final database = await db;
    final users = await database.query(Tables.users, limit: 1);
    if (users.isNotEmpty) {
      return DomainUser.fromJson(users.first);
    }
    return null;
  }

  /// Caches a user, replacing any existing user
  Future<void> cacheUser(DomainUser user) async {
    log('user: $user', method: 'cacheUser');
    final database = await db;
    await database.transaction((txn) async {
      await txn.delete(Tables.users);
      await txn.insert(
        Tables.users,
        user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  /// Clears the cached user
  Future<void> clearCachedUser() async {
    log('Clearing cached user', method: 'clearCachedUser');
    final database = await db;
    await database.delete(Tables.users);
  }

  // ==================== PLATFORMS ====================

  /// Caches platforms for a user
  Future<void> cachePlatforms(List<DomainPlatform> platforms) async {
    log('platforms: $platforms', method: 'cachePlatforms');
    await batchInsert(
      Tables.platforms,
      platforms.map((p) => p.toJson()).toList(),
      clearTable: true,
    );
  }

  // ==================== SYSTEM PRIVILEGES ====================

  /// Caches system privileges and returns their IDs
  Future<List<int>> cacheSystemPrivileges(
    List<DomainSystemPrivilege> systemPrivileges,
  ) async {
    log('systemPrivileges: $systemPrivileges', method: 'cacheSystemPrivileges');
    final database = await db;
    late List<int> spIds;
    await database.transaction((txn) async {
      final batch = txn.batch();
      batch.delete(Tables.systemPrivileges);
      for (final systemPrivilege in systemPrivileges) {
        batch.insert(
          Tables.systemPrivileges,
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
      log('results: $systemPrivilegeIds', method: 'cacheSystemPrivileges');
      spIds = systemPrivilegeIds;
    });
    return spIds;
  }

  // ==================== PRIVILEGES ====================

  /// Caches privileges
  Future<void> cachePrivileges(List<DomainPrivilege> privileges) async {
    log('privileges: $privileges', method: 'cachePrivileges');
    await batchInsert(
      Tables.privileges,
      privileges.map((p) => p.toJson()).toList(),
      clearTable: true,
    );
  }

  // ==================== LSPS ====================

  /// Caches LSPs
  Future<void> cacheLsps(List<DomainLsp> lsps) async {
    log('lsps: $lsps', method: 'cacheLsps');
    await batchInsert(
      Tables.lsps,
      lsps.map((l) => l.toJson()).toList(),
      clearTable: true,
    );
  }

  /// Gets the first cached LSP
  Future<DomainLsp?> getFirstCachedLsp() async {
    log('Getting first cached LSP', method: 'getFirstCachedLsp');
    final database = await db;
    final result = await database.query(Tables.lsps, limit: 1);
    log('lsp: $result', method: 'getFirstCachedLsp');
    if (result.isNotEmpty) {
      return DomainLsp.fromJson(result.first);
    }
    return null;
  }
}
