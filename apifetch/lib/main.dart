import 'package:apifetch/home_screen.dart';
import 'package:apifetch/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create:(BuildContext context)=> UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Homescreen app",
        theme: ThemeData.light(),
        home: const HomeScreen(),
      ),
      )
  );
}