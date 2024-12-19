import 'package:flutter/material.dart';
import 'package:todo_list/todo_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create:(context){},
    child:const TodoApp()
  )
  );
}

class TodoApp extends StatelessWidget{
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoScreen(),
    );

  }

}