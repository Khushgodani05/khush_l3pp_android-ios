import 'package:firebasedemo/auth_gaurd.dart';
import 'package:firebasedemo/service/email_password_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>EmailPasswordService(),
      child: const AuthGaurd(),
      );
  }
}