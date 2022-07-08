
import 'package:mobiustodoapp/model/todo.dart';
import 'package:mobiustodoapp/repo/todo_api.dart';
import 'package:mobiustodoapp/repo/todo_repo_interface.dart';

class TodoRepository extends TodoRepoInterface{

  final TodoApi api;
  TodoRepository({required this.api});

  @override
  void addTask(Todo todo) {
    api.saveTodo(todo);
    throw UnimplementedError();
  }

  @override
  bool changeStatusTodo(int id) {
    // TODO: implement changeStatusTodo
    throw UnimplementedError();
  }

  @override
  bool deletedTodo(int id) {
    // TODO: implement deletedTodo
    throw UnimplementedError();
  }}