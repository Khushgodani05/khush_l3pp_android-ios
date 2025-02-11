
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EmailPasswordService extends ChangeNotifier {
  final _auth= FirebaseAuth.instance;
  User? _user;
  User? get user=> _user;

  EmailPasswordService(){
    _auth.authStateChanges().listen((User? user){
        _user=user;
        notifyListeners();
    }
    );
  }

Future<void> signInWithEmailPassword(String email,String password) async {
  try {
  final response=await _auth.signInWithEmailAndPassword(email: email, password: password);
  log("Signing-in account : ${response.user}");
  // _user=response.user;
} catch (e) {
  throw "Email or password is incorrect";
}
}

Future<void> signUpWithEmailPassword(String email,String password) async {
   try{
    final user=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    log("Created User: ${user.user}");
   }catch(e){
  throw "Email or password is incorrect";
  }
}

User? getUser(){
  return _auth.currentUser;
}

Future<void> signOut()async{
  await _auth.signOut();
  notifyListeners();
}
}