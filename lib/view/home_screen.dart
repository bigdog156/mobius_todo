import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiustodoapp/model/todo.dart';
import 'package:mobiustodoapp/view/add_task_screen.dart';
import 'package:mobiustodoapp/view/widget/todo_item.dart';
import 'package:mobiustodoapp/viewmodel/todo_vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Consumer(builder: (context, ref, _) {
        List<Todo> todos = ref.watch(todoVM);
        if (todos.isEmpty) {
          return _emptyWidget();
        }
        return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TodoItem(todo: todos[index]);
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const AddTodoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _emptyWidget() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text('Create Todo ...'),
    );
  }
}

