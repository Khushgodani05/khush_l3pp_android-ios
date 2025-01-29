
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/model/todo.dart';

class TodoProvider extends ChangeNotifier{
  List<Todo> _todos=[];
  List<Todo> get todos=> _todos;

  TodoProvider(){
    _loadData();
  }

  Future<void> _loadData() async {
    final prev=await SharedPreferences.getInstance();
    final todoString=prev.getString("task");
    if(todoString != null){
      final List<dynamic> todoList=jsonDecode(todoString);
      _todos=todoList.map((todo)=>Todo.fromMap(todo)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveData()async {
    final prev=await SharedPreferences.getInstance();
    final todoString=jsonEncode(_todos.map((todo) => todo.toMap()).toList());
    prev.setString("task", todoString);
  }
  

  Future<void> addTask(String title) async{
     if(title.trim().isNotEmpty){
      final newTodo=Todo(id: DateTime.now().toString(), todoTask: title);
      _todos.add(newTodo);
     }
      _saveData();
      notifyListeners();
  }

  Future<void> toggleTodoStatus(String id) async{
       final index=_todos.indexWhere((todo)=>todo.id==id);
       if(index>=0){
       _todos[index].isCompleted= !_todos[index].isCompleted;
       }
       _saveData();
       notifyListeners();
  }

  Future<void> removeTask(String id) async{
    _todos.removeWhere((todo)=>todo.id==id);
    _saveData();
    notifyListeners();
  }

}