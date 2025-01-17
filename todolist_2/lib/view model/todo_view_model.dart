import 'package:flutter/foundation.dart';
import 'package:todolist_2/modules/todo/model/get_todo_request_model.dart';
import 'package:todolist_2/modules/todo/model/todo_category.dart';
import 'package:todolist_2/modules/todo/model/todo_model.dart';
import 'package:todolist_2/modules/todo/model/todo_priority.dart';
import 'package:todolist_2/modules/todo/model/todo_status.dart';
import 'package:todolist_2/modules/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier{
  TodoCategory category =TodoCategory.personal;
  TodoStatus status=TodoStatus.pending;
  TodoPriority priority=TodoPriority.low;
  GetTodoRequestModel request=const GetTodoRequestModel();
  bool isLoading=false;
  bool isLoadingMore=false;
  int limit =15;
  List<TodoModel> todo=[];
  int total=0;
  final service= TodoLocalDatabaseService();
  void changeTodoCategoryEvent(TodoCategory category){
    this.category=category;
    notifyListeners();
  }

  void changeTodoStatusEvent(TodoStatus status){
    this.status=status;
    notifyListeners();
  }

    void changeTodoPriorityEvent(TodoPriority priority){
    this.priority=priority;
    notifyListeners();
  }

  void createTodoEvent( {
    required String title,
    String? description,
    required Function(TodoModel? result) onCompleted,
    }) async{
      final model=TodoModel(category: category, priority: priority, status: status, title: title, createdAt: DateTime.now(),description: description);
      isLoading=true;
      notifyListeners();
      final result= await service.createTodo(model);
      onCompleted.call(result);
      isLoading=false;
      notifyListeners();
      fetchAllTodos();
  }

  void fetchAllTodos() async{
    if(isLoading) return;
     isLoading=true;
     notifyListeners();
     final result= await service.getAllTodos(request);
     todo = result?.todos ?? []; 
     total=result?.total ?? 0;
     isLoading=false;
     notifyListeners();
  }

  void fetchMoreTodos() async{
     if(isLoadingMore) return;
     if(todo.length>=total) return;
     isLoadingMore=true;
     notifyListeners();
     final result = await service.getAllTodos(request);
     todo=[...todo, ...result?.todos ?? [],];
     total=result?.total ?? 0;
     isLoadingMore=false;
     notifyListeners();
  }

  void deleteTodoEvent({required TodoModel todo, required VoidCallback onDeleted}) async{
    if(todo.id==null) return;
    isLoading=true;
    await service.deleteTodo(todo.id!);
    isLoading=false;
    notifyListeners();
    _removeTodoFromList(todo);
  }

  void _removeTodoFromList(TodoModel todos){
    todo.remove(todos);
    total= total-1;
    notifyListeners();
  }

}