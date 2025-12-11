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
      version: 1,
      onCreate: (db, version) async {
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
            created TEXT
          )
        ''');

      },
    );
  }
}
