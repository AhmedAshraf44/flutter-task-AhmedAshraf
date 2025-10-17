import 'dart:developer';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await openDatabase(
      'AppData.db',
      version: 4,
      onCreate: (db, version) async {
        log("Creating tables...");
        await _createTables(db);
        log("✅ Database & Tables created successfully");
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        log("⚙️ Upgrading database from $oldVersion to $newVersion");
        await db.execute('DROP TABLE IF EXISTS filter_options');
        await db.execute('DROP TABLE IF EXISTS Category');
        await db.execute('DROP TABLE IF EXISTS Selection');
        await db.execute('DROP TABLE IF EXISTS Products');
        await db.execute('DROP TABLE IF EXISTS packages');
        await db.execute('DROP TABLE IF EXISTS package_features');
        await _createTables(db);
      },
    );
    return _db!;
  }

  static Future<void> _createTables(Database db) async {
    final batch = db.batch();
    log("database created");
    batch.execute(
      'CREATE TABLE Category (id INTEGER PRIMARY KEY AUTOINCREMENT, tittle TEXT)',
    );
    batch.execute(
      'CREATE TABLE Selection (id INTEGER PRIMARY KEY AUTOINCREMENT, tittle TEXT, image TEXT)',
    );
    batch.execute('''
            CREATE TABLE Products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            image TEXT,
            price TEXT,
            oldPrice TEXT,
            sales TEXT,
            isFavorite INTEGER
            )
            ''');

    // //- two screen -------------------------------------
    batch.execute('''
        CREATE TABLE packages (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          price REAL,
          numberOfViews TEXT,
          bestValue TEXT,
          isSelected INTEGER,
          isBestValue INTEGER,
          isSelectednumberOfViews INTEGER
        )
      ''');

    batch.execute('''
        CREATE TABLE package_features (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          packageId INTEGER,
          title TEXT,
          image TEXT,
          stickyDurationHours TEXT,
          FOREIGN KEY (packageId) REFERENCES packages(id) ON DELETE CASCADE
        )
      ''');

    //- three screen-------------------------------------------
    batch.execute('''
            CREATE TABLE filter_options (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            filter_values TEXT NOT NULL,      
            selectedValue TEXT
            )''');
    try {
      await batch.commit();
      log("✅ Tables created successfully");
    } catch (error) {
      log("❌ Error When Creating Tables: ${error.toString()}");
    }
  }
}
