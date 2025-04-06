import 'package:api_practise/view/home_screen.dart';
import 'package:api_practise/view_model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
    create: (context)=>UserProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: "UsersList",
      home: const HomeScreen(),
    ),
    ),
  );
  
}