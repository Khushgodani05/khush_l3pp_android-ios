
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(const Myapp());
}




class Myapp extends StatefulWidget{
  const  Myapp({super.key});

  @override
  State<StatefulWidget> createState()=> _SharedPref(); 
}

class _SharedPref extends State<Myapp> {

  String thoughtOfTheDay="Always be happy";
  final TextEditingController control= TextEditingController();

  Future<void> _loadData() async {
    final pref=await SharedPreferences.getInstance();
    setState(() {
      thoughtOfTheDay=pref.getString("thought")?? "No data available";
    });
  }


  Future<void> _saveData() async{
    thoughtOfTheDay=control.text;
    final pref=await SharedPreferences.getInstance();
    setState(() {
      pref.setString("thought",thoughtOfTheDay);
      _loadData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Thoughts of the day",
      home: Scaffold(
        appBar: AppBar(
           title: const Text("Thoughts of the day"),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Thought of the day?",
            style: TextStyle(
                fontSize: 20,
            ),
            ),
            Text(thoughtOfTheDay),
            TextField(
              controller: control,
              decoration: const InputDecoration(
                hintText: "what's your thought",
              ),
            ),
            FloatingActionButton(onPressed: _saveData, child:const Text("Save thought"),)
        ],
        ),
      ),
    )
    );
  }
  
}