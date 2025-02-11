import 'package:firebasedemo/home_screen.dart';
import 'package:firebasedemo/login_screen.dart';
import 'package:firebasedemo/service/email_password_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGaurd extends StatefulWidget {
  const AuthGaurd({super.key});

  @override
  State<AuthGaurd> createState() => _AuthGaurdState();
}

class _AuthGaurdState extends State<AuthGaurd> {
  @override
  Widget build(BuildContext context) {
    final authService=context.read<EmailPasswordService>(); 
    if(authService.user!=null){
       return const HomeScreen();
    }else{
      return const LoginScreen();
    }
      
  }
}
