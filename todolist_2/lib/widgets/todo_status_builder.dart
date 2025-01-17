import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/modules/todo/model/todo_status.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';

class TodoStatusBuilder extends StatelessWidget {
  const TodoStatusBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedStatus=context.watch<TodoViewModel>().status;
    return Row(
      children: [
        const Text("Status :"),
        ...TodoStatus.values.map((status){
          return Padding(padding: const EdgeInsets.all(8.0),
          child: InputChip(
            selected: selectedStatus==status,
            label: Text(status.name),
            onSelected: (value){
              if(value){
                context.read<TodoViewModel>().changeTodoStatusEvent(status);
              }
            },
            ),
            );
        })
      ],
    );
  }
}