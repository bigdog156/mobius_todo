

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo.dart';

class KeyData{
  static const listTodo = "TODO";
}

class TodoApi {
  final SharedPreferences pref;
  TodoApi( {required  this.pref}){
    _initData();
  }
  List<Todo> list = [];
  void _initData(){
    final todos = pref.getStringList( KeyData.listTodo);
    if(todos != null) {
      for( final todo in todos){
        final item = Todo.fromJson(jsonDecode(todo));
        list.add(item);
      }
    };


  }
  Future<void> saveTodo(Todo todo) async{
    list.add(todo);
    await pref.setString(KeyData.listTodo, jsonEncode(list));
  }

}