import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/modules/todo/model/todo_category.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';

class TodoCategoryBuilder extends StatelessWidget {
  const TodoCategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory=context.watch<TodoViewModel>().category;
    return Row(
      children: [
        const Text("Category :"),
        ...TodoCategory.values.map((category){
          return Padding(padding: const EdgeInsets.all(8.0),
          child: InputChip(
            selected: selectedCategory==category,
            label: Text(category.name),
            onSelected: (value){
              if(value){
                context.read<TodoViewModel>().changeTodoCategoryEvent(category);
              }
            },
            ),
            );
        })
      ],
    );
  }
}