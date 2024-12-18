import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Alert boxes",
    home: Center(
      child: MyAlertBoxes()
      ),
  ));
}

class MyAlertBoxes extends StatelessWidget{
  const MyAlertBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My alert boxes"),
      ),
      body: Column(
        children: [
        Center(
          child:
          Column(
           children: [
              Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(
               onPressed:()=> SimpleAlertBox(context),
                child:const Text("Simple alert box"),
              ),
              ),
              
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                onPressed:()=> ConfirmationAlertBox(context),
                  child:const Text("Confirmation alert box"),
                ),
              ),
              
              
              Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(
              onPressed: ()=>CustomAlertBox(context),
              child: const Text("CustomAlertBox")
              ),
             ), 
             
           ],
          )  
         
        ),
        
        ],
      )
     
    );
  }

 void SimpleAlertBox(BuildContext context){
    showDialog(
    context: context,
     builder:(BuildContext context){
      return AlertDialog(
        title: const Text("Simple textbox"),
        content: const Text("I am a simple Alert box"),
        actions: [
          ElevatedButton(onPressed: ()=>Navigator.of(context).pop(),
           child: const Text("Ok"),
           ),
        ],
        );

     }
     );
 }

     void ConfirmationAlertBox(BuildContext context){
      showDialog(context: context,
       builder:(BuildContext context){
        return AlertDialog(
          title:const Text("Confirmation Alert Box"),
          content: const Text("Are you sure?"),
          actions: [
            TextButton(
              onPressed: ()=>Navigator.of(context).pop(), 
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: ()=>Navigator.of(context).pop(), 
              child: const Text("No"),
            )
          ],
        );
       }
       );
     }

     void CustomAlertBox(BuildContext context){
      showDialog(context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Custom Alert Box"),
          content: const Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your number",
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: ()=>Navigator.of(context).pop(),
              child: const Text("Submit")
              )
          ],

        );
       },
       );
     }



   
  }
  
