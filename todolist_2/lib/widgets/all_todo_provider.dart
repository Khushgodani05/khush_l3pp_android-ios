import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';
import 'package:todolist_2/widgets/all_todo_screen.dart';

class AllTodoProvider extends StatelessWidget{
  const AllTodoProvider({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (contex)=>TodoViewModel(),
    child: const AllTodoScreen(),
    );
  }

  
}