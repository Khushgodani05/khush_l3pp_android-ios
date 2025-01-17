import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_2/core/database/local_database.dart';
import 'package:todolist_2/modules/todo/model/get_todo_request_model.dart';
import 'package:todolist_2/modules/todo/model/get_todo_response_model.dart';
import 'package:todolist_2/modules/todo/model/todo_model.dart';

class TodoLocalDatabaseService {
  final _db=LocalDatabase.instance.database;

  Future<TodoModel?> createTodo(TodoModel model) async {
     try{
      final id= await _db.insert(
        'todos',
         model.toDatabaseMap()
         );
        log("created Todo with id: $id");
        return model.copyWith(
          id: id,
        );
     }
     catch(err,s){
      log("createTodo", error: err, stackTrace:  s, name: '$runtimeType');
      return null;
     }
  }

  Future<GetTodoResponseModel?> getAllTodos(GetTodoRequestModel request, {
    int limit =14,
    int offset =0,
  }) async{
      try{
         final total= Sqflite.firstIntValue(
          await _db.rawQuery('SELECT COUNT(*) FROM todos'),
        );
        final result=await _db.query(
          'todos',
          limit: limit,
          offset: offset,
          orderBy: 'id DESC'
          );
          final todos=result.map((map){
            return TodoModel.fromDatabaseMap(map);
          }).toList();
          return GetTodoResponseModel(todos: todos, total: total ?? 0);
      }catch(e,s){
         log("getAllTodo", error: e, stackTrace: s, name: '$runtimeType');
         return null;
      }
  }

  Future<TodoModel?>updateTodo(int id, TodoModel model) async{
    try{
      final result=await _db.update(
        'todos',
        model.toDatabaseMap(),
        where: 'id=?',
        whereArgs: [id],
        );
        log("updated $result todo");
        return model;
    }catch(e,s){
      log("updatingTodo ", error: e, stackTrace: s,name: '$runtimeType');
      return null;
    }
  }


  Future<void> deleteTodo(int id) async{
    try{
      final result=await _db.delete(
        'todos',
        where: 'id=?',
        whereArgs: [id],
        );
        log("deletedTodo $result todo");
      }catch(e,s){
        log("deletedTodo ", error: e, stackTrace: s,name: '$runtimeType');
      }
  }
}