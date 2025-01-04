import 'package:flutter/material.dart';
import 'package:navigationpractise/counterApp.dart';
import 'package:provider/provider.dart';

class Secondpage extends StatefulWidget{
  const Secondpage({super.key});

  @override
  State<StatefulWidget> createState()=>_SetCounter();
}

class _SetCounter extends State<Secondpage>{
  @override
  Widget build(BuildContext context) {
    final counter= Provider.of<Counterapp>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(
            child: Text("Counter App",
            style: TextStyle(
            fontSize: 25,
            ),
            )
            ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${counter.count}",
            style: const TextStyle(
              fontSize: 150,
              fontWeight: FontWeight.w300,
            ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
              onPressed: counter.increment, 
              child: const Icon(Icons.add),
              ),
              const Padding(padding: EdgeInsets.only(right: 20)),
              ElevatedButton(
              onPressed: counter.decrement, 
              child: const Icon(Icons.remove),
              ),
            ],
          ),
          ],
        ),
        
      );

  }

  
}