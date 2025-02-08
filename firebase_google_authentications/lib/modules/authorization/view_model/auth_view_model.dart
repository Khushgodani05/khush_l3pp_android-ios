import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_google_authentications/modules/authorization/model/user_model.dart';
import 'package:firebase_google_authentications/modules/authorization/services/auth_service.dart';
import 'package:firebase_google_authentications/modules/authorization/services/user_database.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel  extends ChangeNotifier{
  bool isLoading=false;
  User? _users;
  final service = AuthService();
  final userservice=UserDatabase();
  bool get isAuthenticated =>_users != null;

  void logininWithGoogleEvent() async{
    isLoading=true;
    notifyListeners();
    _users= await service.signInWithGoogle();
    if(_users != null){
      final userModel= userservice.createUser(UserModel.fromFirebaseUser(_users!));
      log("Login successful :$_users");
    }
    isLoading=false;
    notifyListeners();
  }

  void getUser() async {
    _users=  service.getUser();
    notifyListeners();
  }

  void logOutUser() async{
    await service.logOutUser();
    _users=null;
    notifyListeners();
  }

}