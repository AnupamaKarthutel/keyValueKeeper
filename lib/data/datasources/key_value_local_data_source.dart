import 'package:sqflite/sqflite.dart' as sql;
import 'package:path_provider/path_provider.dart';
import 'package:keyvalue_keeper/data/models/key_value_model.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class KeyValueLocalDataSource {
  static const String _dbName = 'key_value.db';
  static const String _tableName = 'key_value';

  Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, _dbName),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $_tableName(key TEXT PRIMARY KEY,value TEXT)');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertKeyValue(KeyValueModel keyValue) async {
    final db = await _getDatabase();
    await db.insert(_tableName, keyValue.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<KeyValueModel>> getKeyValues() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return KeyValueModel.fromJson(maps[i]);
    });
  }
}
