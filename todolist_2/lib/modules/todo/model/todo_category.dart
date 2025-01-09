enum TodoCategory {personal,work}

TodoCategory mapToTodoCategory(String name){
  switch(name){
  case 'personal':
  return TodoCategory.personal;

  case 'work':
  return TodoCategory.work;

  default:
  return TodoCategory.personal;

  }
}