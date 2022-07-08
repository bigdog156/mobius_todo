
import 'package:mobiustodoapp/model/todo.dart';

abstract class TodoRepoInterface{
  void addTask(Todo todo);
  bool deletedTodo(int id);
  bool changeStatusTodo(int id);
}

