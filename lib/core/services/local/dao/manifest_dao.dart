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

  /// Deletes a manifest and its samples
  Future<void> deleteManifest(String manifestNo) async {
    log('manifestNo: $manifestNo', method: 'deleteManifest');
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
  Future<void> deleteManifestLocally(String manifestNo) async {
    log('Deleting manifest locally: $manifestNo', method: 'deleteManifestLocally');
    await deleteManifest(manifestNo);
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

  /// Gets a manifest by its manifest number
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

  /// Updates a manifest locally
  Future<void> updateManifestLocally(DomainManifest manifest) async {
    log('Updating manifest: ${manifest.manifestNo}', method: 'updateManifestLocally');
    final data = manifest.toJson();
    data.remove('id'); // Don't update the id
    await updateByUniqueId(
      Tables.manifests,
      Columns.manifestNo,
      manifest.manifestNo,
      data,
    );
  }

  /// Updates manifest sample count
  Future<void> updateManifestSampleCount(String manifestNo, int newCount) async {
    log(
      'Updating manifest $manifestNo sample count to $newCount',
      method: 'updateManifestSampleCount',
    );
    await updateByUniqueId(
      Tables.manifests,
      Columns.manifestNo,
      manifestNo,
      {Columns.sampleCount: newCount},
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

  /// Gets samples by manifest number
  Future<List<DomainSample>> getCachedSamplesByManifestNo(String manifestNo) async {
    log('manifestNo: $manifestNo', method: 'getCachedSamplesByManifestNo');
    final result = await queryAll(
      Tables.samples,
      where: '${Columns.manifestNo} = ?',
      whereArgs: [manifestNo],
    );
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
}
