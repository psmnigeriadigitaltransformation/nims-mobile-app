import '../../../domain/mappers/typedefs.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for shipment operations.
///
/// Handles operations for:
/// - shipments table
class ShipmentDao extends BaseDao {
  @override
  String get logName => 'ShipmentDao';

  /// Caches a shipment route with its shipments and approval
  /// This is a composite operation that creates route, shipments, and approval
  Future<void> cacheShipmentRoute(
    DomainShipmentRoute route,
    List<DomainShipment> shipments,
    DomainApproval approval,
  ) async {
    log('specimen route: $route', method: 'cacheShipmentRoute');
    log('shipments: $shipments', method: 'cacheShipmentRoute');
    log('approval: $approval', method: 'cacheShipmentRoute');
    final database = await db;
    await database.transaction((txn) async {
      final batch = txn.batch();
      batch.insert(Tables.routes, route.toJson());
      for (final shipment in shipments) {
        batch.insert(Tables.shipments, shipment.toJson());
      }
      batch.insert(Tables.approvals, approval.toJson());
      await batch.commit(noResult: true);
    });
  }

  /// Gets shipments by route number
  Future<List<DomainShipment>> getCachedShipmentsByRouteNo(String routeNo) async {
    log('routeNo: $routeNo', method: 'getCachedShipmentsByRouteNo');
    final result = await queryAll(
      Tables.shipments,
      where: '${Columns.routeNo} = ?',
      whereArgs: [routeNo],
    );
    log('shipments: $result', method: 'getCachedShipmentsByRouteNo');
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Gets a single shipment by route number
  Future<DomainShipment?> getCachedShipmentByRouteNo(String routeNo) async {
    log('routeNo: $routeNo', method: 'getCachedShipmentByRouteNo');
    final database = await db;
    final result = await database.query(
      Tables.shipments,
      where: '${Columns.routeNo} = ?',
      whereArgs: [routeNo],
      limit: 1,
    );
    log('shipment: $result', method: 'getCachedShipmentByRouteNo');
    if (result.isEmpty) return null;
    return DomainShipment.fromJson(result.first);
  }

  /// Gets shipments matching a search query
  Future<List<DomainShipment>> getCachedShipmentsBySearchQuery(
    String query,
  ) async {
    log('query: $query', method: 'getCachedShipmentsBySearchQuery');
    final database = await db;
    final result = await database.query(
      Tables.shipments,
      where: '${Columns.shipmentNo} LIKE ? '
          'OR ${Columns.routeNo} LIKE ? '
          'OR ${Columns.manifestNo} LIKE ? '
          'OR ${Columns.destinationLocationType} LIKE ? '
          'OR ${Columns.destinationFacilityName} LIKE ? '
          'OR ${Columns.sampleType} LIKE ?',
      whereArgs: [
        '%$query%',
        '%$query%',
        '%$query%',
        '%$query%',
        '%$query%',
        '%$query%',
      ],
      orderBy: '${Columns.pickupDate} DESC',
    );
    log('shipments: $result', method: 'getCachedShipmentsBySearchQuery');
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Gets all cached shipments
  Future<List<DomainShipment>> getAllCachedShipments() async {
    log('Getting all cached shipments', method: 'getAllCachedShipments');
    final result = await queryAll(
      Tables.shipments,
      orderBy: '${Columns.pickupDate} DESC',
    );
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Gets delivered shipments by route number
  Future<List<DomainShipment>> getDeliveredShipmentsByRouteNo(
    String routeNo,
  ) async {
    log('routeNo: $routeNo', method: 'getDeliveredShipmentsByRouteNo');
    final database = await db;
    final result = await database.query(
      Tables.shipments,
      where: '${Columns.routeNo} = ? AND ${Columns.stage} = ?',
      whereArgs: [routeNo, Stage.delivered],
    );
    log('delivered shipments: $result', method: 'getDeliveredShipmentsByRouteNo');
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Gets pending shipments (for sync)
  Future<List<DomainShipment>> getPendingShipments() async {
    log('Getting pending shipments', method: 'getPendingShipments');
    final result = await getPendingRecords(Tables.shipments);
    return result.map((s) => DomainShipment.fromJson(s)).toList();
  }

  /// Returns a map of manifest_no to stage for all manifests in shipments
  /// Note: Result shipments have null manifest_no and are excluded from this map
  Future<Map<String, String>> getShippedManifestStatuses() async {
    log('Getting shipped manifest statuses', method: 'getShippedManifestStatuses');
    final database = await db;
    final result = await database.query(
      Tables.shipments,
      columns: [Columns.manifestNo, Columns.stage],
      where: '${Columns.manifestNo} IS NOT NULL',
    );
    log('shippedManifests: $result', method: 'getShippedManifestStatuses');
    final Map<String, String> statusMap = {};
    for (final row in result) {
      final manifestNo = row[Columns.manifestNo] as String?;
      if (manifestNo != null) {
        statusMap[manifestNo] = row[Columns.stage] as String;
      }
    }
    return statusMap;
  }

  /// Updates shipment stage
  Future<void> updateShipmentStage(String shipmentNo, String stage) async {
    log(
      'Updating shipment $shipmentNo stage to $stage',
      method: 'updateShipmentStage',
    );
    await updateStage(Tables.shipments, Columns.shipmentNo, shipmentNo, stage);
  }

  /// Updates shipment stage to In-Transit and cascades to related manifest and samples
  Future<void> updateShipmentStageToInTransit(
    String shipmentNo,
    String manifestNo,
  ) async {
    log(
      'Updating shipment $shipmentNo stage to In-Transit, '
      'cascading to manifest $manifestNo and its samples',
      method: 'updateShipmentStageToInTransit',
    );
    final database = await db;
    await database.transaction((txn) async {
      // Update shipment stage
      await txn.update(
        Tables.shipments,
        {Columns.stage: Stage.inTransit},
        where: '${Columns.shipmentNo} = ?',
        whereArgs: [shipmentNo],
      );
      // Update manifest stage
      await txn.update(
        Tables.manifests,
        {Columns.stage: Stage.inTransit},
        where: '${Columns.manifestNo} = ?',
        whereArgs: [manifestNo],
      );
      // Update all samples for this manifest
      await txn.update(
        Tables.samples,
        {Columns.stage: Stage.inTransit},
        where: '${Columns.manifestNo} = ?',
        whereArgs: [manifestNo],
      );
    });
    log('Successfully updated stages to In-Transit', method: 'updateShipmentStageToInTransit');
  }

  /// Updates shipment delivery date
  Future<void> updateShipmentDeliveryDate(
    String shipmentNo,
    String deliveryDate,
  ) async {
    log(
      'Updating specimen $shipmentNo delivery_date to $deliveryDate',
      method: 'updateShipmentDeliveryDate',
    );
    await updateByUniqueId(
      Tables.shipments,
      Columns.shipmentNo,
      shipmentNo,
      {Columns.deliveryDate: deliveryDate},
    );
  }

  /// Inserts a new shipment
  Future<void> insertShipment(DomainShipment shipment) async {
    log('Inserting shipment: ${shipment.shipmentNo}', method: 'insertShipment');
    final database = await db;
    await database.insert(Tables.shipments, shipment.toJson());
  }
}
