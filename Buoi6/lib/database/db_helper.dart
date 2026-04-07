import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/sinhvien.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sinhvien.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sinhviens(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT)',
        );
      },
    );
  }

  Future<int> insertSinhVien(SinhVien sv) async {
    final db = await database;
    return await db.insert('sinhviens', sv.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<SinhVien>> getSinhViens() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('sinhviens');
    return maps.map((e) => SinhVien.fromMap(e)).toList();
  }

  Future<int> updateSinhVien(SinhVien sv) async {
    final db = await database;
    return await db.update('sinhviens', sv.toMap(), where: "id = ?", whereArgs: [sv.id]);
  }

  Future<int> deleteSinhVien(int id) async {
    final db = await database;
    return await db.delete('sinhviens', where: "id = ?", whereArgs: [id]);
  }
}