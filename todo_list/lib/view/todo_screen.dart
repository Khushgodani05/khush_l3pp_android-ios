import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/todo_provider.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: texter,
                      decoration:const  InputDecoration(
                        hintText: "Enter your new task here!",
                      ),
                    ),
                  ),
                  IconButton(
                  icon: const Icon(Icons.add),
                  onPressed:(){
                    todoProvider.addTask(texter.text);
                    texter.clear();
                  }
                  )
                ],
                ),
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
                    title: Text(todos.todoTask,
                    style:TextStyle(
                      decoration: todos.isCompleted? TextDecoration.lineThrough:TextDecoration.none,
                    )
                    ),
                    trailing: IconButton(onPressed: ()=>todoProvider.removeTask(todos.id), icon:const  Icon(Icons.delete)),
                  );
                }
                )
                )
          ],
        ),
      );
  }
  }