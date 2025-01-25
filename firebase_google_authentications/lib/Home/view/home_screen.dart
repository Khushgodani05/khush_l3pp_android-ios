import 'package:firebase_google_authentications/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Home Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),),
          actions: [
            IconButton(
            onPressed: (){
              context.read<AuthViewModel>().logOutUser();
            }, 
            icon:const Icon(Icons.logout,
            color: Colors.white,),
            )
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: 
        //   ),
      );
  }
}