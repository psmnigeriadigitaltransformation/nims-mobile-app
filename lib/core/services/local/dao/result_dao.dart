import 'package:sqflite/sqflite.dart';

import '../../../domain/models/result.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for lab result operations.
///
/// Handles operations for:
/// - results table
class ResultDao extends BaseDao {
  @override
  String get logName => 'ResultDao';

  /// Caches results for a facility (replaces existing non-picked, non-rejected results)
  Future<void> cacheResultsForFacility(
    String facilityId,
    List<LabResult> results,
  ) async {
    log(
      'Caching ${results.length} results for facility $facilityId',
      method: 'cacheResultsForFacility',
    );
    final database = await db;
    await database.transaction((txn) async {
      // Delete existing results for this facility that are not picked and not locally rejected
      // This preserves locally rejected results pending sync
      await txn.delete(
        Tables.results,
        where: 'facility_id = ? AND is_picked = 0 AND is_rejected = 0',
        whereArgs: [facilityId],
      );
      // Insert new results, ignoring conflicts to preserve locally modified results
      // (e.g., locally rejected results pending sync)
      for (final result in results) {
        await txn.insert(
          Tables.results,
          result.toJson(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
    });
  }

  /// Gets cached results for a facility (excludes already picked and rejected results)
  Future<List<LabResult>> getCachedResultsForFacility(String facilityId) async {
    log(
      'Getting cached results for facility $facilityId',
      method: 'getCachedResultsForFacility',
    );
    final database = await db;
    final result = await database.query(
      Tables.results,
      where: '${Columns.facilityId} = ? AND ${Columns.isPicked} = 0 AND ${Columns.isRejected} = 0',
      whereArgs: [facilityId],
    );
    log(
      'Found ${result.length} available results (excluding picked and rejected)',
      method: 'getCachedResultsForFacility',
    );
    return result.map((r) => LabResult.fromJson(r)).toList();
  }

  /// Updates result rejection status
  Future<void> updateResultRejection(
    String sampleCode,
    bool isRejected,
    String? reason,
    String? rejectionDate,
    String? syncStatus,
  ) async {
    log(
      'Updating result $sampleCode rejection: isRejected=$isRejected, syncStatus=$syncStatus',
      method: 'updateResultRejection',
    );
    await updateByUniqueId(
      Tables.results,
      Columns.sampleCode,
      sampleCode,
      {
        Columns.isRejected: isRejected ? 1 : 0,
        Columns.rejectionReason: reason,
        Columns.rejectionDate: rejectionDate,
        Columns.rejectionSyncStatus: syncStatus,
      },
    );
  }

  /// Updates result picked status and route number
  Future<void> updateResultPicked(
    String sampleCode,
    bool isPicked,
    String? routeNo,
  ) async {
    log(
      'Updating result $sampleCode picked: isPicked=$isPicked, routeNo=$routeNo',
      method: 'updateResultPicked',
    );
    await updateByUniqueId(
      Tables.results,
      Columns.sampleCode,
      sampleCode,
      {
        Columns.isPicked: isPicked ? 1 : 0,
        Columns.routeNo: routeNo,
      },
    );
  }

  /// Gets pending rejections (for sync)
  Future<List<LabResult>> getPendingRejections() async {
    log('Getting pending rejections', method: 'getPendingRejections');
    final database = await db;
    final result = await database.query(
      Tables.results,
      where: '${Columns.isRejected} = 1 AND '
          '(${Columns.rejectionSyncStatus} = ? OR ${Columns.rejectionSyncStatus} = ?)',
      whereArgs: [SyncStatus.pending, SyncStatus.failed],
    );
    log(
      'Found ${result.length} pending rejections',
      method: 'getPendingRejections',
    );
    return result.map((r) => LabResult.fromJson(r)).toList();
  }

  /// Gets picked results for a route
  Future<List<LabResult>> getPickedResultsForRoute(String routeNo) async {
    log(
      'Getting picked results for route $routeNo',
      method: 'getPickedResultsForRoute',
    );
    final database = await db;
    final result = await database.query(
      Tables.results,
      where: '${Columns.routeNo} = ? AND ${Columns.isPicked} = 1',
      whereArgs: [routeNo],
    );
    log(
      'Found ${result.length} picked results',
      method: 'getPickedResultsForRoute',
    );
    return result.map((r) => LabResult.fromJson(r)).toList();
  }

  /// Deletes a result
  Future<void> deleteResult(String sampleCode) async {
    log('Deleting result $sampleCode', method: 'deleteResult');
    await deleteByUniqueId(Tables.results, Columns.sampleCode, sampleCode);
  }

  /// Deletes picked results for a route
  Future<void> deletePickedResults(String routeNo) async {
    log(
      'Deleting picked results for route $routeNo',
      method: 'deletePickedResults',
    );
    final database = await db;
    await database.delete(
      Tables.results,
      where: '${Columns.routeNo} = ? AND ${Columns.isPicked} = 1',
      whereArgs: [routeNo],
    );
  }

  /// Gets a single result by sample code
  Future<LabResult?> getResultBySampleCode(String sampleCode) async {
    log(
      'Getting result by sample code $sampleCode',
      method: 'getResultBySampleCode',
    );
    final result = await getByUniqueId(
      Tables.results,
      Columns.sampleCode,
      sampleCode,
    );
    if (result != null) {
      return LabResult.fromJson(result);
    }
    return null;
  }

  /// Gets results by multiple sample codes
  Future<List<LabResult>> getResultsBySampleCodes(
    List<String> sampleCodes,
  ) async {
    if (sampleCodes.isEmpty) return [];
    log(
      'Getting ${sampleCodes.length} results by sample codes',
      method: 'getResultsBySampleCodes',
    );
    final database = await db;
    final placeholders = List.filled(sampleCodes.length, '?').join(',');
    final result = await database.query(
      Tables.results,
      where: '${Columns.sampleCode} IN ($placeholders)',
      whereArgs: sampleCodes,
    );
    log(
      'Found ${result.length} results',
      method: 'getResultsBySampleCodes',
    );
    return result.map((r) => LabResult.fromJson(r)).toList();
  }

  /// Marks results as picked for a route
  Future<void> markResultsAsPickedForRoute(
    List<String> sampleCodes,
    String routeNo,
  ) async {
    log(
      'Marking ${sampleCodes.length} results as picked for route $routeNo',
      method: 'markResultsAsPickedForRoute',
    );
    final database = await db;
    await database.transaction((txn) async {
      for (final sampleCode in sampleCodes) {
        await txn.update(
          Tables.results,
          {Columns.isPicked: 1, Columns.routeNo: routeNo},
          where: '${Columns.sampleCode} = ?',
          whereArgs: [sampleCode],
        );
      }
    });
  }
}
