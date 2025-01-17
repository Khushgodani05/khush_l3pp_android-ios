import 'package:flutter/material.dart';
import 'package:todolist_2/modules/todo/model/todo_model.dart';
import 'package:todolist_2/widgets/create_todo_loader_overlay.dart';

class ViewTodoScreen extends StatelessWidget {
  const ViewTodoScreen({super.key, required this.model});
  final TodoModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("View todo screen"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title),
                const SizedBox(height: 16,),
                if(model.description!=null)
                Text(model.description!)
              ],
            ),
            ),
        ),
        const CreateTodoLoaderOverlay(),
      ],
    );
  }
}