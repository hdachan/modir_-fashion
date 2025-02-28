// lib/views/todo_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_viewmodel.dart';
import '../widgets/todo_item.dart';
import 'login_selection_screen.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 앱 시작 시 Todo 목록 불러오기
    Provider.of<TodoViewModel>(context, listen: false).fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500, // 최대 너비를 1200px로 제한
          ),
          child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // 새로운 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login_total_screen()),
                );
              },
              child: Text('Go to New Screen'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'New Todo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  await viewModel.addTodo(_controller.text);
                  _controller.clear();
                }
              },
              child: Text('Add'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.todos.length,
                itemBuilder: (context, index) {
                  return TodoItem(todo: viewModel.todos[index]);
                },
              ),
            ),
          ],
        ),
        ),
      ),

    );
  }
}
