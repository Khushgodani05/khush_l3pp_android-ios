import 'package:flutter/material.dart';

void main(){
   runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Maincontact(),
  ));
}

class Maincontact extends StatefulWidget{
  const Maincontact({super.key});
  
  @override
  State<StatefulWidget> createState()=> _Mycontact();
}

class _Mycontact extends State<Maincontact>{

String nome="";
String nomber="";

List<String>names=[];
List<String>numbers=[]; 

final textController=TextEditingController();
final numberController=TextEditingController();


void deletecontact(int index) {
  setState(() {
  });
  names.removeAt(index);
  numbers.removeAt(index);

}
void addnewcontact(String name, String number){
  setState(() {
    if(name.isNotEmpty & number.isNotEmpty){
      nome=name;
      nomber=number;
      names.add(name);
      numbers.add(number);
    }else {
      textController.clear();
      numberController.clear();
    }
  });
  textController.clear();
  numberController.clear();
  
}


void addcontact(){
   showDialog(context: context, builder: (context){
      return AlertDialog(
      title:const Text("Add a name"),
      content: Container(
        height: 150,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:[
            TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: "Add a name",
            ),
          ),
          TextField(
            controller: numberController,
            decoration: const InputDecoration(
              hintText: "Add a number",
            ),
            maxLength: 10,
          ),
          ] 
        ),
      ),
      actions: [
        TextButton(onPressed:() =>{addnewcontact(textController.text,numberController.text),
        Navigator.pop(context),
        },
         child: const Text("Add",
         style: TextStyle(
          color: Colors.blue
         ),)
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



Widget displaycontact(String name, int index, String number) {
  return ListTile(
    leading: const Icon(Icons.phone,
    size: 20),
    minTileHeight: 36,
    title: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[ Text(name,
      style:const TextStyle(
        fontFamily: "khush",
        fontSize: 18,
      ),
      ),
      Text(number,
      style:const TextStyle(
        fontFamily: "khush",
        fontSize: 18,
      ),
      ),
    ],
    ),
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
        child: Text("My Diary",
        style: TextStyle(
        color: Colors.white,
        fontFamily: "khush",
        fontSize: 30,
        ),
        ),
       ),
      ),
      body: Container(
        child: (numbers.isEmpty & names.isEmpty)? const Text("Add a name") : 
        ListView.builder(itemCount: numbers.length ,itemBuilder: (context,index){
          return displaycontact(names[index],index,numbers[index]); 
        }, 
        ),
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