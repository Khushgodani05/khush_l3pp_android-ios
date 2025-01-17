import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';

class CreateTodoLoaderOverlay extends StatelessWidget {
  const CreateTodoLoaderOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading=context.watch<TodoViewModel>().isLoading;
    if(!isLoading) return const SizedBox.shrink();
    return PopScope(
      canPop: false,
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(),
            ),
            SizedBox(width: 12,),
            Text("Saving..."),
          ],
        ),
      )
      );
  }
}