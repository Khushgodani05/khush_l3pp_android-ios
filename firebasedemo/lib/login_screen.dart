import 'package:firebasedemo/service/email_password_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 126, 211),
        title: const Center(child: Text("Login Screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
              labelText: "Email",
              icon: Icon(Icons.email),
              focusColor: Colors.black45,
              ),
            ),
            const SizedBox(height: 10,),
             TextField(
              controller: passwordController,
              decoration:const  InputDecoration(
                labelText: "Password",
                icon: Icon(Icons.password)),
            ),
            const SizedBox(height: 70,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    
                  });
                  try {
                  context.read<EmailPasswordService>().signInWithEmailPassword(emailController.text, passwordController.text);
                 }catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                 }
                emailController.clear();
                passwordController.clear();
                }, child:const  Text("Sign-in"),
                ),
                const SizedBox(width: 100,),
                 ElevatedButton(onPressed: (){
                  try {
                  context.read<EmailPasswordService>().signUpWithEmailPassword(emailController.text, passwordController.text);
                }catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
                emailController.clear();
                passwordController.clear();
                }, child:const Text("Sign-up"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
@override
  void dispose(){
   super.dispose();
  }
}