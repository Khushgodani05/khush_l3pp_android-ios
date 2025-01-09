enum TodoPriority {low,medium,high}

TodoPriority mapToTodoPriority(String name){
  switch(name){
    case 'low':
    return TodoPriority.low;

    case 'medium':
    return TodoPriority.medium;

    case 'high':
    return TodoPriority.high;

    default:
    return TodoPriority.low;
  }
}