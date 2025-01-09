enum TodoStatus {pending,completed}


TodoStatus mapToTodoStatus(String name){
  switch(name){
  case 'pending':
  return TodoStatus.pending;

  case 'completed':
  return TodoStatus.completed;

  default:
  return TodoStatus.pending;

  }
}