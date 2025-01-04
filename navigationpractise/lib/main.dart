import 'package:flutter/material.dart';
import 'package:navigationpractise/Myapp.dart';
import 'package:navigationpractise/counterApp.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counterapp(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Counter App",
      theme: ThemeData.dark(),
      home: const Myapp(),
    ) ,
    ),
   
  );
}

