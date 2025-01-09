
import 'package:todolist_2/modules/todo/model/todo_category.dart';
import 'package:todolist_2/modules/todo/model/todo_priority.dart';
import 'package:todolist_2/modules/todo/model/todo_status.dart';

class TodoModel {
  final String title;
  final String? description;
  final int? id;
  final DateTime createdAt;
  final DateTime? deletedAt;
  final TodoCategory category;
  final TodoStatus status;
  final TodoPriority priority;

  const TodoModel({
    required this.category,
    this.id,
    this.description,
    required this.priority,
    required this.status,
    required this.title,
    required this.createdAt,
    this.deletedAt,
    });

    factory TodoModel.fromDatabaseMap(Map<String,dynamic> map){
      return TodoModel(
        category: mapToTodoCategory( map['category'] as String),
        priority: mapToTodoPriority(map['priority'] as String) ,
        status: mapToTodoStatus(map['status'] as String) , 
        title: map['title'] as String, 
        createdAt: DateTime.fromMillisecondsSinceEpoch( map['createdAt'] as int),
        id: map['id'] as int,
        description: map['description'] as String?,
        deletedAt: (map['deletedAt'] as int?) != null
        ?DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int):
        null,
      );
    }

    TodoModel copyWith({
      int ? id,
}) {
  return TodoModel(
    id:id??this.id,
    title: title,
    description: description,
    category: category,
    priority: priority,
    status: status,
    createdAt: createdAt,
    deletedAt: deletedAt,
  );
}
    
  Map<String, dynamic> toDatabaseMap() {
    return {
      'title' : title.trim(),
      'category' :category,
      'description' : description,
      'priority' : priority,
      'status' : status,
      'createdAt' : createdAt.millisecondsSinceEpoch,
      'deletedAt' : deletedAt?.millisecondsSinceEpoch,
    };
 
  }




}