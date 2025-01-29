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
