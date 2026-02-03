/// Constants for database table names
class Tables {
  Tables._();

  static const users = 'users';
  static const platforms = 'platforms';
  static const systemPrivileges = 'system_privileges';
  static const privileges = 'privileges';
  static const lsps = 'lsps';
  static const facilities = 'facilities';
  static const sampleTypes = 'sample_types';
  static const locations = 'locations';
  static const movementTypes = 'movement_types';
  static const etokenData = 'etoken_data';
  static const manifests = 'manifests';
  static const samples = 'samples';
  static const routes = 'routes';
  static const shipments = 'shipments';
  static const approvals = 'approvals';
  static const results = 'results';
  static const rejectionReasons = 'rejection_reasons';
}

/// Constants for common column names used across multiple tables
class Columns {
  Columns._();

  // Common columns
  static const id = 'id';
  static const syncStatus = 'sync_status';
  static const stage = 'stage';
  static const createdAt = 'created_at';

  // User-related columns
  static const userId = 'user_id';
  static const guid = 'guid';
  static const roleCode = 'role_code';
  static const role = 'role';
  static const title = 'title';
  static const firstName = 'first_name';
  static const middleName = 'middle_name';
  static const lastName = 'last_name';
  static const isActive = 'is_active';
  static const isDeleted = 'is_deleted';
  static const priority = 'priority';
  static const geoPrivileges = 'geo_privileges';
  static const lspPrivileges = 'lsp_privileges';
  static const deviceSerialNo = 'device_serial_no';

  // Platform columns
  static const name = 'name';

  // Privilege columns
  static const systemPrivilegeId = 'system_privilege_id';
  static const rider = 'rider';

  // LSP columns
  static const pick = 'pick';
  static const lspId = 'lsp_id';
  static const lspCode = 'lsp_code';
  static const fullName = 'full_name';
  static const display = 'display';

  // Facility columns
  static const facilityId = 'facility_id';
  static const facilityCode = 'facility_code';
  static const labCode = 'lab_code';
  static const facilityName = 'facility_name';
  static const geoString = 'geo_string';
  static const type = 'type';

  // Sample type columns
  static const sampleId = 'sample_id';

  // Location columns
  static const locationId = 'location_id';
  static const location = 'location';
  static const created = 'created';

  // Movement type columns
  static const typeId = 'type_id';
  static const movement = 'movement';
  static const origin = 'origin';
  static const destinationPrimary = 'destination_primary';
  static const destinationSecondary = 'destination_secondary';
  static const category = 'category';

  // EToken columns
  static const etokenId = 'etoken_id';
  static const serialNo = 'serial_no';

  // Manifest columns
  static const manifestNo = 'manifest_no';
  static const originId = 'origin_id';
  static const destinationId = 'destination_id';
  static const sampleType = 'sample_type';
  static const sampleCount = 'sample_count';
  static const phlebotomyNo = 'phlebotomy_no';
  static const temperature = 'temperature';
  static const originatingFacilityName = 'originating_facility_name';
  static const destinationFacilityName = 'destination_facility_name';

  // Sample columns
  static const sampleCode = 'sample_code';
  static const patientCode = 'patient_code';
  static const age = 'age';
  static const gender = 'gender';
  static const comment = 'comment';

  // Route columns
  static const routeNo = 'route_no';
  static const routeType = 'route_type';
  static const originFacilityId = 'origin_facility_id';
  static const originFacilityName = 'origin_facility_name';
  static const destinationFacilityId = 'destination_facility_id';
  static const riderUserId = 'rider_user_id';
  static const latitude = 'latitude';
  static const longitude = 'longitude';

  // Shipment columns
  static const shipmentNo = 'shipment_no';
  static const originType = 'origin_type';
  static const destinationLocationType = 'destination_location_type';
  static const pickupLatitude = 'pickup_latitude';
  static const pickupLongitude = 'pickup_longitude';
  static const payloadType = 'payload_type';
  static const pickupDate = 'pickup_date';
  static const deliveryDate = 'delivery_date';

  // Approval columns
  static const approvalNo = 'approval_no';
  static const approvalType = 'approval_type';
  static const phone = 'phone';
  static const designation = 'designation';
  static const signature = 'signature';
  static const approvalDate = 'approval_date';

  // Result columns
  static const isPicked = 'is_picked';
  static const isRejected = 'is_rejected';
  static const rejectionSyncStatus = 'rejection_sync_status';
  static const rejectionReason = 'rejection_reason';
  static const rejectionDate = 'rejection_date';
}

/// Constants for sync status values
class SyncStatus {
  SyncStatus._();

  static const pending = 'pending';
  static const synced = 'synced';
  static const failed = 'failed';
}

/// Constants for stage values
class Stage {
  Stage._();

  static const pending = 'Pending';
  static const inTransit = 'In-Transit';
  static const delivered = 'Delivered';
  static const order = 'Order';
}

/// Constants for approval types
class ApprovalType {
  ApprovalType._();

  static const specimenPickup = 'specimen_pickup';
  static const specimenDelivery = 'specimen_delivery';
  static const resultPickup = 'result_pickup';
  static const resultDelivery = 'result_delivery';
}

/// Constants for payload types
class PayloadType {
  PayloadType._();

  static const specimen = 'specimen';
  static const result = 'result';
}
