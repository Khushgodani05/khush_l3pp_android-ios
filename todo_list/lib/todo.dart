
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo {
  String id;
  String todoTask;
  bool isCompleted;

  Todo({required this.id, required this.todoTask, this.isCompleted=false});

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'title': todoTask,
      'isCompleted':isCompleted,
    };
  }

  factory Todo.fromMap(Map<String,dynamic> maps){
    return Todo(id: maps['id'], todoTask: maps['title'], isCompleted: maps['isCompleted']);
  }
}

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