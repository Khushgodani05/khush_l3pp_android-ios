import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_google_authentications/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel  extends ChangeNotifier{
  bool isLoading=false;
  User? _users;
  final service = AuthService();
  bool get isAuthenticated =>_users != null;

  void logininWithGoogleEvent() async{
    isLoading=true;
    notifyListeners();
    _users= await service.signInWithGoogle();
    log("Login successful :$_users");
    isLoading=false;
    notifyListeners();
  }

  void getUser() async {
    _users= await service.getUser();
    notifyListeners();
  }

  void logOutUser() async{
    await service.logOutUser();
    _users=null;
    notifyListeners();
  }

}