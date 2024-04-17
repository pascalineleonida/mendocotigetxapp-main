import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'note.db';

  static Future<Database> _getDb() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) => db.execute("create table"),
        version: _version);
  }

  static Future<int> addNote(note) async {
    final db = await _getDb();
    return await db.insert("Note", note.toJon,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
