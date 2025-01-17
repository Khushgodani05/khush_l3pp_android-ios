import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';
import 'package:todolist_2/widgets/all_todo_list_builder.dart';
import 'package:todolist_2/widgets/create_todo_screen.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Todos"),
      ),
      body: const Column(
        children: [
          Text("Hello!"),
          Expanded(child: AllTodoListBuilder()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext newContext)=> ChangeNotifierProvider.value(
                value: context.read<TodoViewModel>(),
                child: const CreateTodoScreen(),
                )
            )
            );
        },
        label:const Icon(Icons.add),
        ),
    );
  }
}