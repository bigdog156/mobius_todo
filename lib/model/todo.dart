
import 'package:flutter/material.dart';

@immutable
class Todo{
  final int id;
  final String content;
  final bool status;
  const Todo({required this.id, required this.content, this.status = false});

  Todo.fromJson(Map<String, dynamic> json):
      id = json['id'],
      content = json['content'],
      status = json['status'];

  Todo copyWith({String? content, bool? status}){
    return Todo(id: id, content: content?? this.content, status: status?? this.status);
  }
}

