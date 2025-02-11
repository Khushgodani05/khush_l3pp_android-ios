import 'package:firebasedemo/service/email_password_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authservice=Provider.of<EmailPasswordService>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text("Home Screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30
        ),)),
        backgroundColor: const Color.fromARGB(255, 21, 126, 211),
        actions: [
          IconButton(
            onPressed: (){
              authservice.signOut();
            }, icon: const Icon(Icons.logout,
            color: Colors.white60,
            ),
            )
        ],
      ),
      body: Center(
      child: Text("Welcome ${authservice.user?.email}")
      ),
    );
  }
}