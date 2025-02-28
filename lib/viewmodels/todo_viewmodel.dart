// lib/viewmodels/todo_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../models/todo.dart';
import '../services/supabase_service.dart';

class TodoViewModel with ChangeNotifier {
  List<Todo> _todos = [];
  final SupabaseService _service = SupabaseService();

  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    final data = await _service.getTodos();
    _todos = data.map((json) => Todo.fromJson(json)).toList();
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    await _service.addTodo(title);
    await fetchTodos();
  }
}
