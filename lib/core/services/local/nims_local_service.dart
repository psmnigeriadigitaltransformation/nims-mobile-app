import 'dart:developer' as developer;

import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart' as domain_result;
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/approval_dao.dart';
import 'dao/etoken_dao.dart';
import 'dao/manifest_dao.dart';
import 'dao/master_data_dao.dart';
import 'dao/result_dao.dart';
import 'dao/route_dao.dart';
import 'dao/shipment_dao.dart';
import 'dao/user_dao.dart';
import 'database.dart';
import 'database/tables.dart';

typedef DomainResultModel = domain_result.LabResult;

/// Facade service that provides a unified interface to all local database operations.
///
/// This service delegates to specialized DAOs for each models area:
/// - [UserDao] for user, platform, system privilege, privilege, and LSP operations
/// - [MasterDataDao] for facility, sample type, location, and movement type operations
/// - [ETokenDao] for etoken operations
/// - [ManifestDao] for manifest and sample operations
/// - [RouteDao] for route operations
/// - [ShipmentDao] for shipment operations
/// - [ApprovalDao] for approval operations
/// - [ResultDao] for lab result operations
class NIMSLocalService {
  final UserDao _userDao;
  final MasterDataDao _masterDataDao;
  final ETokenDao _etokenDao;
  final ManifestDao _manifestDao;
  final RouteDao _routeDao;
  final ShipmentDao _shipmentDao;
  final ApprovalDao _approvalDao;
  final ResultDao _resultDao;

  NIMSLocalService({
    UserDao? userDao,
    MasterDataDao? masterDataDao,
    ETokenDao? etokenDao,
    ManifestDao? manifestDao,
    RouteDao? routeDao,
    ShipmentDao? shipmentDao,
    ApprovalDao? approvalDao,
    ResultDao? resultDao,
  })  : _userDao = userDao ?? UserDao(),
        _masterDataDao = masterDataDao ?? MasterDataDao(),
        _etokenDao = etokenDao ?? ETokenDao(),
        _manifestDao = manifestDao ?? ManifestDao(),
        _routeDao = routeDao ?? RouteDao(),
        _shipmentDao = shipmentDao ?? ShipmentDao(),
        _approvalDao = approvalDao ?? ApprovalDao(),
        _resultDao = resultDao ?? ResultDao();

  // ==================== USER OPERATIONS ====================

  Future<DomainUser?> getCachedUser() => _userDao.getCachedUser();

  Future<void> cacheUser(DomainUser user) => _userDao.cacheUser(user);

  Future<void> clearCachedUser() => _userDao.clearCachedUser();

  Future<void> cachePlatforms(List<DomainPlatform> platforms) =>
      _userDao.cachePlatforms(platforms);

  Future<List<int>> cacheSystemPrivileges(
    List<DomainSystemPrivilege> systemPrivileges,
  ) =>
      _userDao.cacheSystemPrivileges(systemPrivileges);

  Future<void> cachePrivileges(List<DomainPrivilege> privileges) =>
      _userDao.cachePrivileges(privileges);

  Future<void> cacheLsps(List<DomainLsp> lsps) => _userDao.cacheLsps(lsps);

  Future<DomainLsp?> getFirstCachedLsp() => _userDao.getFirstCachedLsp();

  // ==================== MASTER DATA OPERATIONS ====================

  Future<void> cacheFacilities(List<DomainFacility> facilities) =>
      _masterDataDao.cacheFacilities(facilities);

  Future<List<DomainFacility>> getCachedFacilities() =>
      _masterDataDao.getCachedFacilities();

  Future<List<DomainFacility>> getCachedFacilitiesBySearchQuery(String query) =>
      _masterDataDao.getCachedFacilitiesBySearchQuery(query);

  Future<void> cacheSampleTypes(List<DomainSampleType> sampleTypes) =>
      _masterDataDao.cacheSampleTypes(sampleTypes);

  Future<List<DomainSampleType>> getCachedSampleTypes() =>
      _masterDataDao.getCachedSampleTypes();

  Future<void> cacheLocations(List<DomainLocation> locations) =>
      _masterDataDao.cacheLocations(locations);

  Future<List<DomainLocation>> getCachedLocations() =>
      _masterDataDao.getCachedLocations();

  Future<void> cacheMovementTypes(List<DomainMovementType> movementTypes) =>
      _masterDataDao.cacheMovementTypes(movementTypes);

  Future<List<DomainMovementType>> getCachedMovementTypes() =>
      _masterDataDao.getCachedMovementTypes();

  // ==================== ETOKEN OPERATIONS ====================

  Future<void> cacheETokenData(List<DomainETokenData> eTokenDataList) =>
      _etokenDao.cacheETokenData(eTokenDataList);

  Future<int> countETokenData() => _etokenDao.countETokenData();

  Future<DomainETokenData?> getNextEToken() => _etokenDao.getNextEToken();

  Future<void> deleteEToken(String etokenId) =>
      _etokenDao.deleteEToken(etokenId);

  Future<void> deleteETokens(List<String> etokenIds) =>
      _etokenDao.deleteETokens(etokenIds);

  // ==================== MANIFEST OPERATIONS ====================

  Future<void> cacheManifest(
    DomainManifest manifest,
    List<DomainSample> samples,
  ) =>
      _manifestDao.cacheManifest(manifest, samples);

  Future<void> deleteManifest(String manifestNo, String originId) =>
      _manifestDao.deleteManifest(manifestNo, originId);

  Future<List<DomainManifest>> getCacheManifestsByOriginId(String originId) =>
      _manifestDao.getCacheManifestsByOriginId(originId);

  Future<List<DomainManifest>> getCachedManifestsBySearchQuery(String query) =>
      _manifestDao.getCachedManifestsBySearchQuery(query);

  Future<List<DomainManifest>> getAllCachedManifests() =>
      _manifestDao.getAllCachedManifests();

  Future<DomainManifest?> getManifestByNo(String manifestNo) =>
      _manifestDao.getManifestByNo(manifestNo);

  Future<DomainManifest?> getManifestByCompositeKey(
    String manifestNo,
    String originId,
  ) =>
      _manifestDao.getManifestByCompositeKey(manifestNo, originId);

  Future<void> updateManifestLocally(DomainManifest manifest) =>
      _manifestDao.updateManifestLocally(manifest);

  Future<void> updateManifestSampleCount(
    String manifestNo,
    String originId,
    int newCount,
  ) =>
      _manifestDao.updateManifestSampleCount(manifestNo, originId, newCount);

  Future<void> deleteManifestLocally(String manifestNo, String originId) =>
      _manifestDao.deleteManifestLocally(manifestNo, originId);

  Future<List<DomainManifest>> getPendingManifests() =>
      _manifestDao.getPendingManifests();

  Future<List<DomainSample>> getCachedSamplesByManifestNo(
    String manifestNo, {
    String? originId,
  }) =>
      _manifestDao.getCachedSamplesByManifestNo(manifestNo, originId: originId);

  Future<DomainSample?> getSampleByCode(String sampleCode) =>
      _manifestDao.getSampleByCode(sampleCode);

  Future<void> updateSampleLocally(DomainSample sample) =>
      _manifestDao.updateSampleLocally(sample);

  Future<void> deleteSampleLocally(String sampleCode) =>
      _manifestDao.deleteSampleLocally(sampleCode);

  Future<List<DomainSample>> getPendingSamples() =>
      _manifestDao.getPendingSamples();

  Future<void> upsertManifestFromServer(DomainManifest manifest) =>
      _manifestDao.upsertManifestFromServer(manifest);

  Future<void> upsertSampleFromServer(DomainSample sample) =>
      _manifestDao.upsertSampleFromServer(sample);

  // ==================== ROUTE OPERATIONS ====================

  Future<DomainShipmentRoute?> getCachedRouteByRouteNo(String routeNo) =>
      _routeDao.getCachedRouteByRouteNo(routeNo);

  Future<List<ShipmentRoute>> getCachedShipmentRoutesBySearchQuery(
    String query,
  ) =>
      _routeDao.getCachedShipmentRoutesBySearchQuery(query);

  Future<List<DomainShipmentRoute>> getAllCachedRoutes() =>
      _routeDao.getAllCachedRoutes();

  Future<List<DomainShipmentRoute>> getPendingRoutes() =>
      _routeDao.getPendingRoutes();

  Future<void> updateRouteStageToInTransit(String routeNo) =>
      _routeDao.updateRouteStageToInTransit(routeNo);

  Future<void> updateRouteStageToDelivered(String routeNo) =>
      _routeDao.updateRouteStageToDelivered(routeNo);

  // ==================== SHIPMENT OPERATIONS ====================

  Future<void> cacheShipmentRoute(
    DomainShipmentRoute route,
    List<DomainShipment> shipments,
    DomainApproval approval,
  ) =>
      _shipmentDao.cacheShipmentRoute(route, shipments, approval);

  Future<List<DomainShipment>> getCachedShipmentsByRouteNo(String routeNo) =>
      _shipmentDao.getCachedShipmentsByRouteNo(routeNo);

  Future<DomainShipment?> getCachedShipmentByRouteNo(String routeNo) =>
      _shipmentDao.getCachedShipmentByRouteNo(routeNo);

  Future<List<DomainShipment>> getCachedShipmentsBySearchQuery(String query) =>
      _shipmentDao.getCachedShipmentsBySearchQuery(query);

  Future<List<DomainShipment>> getAllCachedShipments() =>
      _shipmentDao.getAllCachedShipments();

  Future<List<DomainShipment>> getDeliveredShipmentsByRouteNo(String routeNo) =>
      _shipmentDao.getDeliveredShipmentsByRouteNo(routeNo);

  Future<List<DomainShipment>> getPendingShipments() =>
      _shipmentDao.getPendingShipments();

  Future<Map<String, String>> getShippedManifestStatuses() =>
      _shipmentDao.getShippedManifestStatuses();

  Future<void> updateShipmentStage(String shipmentNo, String stage) =>
      _shipmentDao.updateShipmentStage(shipmentNo, stage);

  Future<void> updateShipmentStageToInTransit(
    String shipmentNo,
    String manifestNo,
  ) =>
      _shipmentDao.updateShipmentStageToInTransit(shipmentNo, manifestNo);

  Future<void> updateShipmentDeliveryDate(
    String shipmentNo,
    String deliveryDate,
  ) =>
      _shipmentDao.updateShipmentDeliveryDate(shipmentNo, deliveryDate);

  // ==================== APPROVAL OPERATIONS ====================

  Future<List<DomainApproval>> getCachedApprovalsByRouteNo(String routeNo) =>
      _approvalDao.getCachedApprovalsByRouteNo(routeNo);

  Future<List<DomainApproval>> getCachedPickupApprovalsByRouteNo(
    String routeNo,
  ) =>
      _approvalDao.getCachedPickupApprovalsByRouteNo(routeNo);

  Future<List<DomainApproval>> getPendingApprovals() =>
      _approvalDao.getPendingApprovals();

  Future<List<DomainApproval>> getPendingSpecimenDeliveries() =>
      _approvalDao.getPendingSpecimenDeliveries();

  Future<List<DomainApproval>> getPendingResultShipmentRouteApprovals() =>
      _approvalDao.getPendingResultShipmentRouteApprovals();

  Future<List<DomainApproval>> getPendingResultDeliveryApprovals() =>
      _approvalDao.getPendingResultDeliveryApprovals();

  Future<void> saveSpecimenDeliveryApproval(
    List<String> shipmentNos,
    DomainApproval deliveryApproval,
  ) =>
      _approvalDao.saveSpecimenDeliveryApproval(shipmentNos, deliveryApproval);

  Future<void> saveResultDeliveryApproval(
    String routeNo,
      String shipmentNo,
    DomainApproval approval,
  ) =>
      _approvalDao.saveResultDeliveryApproval(routeNo, shipmentNo, approval);

  // ==================== RESULT PICKUP OPERATIONS ====================

  /// Cache result shipment_pickup (route, shipment, approval)
  Future<void> cacheResultPickup(
    DomainShipmentRoute route,
    DomainShipment shipment,
    DomainApproval approval,
  ) async {
    developer.log(
      'Caching result shipment_pickup: route=${route.routeNo}',
      name: 'NIMSLocalService:cacheResultPickup',
    );
    final db = await NIMSDatabase().instance;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.insert(Tables.routes, route.toJson());
      batch.insert(Tables.shipments, shipment.toJson());
      batch.insert(Tables.approvals, approval.toJson());
      await batch.commit(noResult: true);
    });
  }

  // ==================== RESULT OPERATIONS ====================

  Future<void> cacheResultsForFacility(
    String facilityId,
    List<DomainResultModel> results,
  ) =>
      _resultDao.cacheResultsForFacility(facilityId, results);

  Future<List<DomainResultModel>> getCachedResultsForFacility(
    String facilityId,
  ) =>
      _resultDao.getCachedResultsForFacility(facilityId);

  Future<void> updateResultRejection(
    String sampleCode,
    bool isRejected,
    String? reason,
    String? rejectionDate,
    String? syncStatus,
  ) =>
      _resultDao.updateResultRejection(
        sampleCode,
        isRejected,
        reason,
        rejectionDate,
        syncStatus,
      );

  Future<void> updateResultPicked(
    String sampleCode,
    bool isPicked,
    String? routeNo,
  ) =>
      _resultDao.updateResultPicked(sampleCode, isPicked, routeNo);

  Future<List<DomainResultModel>> getPendingRejections() =>
      _resultDao.getPendingRejections();

  Future<List<DomainResultModel>> getPickedResultsForRoute(String routeNo) =>
      _resultDao.getPickedResultsForRoute(routeNo);

  Future<void> deleteResult(String sampleCode) =>
      _resultDao.deleteResult(sampleCode);

  Future<void> deletePickedResults(String routeNo) =>
      _resultDao.deletePickedResults(routeNo);

  Future<DomainResultModel?> getResultBySampleCode(String sampleCode) =>
      _resultDao.getResultBySampleCode(sampleCode);

  Future<List<DomainResultModel>> getResultsBySampleCodes(
    List<String> sampleCodes,
  ) =>
      _resultDao.getResultsBySampleCodes(sampleCodes);

  Future<void> markResultsAsPickedForRoute(
    List<String> sampleCodes,
    String routeNo,
  ) =>
      _resultDao.markResultsAsPickedForRoute(sampleCodes, routeNo);

  // ==================== SYNC-RELATED UTILITY METHODS ====================

  /// Update sync status for a record in any table
  Future<void> updateSyncStatus(
    String table,
    String idColumn,
    String idValue,
    String status,
  ) async {
    developer.log(
      'Updating sync status: $table.$idColumn=$idValue to $status',
      name: 'NIMSLocalService:updateSyncStatus',
    );
    final db = await NIMSDatabase().instance;
    await db.update(
      table,
      {Columns.syncStatus: status},
      where: '$idColumn = ?',
      whereArgs: [idValue],
    );
  }

  /// Update stage for a specific table and record
  Future<void> updateStage(
    String table,
    String idColumn,
    String idValue,
    String stage,
  ) async {
    developer.log(
      'Updating stage: $table.$idColumn=$idValue to $stage',
      name: 'NIMSLocalService:updateStage',
    );
    final db = await NIMSDatabase().instance;
    await db.update(
      table,
      {Columns.stage: stage},
      where: '$idColumn = ?',
      whereArgs: [idValue],
    );
  }

  /// Get total count of pending records across all tables
  Future<int> getTotalPendingCount() async {
    developer.log(
      'Getting total pending count',
      name: 'NIMSLocalService:getTotalPendingCount',
    );
    final db = await NIMSDatabase().instance;

    int totalCount = 0;

    // Count pending manifests
    final manifestsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM ${Tables.manifests} "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.pending}' "
      "OR ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    totalCount += Sqflite.firstIntValue(manifestsResult) ?? 0;

    // Count pending routes
    final routesResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM ${Tables.routes} "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.pending}' "
      "OR ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    totalCount += Sqflite.firstIntValue(routesResult) ?? 0;

    // Count pending approvals
    final approvalsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM ${Tables.approvals} "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.pending}' "
      "OR ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    totalCount += Sqflite.firstIntValue(approvalsResult) ?? 0;

    developer.log(
      'Total pending count: $totalCount',
      name: 'NIMSLocalService:getTotalPendingCount',
    );
    return totalCount;
  }

  /// Get count of records with 'failed' sync status across all tables
  Future<int> getFailedSyncCount() async {
    developer.log(
      'Getting failed sync count',
      name: 'NIMSLocalService:getFailedSyncCount',
    );
    final db = await NIMSDatabase().instance;

    int totalCount = 0;

    // Count failed manifests
    final manifestsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM ${Tables.manifests} "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    totalCount += Sqflite.firstIntValue(manifestsResult) ?? 0;

    // Count failed routes
    final routesResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM ${Tables.routes} "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    totalCount += Sqflite.firstIntValue(routesResult) ?? 0;

    // Count failed approvals
    final approvalsResult = await db.rawQuery(
      "SELECT COUNT(*) as count FROM ${Tables.approvals} "
      "WHERE ${Columns.syncStatus} = '${SyncStatus.failed}'",
    );
    totalCount += Sqflite.firstIntValue(approvalsResult) ?? 0;

    developer.log(
      'Total failed count: $totalCount',
      name: 'NIMSLocalService:getFailedSyncCount',
    );
    return totalCount;
  }
}
