import 'package:firebase_google_authentications/modules/authorization/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Center(
          child:  Text("Login Screen",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            context.read<AuthViewModel>().logininWithGoogleEvent();
          }, 
          child: const Image(
            image: NetworkImage("https://53.fs1.hubspotusercontent-na1.net/hubfs/53/image8-2.jpg"),
            height: 60,
            width: 60,
            )
            ),
      ),
    );
  }
}