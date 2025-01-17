
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';
import 'package:todolist_2/widgets/view_todo_screen.dart';

class AllTodoListBuilder extends StatefulWidget {
  const AllTodoListBuilder({super.key});
  
  @override
  State<StatefulWidget> createState() =>_AllTodoListBuilder();
  
}

class _AllTodoListBuilder extends State<AllTodoListBuilder>{

  @override
  void initState(){
   super.initState();
   Future.microtask((){
    if(mounted) context.read<TodoViewModel>().fetchAllTodos();
   }
   );
  }
  @override
  Widget build(BuildContext context) {
    final todos=context.watch<TodoViewModel>().todo;
    final isLoadingMore=context.watch<TodoViewModel>().isLoadingMore;
    return Column(
      children: [
        Expanded(child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
              context.read<TodoViewModel>().fetchMoreTodos();
            }
            return false;
          },
          child: ListView.separated(
            separatorBuilder: (context,index){
              return const Divider(height: 1,);
            }, 
            padding:const EdgeInsets.symmetric(vertical: 16),
            itemCount: todos.length,
            itemBuilder: (context,index){
              final todo= todos[index];
              return ListTile(
                leading: const Icon(Icons.circle),
                title:Text(todo.title),
                trailing: Text("${todo.createdAt}"),
                subtitle: todo.description!=null ? 
                Text(todo.description!,
                maxLines:3,
                overflow: TextOverflow.ellipsis,
                ):
                null,
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_)=> ChangeNotifierProvider.value(
                          value: context.read<TodoViewModel>() ,
                          child: ViewTodoScreen(model: todo,),
                        ),)
                  );
                },
              );
            },
            )
            )
            ),
            if(isLoadingMore)
            const SizedBox(
              height: 24,
              width: 24,
              child: Center(child: CircularProgressIndicator(),),
            )
      ],
    );
  }
  
}