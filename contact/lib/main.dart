import 'package:flutter/material.dart';

void main(){
   runApp(const MaterialApp(
    home: Maincontact(),
  ));
}

class Maincontact extends StatefulWidget{
  const Maincontact({super.key});
  
  @override
  State<StatefulWidget> createState()=> _Mycontact();
}

class _Mycontact extends State<Maincontact>{

List<String>names=[];

final textController=TextEditingController();

void deletecontact(int index) {
  setState(() {
  });
  names.removeAt(index);

}

void addnewcontact(String name){
  setState(() {
    name.isNotEmpty? names.add(name) :  textController.clear();
  });
  textController.clear();
}


void addcontact(){
   showDialog(context: context, builder: (context){
      return AlertDialog(
      title:const Text("Add a contact"),
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: "Add a contact",
        ),
      ),
      actions: [
        TextButton(onPressed:() =>{addnewcontact(textController.text),
        Navigator.pop(context),
        },
         child: const Text("Add")
         ),
        TextButton(onPressed:() =>{
        Navigator.pop(context),
        },
         child: const Text("cancel")
         ),
      ], 
      );
   }
   );
 }



Widget displaycontact(String name, int index) {
  return ListTile(
    leading: const Icon(Icons.phone,
    size: 18,),
    title: Text(name,
    style:const TextStyle(
      fontFamily: "khush",
      fontSize: 18,
    ),),
    trailing: IconButton(onPressed:()=> deletecontact(index), icon: const Icon(
    Icons.delete,
    color: Colors.red,
    )
    ),
    textColor: const Color.fromARGB(255, 33, 96, 243),
    contentPadding:const EdgeInsetsDirectional.only(bottom: 1),
    horizontalTitleGap: 0,
  );
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.blue,
      title: const Center(
        child: Text("My Contact",
        style: TextStyle(
        color: Colors.white,
        fontFamily: "khush",
        fontSize: 30,
        ),
        ),
       ),
      ),
      body: names.isEmpty? const Text("Add a name") : 
      ListView.builder(itemCount: names.length ,itemBuilder: (context,index){
        return displaycontact(names[index],index); 
      }, 
      ),
      floatingActionButton: FloatingActionButton(onPressed: addcontact,
      splashColor: Colors.green,child: const SizedBox(
        height: 50,
        width: 50,
        child: Icon(Icons.add,
        color: Colors.blue,
        size: 30,
        ),
      ),
      ),
    );
  }
  
 
  


}