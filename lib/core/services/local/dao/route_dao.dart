import '../../../domain/mappers/typedefs.dart';
import '../database/tables.dart';
import 'base_dao.dart';

/// Data Access Object for route operations.
///
/// Handles operations for:
/// - routes table
class RouteDao extends BaseDao {
  @override
  String get logName => 'RouteDao';

  /// Gets a route by route number
  Future<DomainShipmentRoute?> getCachedRouteByRouteNo(String routeNo) async {
    log('routeNo: $routeNo', method: 'getCachedRouteByRouteNo');
    final result = await getByUniqueId(Tables.routes, Columns.routeNo, routeNo);
    log('route: $result', method: 'getCachedRouteByRouteNo');
    if (result != null) {
      return DomainShipmentRoute.fromJson(result);
    }
    return null;
  }

  /// Gets routes matching a search query
  Future<List<DomainShipmentRoute>> getCachedShipmentRoutesBySearchQuery(
    String query,
  ) async {
    log('query: $query', method: 'getCachedShipmentRoutesBySearchQuery');
    final database = await db;
    final result = await database.query(
      Tables.routes,
      where: '''
        (${Columns.routeNo}
         || ${Columns.originFacilityName}
         || ${Columns.destinationFacilityName}) LIKE ?
      ''',
      whereArgs: ['%$query%'],
      orderBy: '${Columns.createdAt} DESC',
    );
    log('manifestsCC: $result', method: 'getCachedShipmentRoutesBySearchQuery');
    return result.map((r) => DomainShipmentRoute.fromJson(r)).toList();
  }

  /// Gets all cached routes
  Future<List<DomainShipmentRoute>> getAllCachedRoutes() async {
    log('Getting all cached routes', method: 'getAllCachedRoutes');
    final result = await queryAll(
      Tables.routes,
      orderBy: '${Columns.createdAt} DESC',
    );
    return result.map((r) => DomainShipmentRoute.fromJson(r)).toList();
  }

  /// Gets pending routes (for sync)
  Future<List<DomainShipmentRoute>> getPendingRoutes() async {
    log('Getting pending routes', method: 'getPendingRoutes');
    final result = await getPendingRecords(
      Tables.routes,
      orderBy: '${Columns.createdAt} ASC',
    );
    log('pending routes: $result', method: 'getPendingRoutes');
    return result.map((r) => DomainShipmentRoute.fromJson(r)).toList();
  }

  /// Updates route stage to In-Transit
  Future<void> updateRouteStageToInTransit(String routeNo) async {
    log(
      'Updating route $routeNo stage to In-Transit',
      method: 'updateRouteStageToInTransit',
    );
    await updateStage(Tables.routes, Columns.routeNo, routeNo, Stage.inTransit);
  }

  /// Updates route stage to Delivered
  Future<void> updateRouteStageToDelivered(String routeNo) async {
    log(
      'Updating route $routeNo stage to Delivered',
      method: 'updateRouteStageToDelivered',
    );
    await updateStage(Tables.routes, Columns.routeNo, routeNo, Stage.delivered);
  }

  /// Inserts a new route
  Future<void> insertRoute(DomainShipmentRoute route) async {
    log('Inserting route: ${route.routeNo}', method: 'insertRoute');
    final database = await db;
    await database.insert(Tables.routes, route.toJson());
  }
}
