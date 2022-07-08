
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiustodoapp/model/todo.dart';
import 'package:mobiustodoapp/repo/todo_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TodoNotifier extends StateNotifier<List<Todo>>{
  TodoNotifier(List<Todo>? initData) : super( initData ?? []);

  void addTodo(String todo){
    final Todo item = Todo(id: DateTime.now().microsecondsSinceEpoch, content: todo);
    state = [...state, item];
  }

  void deletedTodo(int id){
    state = [
      for (final todo in state)
        if (todo.id != id) todo
    ];
  }
  void changeStatus(int id){
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(status: !todo.status)
      else todo
    ];
  }
}

final todoVM = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  //TODO: get data local
  return TodoNotifier([]);
});