import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiustodoapp/viewmodel/todo_vm.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: TextFormField(
                controller: controller,
                maxLines: 10,
                decoration: const InputDecoration(
                    hintText: 'Todo...',
                    hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder()
                ),
                cursorColor: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(todoVM.notifier).addTodo(controller.text);
                Navigator.pop(context);
              },
              child:const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}

