import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision/viewmodel/ThemeProvider.dart';
import 'package:revision/viewmodel/counterProvider.dart';

class Counterapp extends StatelessWidget {
  const Counterapp({super.key});

  @override
  Widget build(BuildContext context) {
    final Count= Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter screen"),
        actions: [
          ElevatedButton(onPressed: (){
            Provider.of<Themeprovider>(context,listen: false).toggleTheme();
          }, child: const Icon(Icons.dark_mode))
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 250,
          child: Column(
            children: [
              Text("${Count.countValue}",
              style: const TextStyle(
                fontSize: 150,
              ),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: Count.increase, child: const Icon(Icons.add)),
                  Spacer(),
                  ElevatedButton(onPressed: Count.decrease, child: const Icon(Icons.remove)),              
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}