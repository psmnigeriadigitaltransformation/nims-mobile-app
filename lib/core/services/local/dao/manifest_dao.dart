import '../../../domain/mappers/typedefs.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for manifest and sample operations.
///
/// Handles operations for:
/// - manifests table
/// - samples table
class ManifestDao extends BaseDao {
  @override
  String get logName => 'ManifestDao';

  // ==================== MANIFEST OPERATIONS ====================

  /// Caches a manifest with its samples
  Future<void> cacheManifest(
    DomainManifest manifest,
    List<DomainSample> samples,
  ) async {
    log('manifest: $manifest', method: 'cacheManifest');
    log('samples: $samples', method: 'cacheManifest');
    final database = await db;
    await database.transaction((txn) async {
      final batch = txn.batch();
      batch.insert(Tables.manifests, manifest.toJson());
      for (final sample in samples) {
        batch.insert(Tables.samples, sample.toJson());
      }
      await batch.commit(noResult: true);
    });
  }

  /// Deletes a manifest and its samples by manifest_no
  Future<void> deleteManifest(String manifestNo, String originId) async {
    log(
      'manifestNo: $manifestNo',
      method: 'deleteManifest',
    );
    final database = await db;
    await database.transaction((txn) async {
      // Delete samples linked to the manifest first
      await txn.delete(
        Tables.samples,
        where: '${Columns.manifestNo} = ?',
        whereArgs: [manifestNo],
      );
      // Delete the manifest
      await txn.delete(
        Tables.manifests,
        where: '${Columns.manifestNo} = ?',
        whereArgs: [manifestNo],
      );
    });
  }

  /// Deletes a manifest locally (alias for deleteManifest)
  Future<void> deleteManifestLocally(String manifestNo, String originId) async {
    log(
      'Deleting manifest locally: $manifestNo',
      method: 'deleteManifestLocally',
    );
    await deleteManifest(manifestNo, originId);
  }

  /// Gets manifests by origin ID
  Future<List<DomainManifest>> getCacheManifestsByOriginId(String originId) async {
    log('originId: $originId', method: 'getCacheManifestsByOriginId');
    final result = await queryAll(
      Tables.manifests,
      where: '${Columns.originId} = ?',
      whereArgs: [originId],
      orderBy: '${Columns.createdAt} DESC',
    );
    log('manifestsCC: $result', method: 'getCacheManifestsByOriginId');
    return result.map((m) => DomainManifest.fromJson(m)).toList();
  }

  /// Gets manifests matching a search query
  Future<List<DomainManifest>> getCachedManifestsBySearchQuery(String query) async {
    log('query: $query', method: 'getCachedManifestsBySearchQuery');
    final database = await db;
    final result = await database.query(
      Tables.manifests,
      where: '${Columns.manifestNo} LIKE ? '
          'OR ${Columns.sampleType} LIKE ? '
          'OR ${Columns.originatingFacilityName} LIKE ? '
          'OR ${Columns.phlebotomyNo} LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%', '%$query%'],
      orderBy: '${Columns.createdAt} DESC',
    );
    log('manifestsCC: $result', method: 'getCachedManifestsBySearchQuery');
    return result.map((m) => DomainManifest.fromJson(m)).toList();
  }

  /// Gets all cached manifests
  Future<List<DomainManifest>> getAllCachedManifests() async {
    log('Getting all cached manifest', method: 'getAllCachedManifests');
    final result = await queryAll(
      Tables.manifests,
      orderBy: '${Columns.createdAt} DESC',
    );
    return result.map((m) => DomainManifest.fromJson(m)).toList();
  }

  /// Gets a manifest by its manifest number (unique identifier)
  Future<DomainManifest?> getManifestByNo(String manifestNo) async {
    log('manifestNo: $manifestNo', method: 'getManifestByNo');
    final result = await getByUniqueId(
      Tables.manifests,
      Columns.manifestNo,
      manifestNo,
    );
    log('manifest: $result', method: 'getManifestByNo');
    if (result != null) {
      return DomainManifest.fromJson(result);
    }
    return null;
  }

  /// Gets a manifest by manifest_no and origin_id (legacy method, use getManifestByNo instead)
  /// Kept for backward compatibility
  Future<DomainManifest?> getManifestByCompositeKey(
    String manifestNo,
    String originId,
  ) async {
    log(
      'manifestNo: $manifestNo (using manifest_no lookup)',
      method: 'getManifestByCompositeKey',
    );
    // Since manifest_no is now unique, just use that
    return getManifestByNo(manifestNo);
  }

  /// Updates a manifest locally using manifest_no
  Future<void> updateManifestLocally(DomainManifest manifest) async {
    log(
      'Updating manifest: ${manifest.manifestNo}',
      method: 'updateManifestLocally',
    );
    final database = await db;
    final data = manifest.toJson();
    data.remove('id'); // Don't update the id
    await database.update(
      Tables.manifests,
      data,
      where: '${Columns.manifestNo} = ?',
      whereArgs: [manifest.manifestNo],
    );
  }

  /// Updates manifest sample count using manifest_no
  Future<void> updateManifestSampleCount(
    String manifestNo,
    String originId,
    int newCount,
  ) async {
    log(
      'Updating manifest $manifestNo sample count to $newCount',
      method: 'updateManifestSampleCount',
    );
    final database = await db;
    await database.update(
      Tables.manifests,
      {Columns.sampleCount: newCount},
      where: '${Columns.manifestNo} = ?',
      whereArgs: [manifestNo],
    );
  }

  /// Gets pending manifests (for sync)
  Future<List<DomainManifest>> getPendingManifests() async {
    log('Getting pending manifest', method: 'getPendingManifests');
    final result = await getPendingRecords(
      Tables.manifests,
      orderBy: '${Columns.createdAt} ASC',
    );
    log('pending manifest: $result', method: 'getPendingManifests');
    return result.map((m) => DomainManifest.fromJson(m)).toList();
  }

  // ==================== SAMPLE OPERATIONS ====================

  /// Gets samples by manifest composite key (manifest_no, origin_id)
  Future<List<DomainSample>> getCachedSamplesByManifestNo(
    String manifestNo, {
    String? originId,
  }) async {
    log(
      'manifestNo: $manifestNo, originId: $originId',
      method: 'getCachedSamplesByManifestNo',
    );
    final database = await db;
    List<Map<String, dynamic>> result;
    if (originId != null) {
      result = await database.query(
        Tables.samples,
        where: '${Columns.manifestNo} = ? AND ${Columns.originId} = ?',
        whereArgs: [manifestNo, originId],
      );
    } else {
      result = await database.query(
        Tables.samples,
        where: '${Columns.manifestNo} = ?',
        whereArgs: [manifestNo],
      );
    }
    log('samples: $result', method: 'getCachedSamplesByManifestNo');
    return result.map((s) => DomainSample.fromJson(s)).toList();
  }

  /// Gets a sample by its sample code
  Future<DomainSample?> getSampleByCode(String sampleCode) async {
    log('sampleCode: $sampleCode', method: 'getSampleByCode');
    final result = await getByUniqueId(
      Tables.samples,
      Columns.sampleCode,
      sampleCode,
    );
    log('sample: $result', method: 'getSampleByCode');
    if (result != null) {
      return DomainSample.fromJson(result);
    }
    return null;
  }

  /// Updates a sample locally
  Future<void> updateSampleLocally(DomainSample sample) async {
    log('Updating sample: ${sample.sampleCode}', method: 'updateSampleLocally');
    final data = sample.toJson();
    data.remove('id'); // Don't update the id
    await updateByUniqueId(
      Tables.samples,
      Columns.sampleCode,
      sample.sampleCode,
      data,
    );
  }

  /// Deletes a sample locally
  Future<void> deleteSampleLocally(String sampleCode) async {
    log('Deleting sample locally: $sampleCode', method: 'deleteSampleLocally');
    await deleteByUniqueId(Tables.samples, Columns.sampleCode, sampleCode);
  }

  /// Gets pending samples (for sync)
  Future<List<DomainSample>> getPendingSamples() async {
    log('Getting pending samples', method: 'getPendingSamples');
    final result = await getPendingRecords(Tables.samples);
    return result.map((s) => DomainSample.fromJson(s)).toList();
  }

  // ==================== UPSERT OPERATIONS (FOR SERVER DATA) ====================

  /// Upserts a manifest from server data.
  ///
  /// - If manifest doesn't exist locally: insert with sync_status='synced'
  /// - If manifest exists with sync_status='synced': update it
  /// - If manifest exists with sync_status!='synced': skip (preserve local pending changes)
  Future<void> upsertManifestFromServer(DomainManifest manifest) async {
    log(
      'Upserting manifest from server: ${manifest.manifestNo}',
      method: 'upsertManifestFromServer',
    );
    final existing = await getManifestByNo(manifest.manifestNo);

    if (existing == null) {
      // Insert new manifest with synced status
      log(
        'Inserting new manifest: ${manifest.manifestNo}',
        method: 'upsertManifestFromServer',
      );
      final database = await db;
      await database.insert(Tables.manifests, manifest.toJson());
    } else if (existing.syncStatus == SyncStatus.synced) {
      // Update only if synced (server has latest data)
      log(
        'Updating synced manifest: ${manifest.manifestNo}',
        method: 'upsertManifestFromServer',
      );
      await updateManifestLocally(manifest);
    } else {
      // Skip update - preserve local pending changes
      log(
        'Skipping manifest update (local has pending changes): ${manifest.manifestNo}, syncStatus: ${existing.syncStatus}',
        method: 'upsertManifestFromServer',
      );
    }
  }

  /// Upserts a sample from server data.
  ///
  /// - If sample doesn't exist locally: insert with sync_status='synced'
  /// - If sample exists with sync_status='synced': update it
  /// - If sample exists with sync_status!='synced': skip (preserve local pending changes)
  Future<void> upsertSampleFromServer(DomainSample sample) async {
    log(
      'Upserting sample from server: ${sample.sampleCode}',
      method: 'upsertSampleFromServer',
    );
    final existing = await getSampleByCode(sample.sampleCode);

    if (existing == null) {
      // Insert new sample with synced status
      log(
        'Inserting new sample: ${sample.sampleCode}',
        method: 'upsertSampleFromServer',
      );
      final database = await db;
      await database.insert(Tables.samples, sample.toJson());
    } else if (existing.syncStatus == SyncStatus.synced) {
      // Update only if synced (server has latest data)
      log(
        'Updating synced sample: ${sample.sampleCode}',
        method: 'upsertSampleFromServer',
      );
      await updateSampleLocally(sample);
    } else {
      // Skip update - preserve local pending changes
      log(
        'Skipping sample update (local has pending changes): ${sample.sampleCode}, syncStatus: ${existing.syncStatus}',
        method: 'upsertSampleFromServer',
      );
    }
  }
}
