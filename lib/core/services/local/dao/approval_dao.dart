import 'package:sqflite/sqflite.dart';

import '../../../domain/mappers/typedefs.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for approval operations.
///
/// Handles operations for:
/// - approvals table
class ApprovalDao extends BaseDao {
  @override
  String get logName => 'ApprovalDao';

  /// Gets approvals by route number
  Future<List<DomainApproval>> getCachedApprovalsByRouteNo(String routeNo) async {
    log('routeNo: $routeNo', method: 'getCachedApprovalsByRouteNo');
    final result = await queryAll(
      Tables.approvals,
      where: '${Columns.routeNo} = ?',
      whereArgs: [routeNo],
    );
    log('approvals: $result', method: 'getCachedApprovalsByRouteNo');
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Gets pickup approvals by route number (approval_type = 'specimen_pickup')
  Future<List<DomainApproval>> getCachedPickupApprovalsByRouteNo(
    String routeNo,
  ) async {
    log('routeNo: $routeNo', method: 'getCachedPickupApprovalsByRouteNo');
    final database = await db;
    final result = await database.query(
      Tables.approvals,
      where: '${Columns.routeNo} = ? AND ${Columns.approvalType} = ?',
      whereArgs: [routeNo, ApprovalType.specimenPickup],
    );
    log('pickup approvals: $result', method: 'getCachedPickupApprovalsByRouteNo');
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Gets pending approvals (for sync)
  Future<List<DomainApproval>> getPendingApprovals() async {
    log('Getting pending approvals', method: 'getPendingApprovals');
    final result = await getPendingRecords(Tables.approvals);
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Gets pending specimen deliveries
  Future<List<DomainApproval>> getPendingSpecimenDeliveries() async {
    log('Getting pending specimen deliveries', method: 'getPendingSpecimenDeliveries');
    final database = await db;
    final result = await database.query(
      Tables.approvals,
      where: '${Columns.approvalType} = ? AND '
          '(${Columns.syncStatus} = ? OR ${Columns.syncStatus} = ?)',
      whereArgs: [ApprovalType.specimenDelivery, SyncStatus.pending, SyncStatus.failed],
      orderBy: 'rowid ASC',
    );
    log('pending specimen deliveries: $result', method: 'getPendingSpecimenDeliveries');
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Gets pending result shipment route approvals
  Future<List<DomainApproval>> getPendingResultShipmentRouteApprovals() async {
    log('Getting pending result pickups', method: 'getPendingResultShipmentRouteApprovals');
    final database = await db;
    final result = await database.query(
      Tables.approvals,
      where: '${Columns.approvalType} = ? AND '
          '(${Columns.syncStatus} = ? OR ${Columns.syncStatus} = ?)',
      whereArgs: [ApprovalType.resultPickup, SyncStatus.pending, SyncStatus.failed],
      orderBy: 'rowid ASC',
    );
    log('pending result pickups: $result', method: 'getPendingResultShipmentRouteApprovals');
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Gets pending result delivery approvals
  Future<List<DomainApproval>> getPendingResultDeliveryApprovals() async {
    log('Getting pending result deliveries', method: 'getPendingResultDeliveryApprovals');
    final database = await db;
    final result = await database.query(
      Tables.approvals,
      where: '${Columns.approvalType} = ? AND '
          '(${Columns.syncStatus} = ? OR ${Columns.syncStatus} = ?)',
      whereArgs: [ApprovalType.resultDelivery, SyncStatus.pending, SyncStatus.failed],
      orderBy: 'rowid ASC',
    );
    log('pending result deliveries: $result', method: 'getPendingResultDeliveryApprovals');
    return result.map((a) => DomainApproval.fromJson(a)).toList();
  }

  /// Updates manifest and its samples stage to Delivered
  Future<void> _updateManifestAndSamplesStage(
    Transaction txn,
    String manifestNo,
    String originId,
  ) async {
    log(
      'Updating manifest $manifestNo (originId: $originId) and samples stage to Delivered',
      method: '_updateManifestAndSamplesStage',
    );
    // Update manifest stage using composite key
    await txn.update(
      Tables.manifests,
      {Columns.stage: Stage.delivered},
      where: '${Columns.manifestNo} = ? AND ${Columns.originId} = ?',
      whereArgs: [manifestNo, originId],
    );
    // Update all samples linked to manifest using composite key
    await txn.update(
      Tables.samples,
      {Columns.stage: Stage.delivered},
      where: '${Columns.manifestNo} = ? AND ${Columns.originId} = ?',
      whereArgs: [manifestNo, originId],
    );
  }

  /// Checks if all shipments for a route are delivered and updates route stage
  Future<void> _updateRouteIfAllShipmentsDelivered(
    Transaction txn,
    String routeNo,
  ) async {
    final totalResult = await txn.query(
      Tables.shipments,
      columns: ['COUNT(*) as count'],
      where: '${Columns.routeNo} = ?',
      whereArgs: [routeNo],
    );
    final total = Sqflite.firstIntValue(totalResult) ?? 0;

    final deliveredResult = await txn.query(
      Tables.shipments,
      columns: ['COUNT(*) as count'],
      where: '${Columns.routeNo} = ? AND ${Columns.stage} = ?',
      whereArgs: [routeNo, Stage.delivered],
    );
    final delivered = Sqflite.firstIntValue(deliveredResult) ?? 0;

    log(
      'Route $routeNo: $delivered/$total shipments delivered',
      method: '_updateRouteIfAllShipmentsDelivered',
    );

    if (total > 0 && delivered == total) {
      log(
        'All shipments delivered, updating route stage to Delivered',
        method: '_updateRouteIfAllShipmentsDelivered',
      );
      await txn.update(
        Tables.routes,
        {Columns.stage: Stage.delivered},
        where: '${Columns.routeNo} = ?',
        whereArgs: [routeNo],
      );
    }
  }

  /// Saves delivery approval and updates shipment stages
  Future<void> saveSpecimenDeliveryApproval(
    List<String> shipmentNos,
    DomainApproval deliveryApproval,
  ) async {
    log(
      'Saving specimen delivery approval for shipments: $shipmentNos',
      method: 'saveDeliveryApproval',
    );
    final database = await db;
    await database.transaction((txn) async {
      // Collect unique manifest composite keys (manifestNo, originId) from shipments being delivered
      final manifestKeys = <(String, String)>{};

      // Update shipment stage to 'Delivered' for each shipment
      for (final shipmentNo in shipmentNos) {
        // Get manifest_no and origin_id for this shipment
        final shipmentResult = await txn.query(
          Tables.shipments,
          columns: [Columns.manifestNo, Columns.originId],
          where: '${Columns.shipmentNo} = ?',
          whereArgs: [shipmentNo],
        );
        if (shipmentResult.isNotEmpty) {
          final manifestNo = shipmentResult.first[Columns.manifestNo] as String?;
          final originId = shipmentResult.first[Columns.originId] as String;
          // Only add to manifestKeys if manifestNo is not null (result shipments have null manifestNo)
          if (manifestNo != null) {
            manifestKeys.add((manifestNo, originId));
          }
        }

        await txn.update(
          Tables.shipments,
          {Columns.stage: Stage.delivered},
          where: '${Columns.shipmentNo} = ?',
          whereArgs: [shipmentNo],
        );
      }

      // Update manifest and samples stages for each unique manifest
      // (result shipments have null manifestNo and are excluded)
      for (final (manifestNo, originId) in manifestKeys) {
        await _updateManifestAndSamplesStage(txn, manifestNo, originId);
      }

      // Save the delivery approval
      await txn.insert(Tables.approvals, deliveryApproval.toJson());
      // Check if all shipments are delivered and update route stage
      await _updateRouteIfAllShipmentsDelivered(txn, deliveryApproval.routeNo);
    });
  }

  /// Saves result delivery approval
  Future<void> saveResultDeliveryApproval(
    String routeNo,
    String shipmentNo,
    DomainApproval approval,
  ) async {
    log(
      'Saving result delivery approval for route: $routeNo, shipment: $shipmentNo',
      method: 'saveResultDeliveryApproval',
    );
    final database = await db;
    await database.transaction((txn) async {
      // Update shipment stage to 'Delivered' for shipment
      await txn.update(
        Tables.shipments,
        {Columns.stage: Stage.delivered},
        where: '${Columns.shipmentNo} = ?',
        whereArgs: [shipmentNo],
      );
      // Save the delivery approval
      await txn.insert(Tables.approvals, approval.toJson());
      // Check if all shipments are delivered and update route stage
      await _updateRouteIfAllShipmentsDelivered(txn, routeNo);
    });
  }

  /// Inserts a new approval
  Future<void> insertApproval(DomainApproval approval) async {
    log('Inserting approval: ${approval.approvalNo}', method: 'insertApproval');
    final database = await db;
    await database.insert(Tables.approvals, approval.toJson());
  }
}
