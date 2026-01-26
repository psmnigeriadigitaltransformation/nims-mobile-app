import 'dart:developer' as developer;

import 'package:sqflite/sqflite.dart';

import '../database.dart';
import '../database/tables.dart';

/// Abstract base class for Data Access Objects (DAOs).
///
/// Provides common database operations and patterns for all DAOs.
/// Each DAO should extend this class and implement the required abstract members.
abstract class BaseDao {
  /// Gets the database instance
  Future<Database> get db => NIMSDatabase().instance;

  /// Name used for logging
  String get logName;

  /// Logs a message with the DAO's name
  void log(String message, {String? method}) {
    developer.log(
      message,
      name: method != null ? '$logName:$method' : logName,
    );
  }

  /// Executes a batch insert operation within a transaction
  Future<void> batchInsert(
    String table,
    List<Map<String, dynamic>> items, {
    bool clearTable = false,
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.replace,
  }) async {
    final database = await db;
    await database.transaction((txn) async {
      final batch = txn.batch();
      if (clearTable) {
        batch.delete(table);
      }
      for (final item in items) {
        batch.insert(table, item, conflictAlgorithm: conflictAlgorithm);
      }
      await batch.commit(noResult: true);
    });
  }

  /// Executes a simple query and returns all matching rows
  Future<List<Map<String, dynamic>>> queryAll(
    String table, {
    String? orderBy,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final database = await db;
    return database.query(
      table,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
    );
  }

  /// Gets a single record by a unique identifier
  Future<Map<String, dynamic>?> getByUniqueId(
    String table,
    String column,
    dynamic value,
  ) async {
    final database = await db;
    final result = await database.query(
      table,
      where: '$column = ?',
      whereArgs: [value],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  /// Updates a record by a unique identifier
  Future<int> updateByUniqueId(
    String table,
    String column,
    dynamic value,
    Map<String, dynamic> data,
  ) async {
    final database = await db;
    return database.update(
      table,
      data,
      where: '$column = ?',
      whereArgs: [value],
    );
  }

  /// Deletes a record by a unique identifier
  Future<int> deleteByUniqueId(
    String table,
    String column,
    dynamic value,
  ) async {
    final database = await db;
    return database.delete(
      table,
      where: '$column = ?',
      whereArgs: [value],
    );
  }

  /// Gets records with pending or failed sync status
  Future<List<Map<String, dynamic>>> getPendingRecords(
    String table, {
    String? orderBy,
  }) async {
    final database = await db;
    return database.query(
      table,
      where: '${Columns.syncStatus} = ? OR ${Columns.syncStatus} = ?',
      whereArgs: [SyncStatus.pending, SyncStatus.failed],
      orderBy: orderBy,
    );
  }

  /// Updates sync status for a record
  Future<void> updateSyncStatus(
    String table,
    String idColumn,
    String idValue,
    String status,
  ) async {
    log(
      'Updating sync status: $table.$idColumn=$idValue to $status',
      method: 'updateSyncStatus',
    );
    final database = await db;
    await database.update(
      table,
      {Columns.syncStatus: status},
      where: '$idColumn = ?',
      whereArgs: [idValue],
    );
  }

  /// Updates stage for a record
  Future<void> updateStage(
    String table,
    String idColumn,
    String idValue,
    String stage,
  ) async {
    log(
      'Updating stage: $table.$idColumn=$idValue to $stage',
      method: 'updateStage',
    );
    final database = await db;
    await database.update(
      table,
      {Columns.stage: stage},
      where: '$idColumn = ?',
      whereArgs: [idValue],
    );
  }

  /// Counts records with pending or failed sync status
  Future<int> countPendingRecords(String table) async {
    final database = await db;
    final result = await database.rawQuery(
      "SELECT COUNT(*) as count FROM $table "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.pending}' "
      "OR ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Counts records with failed sync status
  Future<int> countFailedRecords(String table) async {
    final database = await db;
    final result = await database.rawQuery(
      "SELECT COUNT(*) as count FROM $table "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
