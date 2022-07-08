import 'package:flutter/material.dart';
import 'package:mobiustodoapp/model/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiustodoapp/viewmodel/todo_vm.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;
  const TodoItem({Key? key, required this.todo}) : super(key: key );

  @override
  Widget build(BuildContext context, ref) {
    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (value){
          ref.read(todoVM.notifier).deletedTodo(todo.id);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              todo.content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Consumer(
            builder:(context, ref, _) => Checkbox(
                value: todo.status,
                onChanged: (value) {
                  ref.read(todoVM.notifier).changeStatus(todo.id);
                }
            ),
          )
        ],
      ),
    );
  }
}
