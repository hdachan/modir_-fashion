// lib/widgets/todo_item.dart
import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      trailing: Icon(
        todo.completed ? Icons.check_box : Icons.check_box_outline_blank,
      ),
    );
  }
}
