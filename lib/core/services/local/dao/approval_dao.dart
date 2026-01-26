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
      // Update shipment stage to 'Delivered' for each shipment
      for (final shipmentNo in shipmentNos) {
        await txn.update(
          Tables.shipments,
          {Columns.stage: Stage.delivered},
          where: '${Columns.shipmentNo} = ?',
          whereArgs: [shipmentNo],
        );
      }
      // Save the delivery approval
      await txn.insert(Tables.approvals, deliveryApproval.toJson());
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
    });
  }

  /// Inserts a new approval
  Future<void> insertApproval(DomainApproval approval) async {
    log('Inserting approval: ${approval.approvalNo}', method: 'insertApproval');
    final database = await db;
    await database.insert(Tables.approvals, approval.toJson());
  }
}
