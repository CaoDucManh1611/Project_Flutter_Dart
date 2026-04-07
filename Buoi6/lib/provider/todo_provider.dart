import 'package:flutter/material.dart';
import '../database/db_todo.dart';
import '../model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _list = [];
  List<Todo> get list => _list;

  Future<void> loadTodos() async {
    _list = await DbTodo().getAll();
    notifyListeners();
  }

  Future<void> add(Todo todo) async {
    await DbTodo().insert(todo);
    await loadTodos();
  }

  Future<void> toggleStatus(Todo todo) async {
    todo.isDone = (todo.isDone == 0) ? 1 : 0;
    await DbTodo().update(todo);
    await loadTodos();
  }

  Future<void> remove(int id) async {
    await DbTodo().delete(id);
    await loadTodos();
  }
}