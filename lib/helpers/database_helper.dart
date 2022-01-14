import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// import all table model
import 'package:food_expiry_tracker/models/food_model.dart';

import '../ui/core/app_config.dart';

class DatabaseHelper {
  static const _databaseName = '${AppConfig.app_name}.db';
  static const _databaseVersion = 1;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path,_databaseName);
    return await openDatabase(dbPath, version: _databaseVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${Food.tblFood}(
        ${Food.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Food.colFoodName} TEXT NOT NULL,
        ${Food.colPurchaseDate} TEXT NOT NULL,
        ${Food.colExpiredDate} TEXT NOT NULL,
        ${Food.colPriority} INT NOT NULL,
        ${Food.colSpaceId} INT NOT NULL,
        ${Food.colCategoryId} INT NOT NULL,
      )
    ''');
  }
}