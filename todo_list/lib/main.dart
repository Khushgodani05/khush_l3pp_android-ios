import 'package:flutter/material.dart';
import 'package:todo_list/view/todo_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/todo_provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create:(context)=>TodoProvider(),
    child:const TodoApp()
  )
  );
}

class TodoApp extends StatelessWidget{
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );

  }

}