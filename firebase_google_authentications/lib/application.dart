import 'package:firebase_google_authentications/Home/view_model/home_view_model.dart';
import 'package:firebase_google_authentications/view/auth_gaurd.dart';
import 'package:firebase_google_authentications/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Applications extends StatelessWidget {
  const Applications({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthViewModel()),
        ChangeNotifierProvider(create: (context)=>HomeViewModel()),
      ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const AuthGaurd(),
      ),
      );
  }
}