import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NIMSDatabase {
  static Database? _db;

  Future<Database> get instance async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'nims.db');
    return await openDatabase(
      path,
      version: 11,
      onCreate: (db, version) async {

        // Tables
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT UNIQUE,
            guid TEXT,
            role_code TEXT,
            role TEXT,
            title TEXT,
            first_name TEXT,
            middle_name TEXT,
            last_name TEXT,
            is_active INTEGER,
            is_deleted INTEGER,
            priority INTEGER,
            geo_privileges TEXT,
            lsp_privileges TEXT,
            device_serial_no TEXT
          )
        ''');

        await db.execute('''
        CREATE TABLE platforms (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id TEXT,
          name TEXT,
          FOREIGN KEY (user_id) REFERENCES users(user_id)
        )
        ''');

        await db.execute('''
        CREATE TABLE system_privileges (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id TEXT,
          name TEXT,
          FOREIGN KEY (user_id) REFERENCES users(user_id)
          )
        ''');

        await db.execute('''
        CREATE TABLE privileges (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          system_privilege_id INTEGER,
          rider INTEGER,
          FOREIGN KEY (system_privilege_id) REFERENCES system_privileges(id)
          )
        ''');

        await db.execute('''
        CREATE TABLE lsps (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id TEXT,
          pick TEXT,
          lsp_id INTEGER,
          lsp_code TEXT,
          full_name TEXT,
          guid TEXT,
          display TEXT,
          FOREIGN KEY (user_id) REFERENCES users(user_id)
          )
        ''');

        await db.execute('''
         CREATE TABLE facilities (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          facility_id INTEGER,
          facility_code TEXT,
          lab_code TEXT,
          facility_name TEXT,
          geo_string TEXT,
          type TEXT
          )
        ''');

        await db.execute('''
         CREATE TABLE sample_types (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          sample_id INTEGER,
          pick TEXT,
          full_name TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE locations (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            location_id INTEGER,
            pick TEXT,
            location TEXT,
            created TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE movement_types (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            pick TEXT,
            type_id INTEGER,
            movement TEXT,
            origin TEXT,
            destination_primary TEXT,
            destination_secondary TEXT,
            created TEXT,
            category TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE etoken_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            etoken_id TEXT,
            serial_no TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE manifests (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            manifest_no TEXT NOT NULL UNIQUE,
            origin_id TEXT NOT NULL,
            destination_id TEXT NOT NULL,
            sample_type TEXT NOT NULL,
            sample_count INTEGER NOT NULL,
            phlebotomy_no TEXT NOT NULL,
            lsp_code TEXT NOT NULL,
            temperature INTEGER,
            user_id TEXT NOT NULL,
            originating_facility_name TEXT NOT NULL,
            destination_facility_name TEXT NOT NULL,
            created_at TEXT DEFAULT CURRENT_TIMESTAMP,
            sync_status TEXT NOT NULL DEFAULT 'pending',
            stage TEXT NOT NULL DEFAULT 'Pending'
          )
        ''');

        await db.execute('''
          CREATE TABLE samples (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            manifest_no TEXT NOT NULL,
            sample_code TEXT NOT NULL UNIQUE,
            patient_code TEXT NOT NULL,
            age TEXT NOT NULL,
            gender TEXT NOT NULL,
            comment TEXT,
            created_at TEXT DEFAULT CURRENT_TIMESTAMP,
            sync_status TEXT NOT NULL DEFAULT 'pending',
            stage TEXT NOT NULL DEFAULT 'Order',
            FOREIGN KEY (manifest_no) REFERENCES manifests(manifest_no) ON DELETE CASCADE
          )
          ''');

        await db.execute('''
          CREATE TABLE routes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            route_no TEXT NOT NULL UNIQUE,
            route_type TEXT NOT NULL,
            origin_facility_id TEXT NOT NULL,
            origin_facility_name TEXT NOT NULL,
            destination_facility_id TEXT NOT NULL,
            destination_facility_name TEXT NOT NULL,
            lsp_code TEXT NOT NULL,
            rider_user_id TEXT NOT NULL,
            latitude DECIMAL(10,6),
            longitude DECIMAL(10,6),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            sync_status TEXT NOT NULL DEFAULT 'pending',
            stage TEXT NOT NULL DEFAULT 'Pending'
          )
          ''');

        await db.execute('''
          CREATE TABLE shipments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            shipment_no TEXT NOT NULL UNIQUE,
            route_no TEXT NOT NULL,
            manifest_no TEXT NOT NULL,
            origin_type TEXT NOT NULL,
            origin_facility_name TEXT NOT NULL DEFAULT '',
            destination_location_type TEXT NOT NULL,
            destination_facility_id TEXT NOT NULL,
            destination_facility_name TEXT NOT NULL,
            pickup_latitude DECIMAL(10,6) NOT NULL,
            pickup_longitude DECIMAL(10,6) NOT NULL,
            sample_type TEXT NOT NULL,
            sample_count INT NOT NULL,
            payload_type TEXT NOT NULL DEFAULT 'specimen',
            pickup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            delivery_date TEXT,
            sync_status TEXT NOT NULL DEFAULT 'pending',
            stage TEXT NOT NULL DEFAULT 'Pending',
            FOREIGN KEY (route_no) REFERENCES routes(route_no)
                ON DELETE CASCADE
                ON UPDATE CASCADE
        )
          ''');

        await db.execute('''
          CREATE TABLE approvals (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            approval_no TEXT NOT NULL UNIQUE,
            route_no TEXT NOT NULL,
            approval_type TEXT,
            full_name TEXT,
            phone TEXT,
            designation TEXT,
            signature TEXT,
            latitude DECIMAL(10,6),
            longitude DECIMAL(10,6),
            approval_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            sync_status TEXT NOT NULL DEFAULT 'pending',
            destination_location_type TEXT,
            FOREIGN KEY (route_no) REFERENCES routes(route_no)
                ON DELETE CASCADE
                ON UPDATE CASCADE
        )
        ''');

        await db.execute('''
          CREATE TABLE results (
            sample_code TEXT PRIMARY KEY,
            manifest_no TEXT NOT NULL,
            patient_code TEXT NOT NULL,
            age TEXT NOT NULL,
            gender TEXT NOT NULL,
            facility_id TEXT NOT NULL,
            is_picked INTEGER DEFAULT 0,
            is_rejected INTEGER DEFAULT 0,
            rejection_sync_status TEXT,
            rejection_reason TEXT,
            rejection_date TEXT,
            route_no TEXT
          )
        ''');

        // Indexes
        await db.execute('''
          CREATE INDEX idx_facilities_type ON facilities(type)
          ''');

        await db.execute('''
          CREATE INDEX idx_manifests_origin_id ON manifests(origin_id)
          ''');

        await db.execute('''
          CREATE INDEX idx_samples_manifest_no ON samples(manifest_no)
          ''');

        await db.execute('''
          CREATE INDEX idx_shipments_route_no ON shipments(route_no)
          ''');

        await db.execute('''
          CREATE INDEX idx_approvals_route_no ON approvals(route_no)
          ''');

        await db.execute('''
          CREATE INDEX idx_results_facility_id ON results(facility_id)
          ''');

        await db.execute('''
          CREATE INDEX idx_results_manifest_no ON results(manifest_no)
          ''');

        await db.execute('''
          CREATE INDEX idx_results_route_no ON results(route_no)
          ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Add shipment_status column to shipments table
          await db.execute('''
            ALTER TABLE shipments ADD COLUMN shipment_status TEXT NOT NULL DEFAULT 'in-transit'
          ''');
        }
        if (oldVersion < 3) {
          // Add sync_status column to manifests, samples, routes, shipments, and approvals tables
          await db.execute('''
            ALTER TABLE manifests ADD COLUMN sync_status TEXT NOT NULL DEFAULT 'pending'
          ''');
          await db.execute('''
            ALTER TABLE samples ADD COLUMN sync_status TEXT NOT NULL DEFAULT 'pending'
          ''');
          await db.execute('''
            ALTER TABLE routes ADD COLUMN sync_status TEXT NOT NULL DEFAULT 'pending'
          ''');
          await db.execute('''
            ALTER TABLE shipments ADD COLUMN sync_status TEXT NOT NULL DEFAULT 'pending'
          ''');
          await db.execute('''
            ALTER TABLE approvals ADD COLUMN sync_status TEXT NOT NULL DEFAULT 'pending'
          ''');
        }
        if (oldVersion < 4) {
          // Add origin_facility_name column to shipments table
          await db.execute('''
            ALTER TABLE shipments ADD COLUMN origin_facility_name TEXT NOT NULL DEFAULT ''
          ''');
        }
        if (oldVersion < 5) {
          // Add delivery_date column to shipments table
          await db.execute('''
            ALTER TABLE shipments ADD COLUMN delivery_date TEXT
          ''');
        }
        if (oldVersion < 6) {
          // Add latitude and longitude columns to approvals table
          await db.execute('''
            ALTER TABLE approvals ADD COLUMN latitude DECIMAL(10,6)
          ''');
          await db.execute('''
            ALTER TABLE approvals ADD COLUMN longitude DECIMAL(10,6)
          ''');
        }
        if (oldVersion < 7) {
          // Add results table for caching available results
          await db.execute('''
            CREATE TABLE results (
              sample_code TEXT PRIMARY KEY,
              manifest_no TEXT NOT NULL,
              patient_code TEXT NOT NULL,
              age TEXT NOT NULL,
              gender TEXT NOT NULL,
              facility_id TEXT NOT NULL,
              is_picked INTEGER DEFAULT 0,
              is_rejected INTEGER DEFAULT 0,
              rejection_sync_status TEXT,
              rejection_reason TEXT,
              rejection_date TEXT,
              route_no TEXT
            )
          ''');
          await db.execute('''
            CREATE INDEX idx_results_facility_id ON results(facility_id)
          ''');
          await db.execute('''
            CREATE INDEX idx_results_manifest_no ON results(manifest_no)
          ''');
          await db.execute('''
            CREATE INDEX idx_results_route_no ON results(route_no)
          ''');
        }
        if (oldVersion < 8) {
          // Add payload_type column to shipments table
          await db.execute('''
            ALTER TABLE shipments ADD COLUMN payload_type TEXT NOT NULL DEFAULT 'specimen'
          ''');
        }
        if (oldVersion < 9) {
          // Add stage column to manifests, samples, routes, and shipments tables
          await db.execute('''
            ALTER TABLE manifests ADD COLUMN stage TEXT NOT NULL DEFAULT 'Pending'
          ''');
          await db.execute('''
            ALTER TABLE samples ADD COLUMN stage TEXT NOT NULL DEFAULT 'Order'
          ''');
          await db.execute('''
            ALTER TABLE routes ADD COLUMN stage TEXT NOT NULL DEFAULT 'Pending'
          ''');
          await db.execute('''
            ALTER TABLE shipments ADD COLUMN stage TEXT NOT NULL DEFAULT 'Pending'
          ''');
        }
        if (oldVersion < 10) {
          // Remove shipment_status column from shipments table (replaced by stage)
          await db.execute('''
            ALTER TABLE shipments DROP COLUMN shipment_status
          ''');
        }
        if (oldVersion < 11) {
          // Add destination_location_type column to approvals table
          await db.execute('''
            ALTER TABLE approvals ADD COLUMN destination_location_type TEXT
          ''');
        }
      },
    );
  }
}
