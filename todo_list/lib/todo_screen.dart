import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/todo.dart';

class TodoScreen extends StatelessWidget{
  TodoScreen({super.key});
  final TextEditingController texter =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider=Provider.of<TodoProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                TextField(
                  controller: texter,
                  decoration:const  InputDecoration(
                    hintText: "Enter your new task here!",
                  ),
                ),
                FloatingActionButton(child: Text("Add Task"),
                onPressed:(){
                  todoProvider.addTask(texter.text);
                  texter.clear();
                }
                )
              ],
              ),
              Expanded(
                child: todoProvider.todos.isEmpty ?
                const Text("No tasks yet!")
                : ListView.builder(itemCount: todoProvider.todos.length, 
                itemBuilder: (content,index){
                  final todos=todoProvider.todos[index];
                  return ListTile(
                    leading: Checkbox(value: todos.isCompleted, 
                    onChanged: (value){
                        todoProvider.toggleTodoStatus(todos.id);
                    }
                    ),
                    title: Text(todos.todoTask),
                    trailing: IconButton(onPressed: onPressed, icon: icon),
                  );
                }
                )
                )
          ],
        ),
      );
  }
  }