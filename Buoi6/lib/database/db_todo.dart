import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/todo.dart';

class DbTodo {
  static final DbTodo _instance = DbTodo._internal();
  static Database? _database;
  factory DbTodo() => _instance;
  DbTodo._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await openDatabase(
      join(await getDatabasesPath(), 'todo_db.db'),
      version: 1,
      onCreate: (db, version) => db.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, isDone INTEGER)',
      ),
    );
    return _database!;
  }

  Future<int> insert(Todo todo) async => (await database).insert('todos', todo.toMap());
  Future<List<Todo>> getAll() async {
    final List<Map<String, dynamic>> maps = await (await database).query('todos');
    return maps.map((e) => Todo.fromMap(e)).toList();
  }
  Future<int> update(Todo todo) async => (await database).update('todos', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  Future<int> delete(int id) async => (await database).delete('todos', where: 'id = ?', whereArgs: [id]);
}