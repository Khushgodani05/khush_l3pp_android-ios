import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/modules/todo/model/todo_priority.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';

class TodoPriorityBuilder extends StatelessWidget {
  const TodoPriorityBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPriority=context.watch<TodoViewModel>().priority;
    return Row(
      children: [
        const Text("Priority :"),
        ...TodoPriority.values.map((priority){
          return Padding(padding: const EdgeInsets.all(8.0),
          child: InputChip(
            selected: selectedPriority==priority,
            label: Text(priority.name),
            onSelected: (value){
              if(value){
                context.read<TodoViewModel>().changeTodoPriorityEvent(priority);
              }
            },
            ),
            );
        })
      ],
    );
  }
}