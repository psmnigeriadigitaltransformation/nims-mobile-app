import 'package:sqflite/sqflite.dart';

import '../../../domain/mappers/typedefs.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for etoken operations.
///
/// Handles operations for:
/// - etoken_data table
class ETokenDao extends BaseDao {
  @override
  String get logName => 'ETokenDao';

  /// Caches etoken data (appends to existing data)
  Future<void> cacheETokenData(List<DomainETokenData> eTokenDataList) async {
    log('etoken data list: $eTokenDataList', method: 'cacheETokenData');
    final database = await db;
    final batch = database.batch();
    for (final eTokenData in eTokenDataList) {
      batch.insert(
        Tables.etokenData,
        eTokenData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true, continueOnError: true);
  }

  /// Counts the number of etokens available
  Future<int> countETokenData() async {
    log('count eToken data called', method: 'countETokenData');
    final database = await db;
    final result = await database.rawQuery(
      'SELECT COUNT(*) as count FROM ${Tables.etokenData}',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Gets the next available etoken
  Future<DomainETokenData?> getNextEToken() async {
    log('Getting next etoken', method: 'getNextEToken');
    final database = await db;
    final result = await database.query(Tables.etokenData, limit: 1);
    log('etoken: $result', method: 'getNextEToken');
    if (result.isNotEmpty) {
      return DomainETokenData.fromJson(result.first);
    }
    return null;
  }

  /// Deletes a used etoken by its ID
  Future<void> deleteEToken(String etokenId) async {
    log('Deleting etoken: $etokenId', method: 'deleteEToken');
    await deleteByUniqueId(Tables.etokenData, Columns.etokenId, etokenId);
  }

  /// Deletes multiple etokens by their IDs
  Future<void> deleteETokens(List<String> etokenIds) async {
    log('Deleting etokens: $etokenIds', method: 'deleteETokens');
    final database = await db;
    await database.transaction((txn) async {
      for (final etokenId in etokenIds) {
        await txn.delete(
          Tables.etokenData,
          where: '${Columns.etokenId} = ?',
          whereArgs: [etokenId],
        );
      }
    });
  }
}
