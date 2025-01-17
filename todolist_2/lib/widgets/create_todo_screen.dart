import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_2/view%20model/todo_view_model.dart';
import 'package:todolist_2/widgets/todo_category_builder.dart';
import 'package:todolist_2/widgets/todo_priority_builder.dart';
import 'package:todolist_2/widgets/todo_status_builder.dart';

class CreateTodoScreen extends StatefulWidget{
  const CreateTodoScreen({super.key});

  @override
  State<StatefulWidget> createState() =>_CreateTodoScreen();
}

class _CreateTodoScreen extends State<CreateTodoScreen>{
  TextEditingController title=TextEditingController();
  TextEditingController description = TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title:const Text("Create Todo"),
          ),
          body: Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                        hintText: "Enter a title",
                      ),
                      maxLength: 100,
                      validator: (value) {
                        if(value==null) return "Title is required";
                        if(value.trim().isEmpty) return "Title is required";
                        if(value.trim().length<5) return "Title must be of 5 characters minimum";
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: description,
                      decoration: const InputDecoration(
                        hintText: "Enter a description",
                      ),
                      maxLength: 500,
                      maxLines: 5,
                      validator: (value) {
                        if(value==null) return "description is required";
                        if(value.trim().isEmpty) return "description is required";
                        if(value.trim().length<5) return "description must be of 5 characters minimum";
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 16,),
                    const TodoCategoryBuilder(),
                    const SizedBox(height: 16,),
                    const TodoPriorityBuilder(),
                    const SizedBox(height: 16,),
                    const TodoStatusBuilder(),
                    FilledButton(
                      onPressed: () {
                        _onSaveButtonTapEvent(context);
                      },
                      child: const Text('Save'),
                    )
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
     );
  }
  
  void _onSaveButtonTapEvent(BuildContext context) {
    if(formkey.currentState?.validate()==true){
      context.read<TodoViewModel>().createTodoEvent(
        title: title.text.trim(),
        description: description.text.trim().isNotEmpty?description.text.trim() :null,
        onCompleted: (result){
          Navigator.of(context).pop(result);
        }
        );
    }
  }


    @override
void dispose() {
  title.dispose();
  description.dispose();
  super.dispose();
  }
}