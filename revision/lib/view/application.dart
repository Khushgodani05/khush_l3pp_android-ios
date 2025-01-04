import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision/view/counterAppProvide.dart';
import 'package:revision/viewmodel/ThemeProvider.dart';

class MyApplication extends StatelessWidget{

  const MyApplication({super.key});
  
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Provider.of<Themeprovider>(context).theme ,
    title: "Counter Application",
    home: const CounterAppProvider(),
  );
  }

} 