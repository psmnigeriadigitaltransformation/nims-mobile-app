import '../../../domain/mappers/typedefs.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for master/reference data tables.
///
/// Handles operations for:
/// - facilities
/// - sample_types
/// - locations
/// - movement_types
class MasterDataDao extends BaseDao {
  @override
  String get logName => 'MasterDataDao';

  // ==================== FACILITIES ====================

  /// Caches facilities
  Future<void> cacheFacilities(List<DomainFacility> facilities) async {
    log('facilities: $facilities', method: 'cacheFacilities');
    await batchInsert(
      Tables.facilities,
      facilities.map((f) => f.toJson()).toList(),
      clearTable: true,
    );
  }

  /// Gets all cached facilities
  Future<List<DomainFacility>> getCachedFacilities() async {
    final result = await queryAll(Tables.facilities);
    log('facilities: $result', method: 'getCachedFacilities');
    return result.map((f) => DomainFacility.fromJson(f)).toList();
  }

  /// Gets cached facilities matching a search query
  Future<List<DomainFacility>> getCachedFacilitiesBySearchQuery(
    String query,
  ) async {
    log('query: $query', method: 'getCachedFacilitiesBySearchQuery');
    final database = await db;
    final result = await database.query(
      Tables.facilities,
      where: '${Columns.facilityName} LIKE ? '
          'OR ${Columns.facilityCode} LIKE ? '
          'OR ${Columns.labCode} LIKE ? '
          'OR ${Columns.type} LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%', '%$query%'],
    );
    log('facilities: $result', method: 'getCachedFacilitiesBySearchQuery');
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

  // ==================== SAMPLE TYPES ====================

  /// Caches sample types
  Future<void> cacheSampleTypes(List<DomainSampleType> sampleTypes) async {
    log('sample_types: $sampleTypes', method: 'cacheSampleTypes');
    await batchInsert(
      Tables.sampleTypes,
      sampleTypes.map((s) => s.toJson()).toList(),
      clearTable: true,
    );
  }

  /// Gets all cached sample types
  Future<List<DomainSampleType>> getCachedSampleTypes() async {
    final result = await queryAll(Tables.sampleTypes);
    log('sample_types: $result', method: 'getCachedSampleTypes');
    return result.map((s) => DomainSampleType.fromJson(s)).toList();
  }

  // ==================== LOCATIONS ====================

  /// Caches locations
  Future<void> cacheLocations(List<DomainLocation> locations) async {
    log('locations: $locations', method: 'cacheLocations');
    await batchInsert(
      Tables.locations,
      locations.map((l) => l.toJson()).toList(),
      clearTable: true,
    );
  }

  /// Gets all cached locations
  Future<List<DomainLocation>> getCachedLocations() async {
    final result = await queryAll(Tables.locations);
    log('locations: $result', method: 'getCachedLocations');
    return result.map((l) => DomainLocation.fromJson(l)).toList();
  }

  // ==================== MOVEMENT TYPES ====================

  /// Caches movement types
  Future<void> cacheMovementTypes(List<DomainMovementType> movementTypes) async {
    log('movement types: $movementTypes', method: 'cacheMovementTypes');
    await batchInsert(
      Tables.movementTypes,
      movementTypes.map((m) => m.toJson()).toList(),
      clearTable: true,
    );
  }

  /// Gets all cached movement types
  Future<List<DomainMovementType>> getCachedMovementTypes() async {
    final result = await queryAll(Tables.movementTypes);
    log('movement_types: $result', method: 'getCachedMovementTypes');
    return result.map((m) => DomainMovementType.fromJson(m)).toList();
  }

  // ==================== REJECTION REASONS ====================

  /// Caches rejection reasons
  Future<void> cacheRejectionReasons(List<DomainRejectionReason> reasons) async {
    log('rejection_reasons: $reasons', method: 'cacheRejectionReasons');
    await batchInsert(
      Tables.rejectionReasons,
      reasons.map((r) => r.toJson()).toList(),
      clearTable: true,
    );
  }

  /// Gets all cached rejection reasons
  Future<List<DomainRejectionReason>> getCachedRejectionReasons() async {
    final result = await queryAll(Tables.rejectionReasons);
    log('rejection_reasons: $result', method: 'getCachedRejectionReasons');
    return result.map((r) => DomainRejectionReason.fromJson(r)).toList();
  }
}
