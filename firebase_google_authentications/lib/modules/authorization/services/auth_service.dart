import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final _googlesignin=GoogleSignIn();
  final _firebaseauth= FirebaseAuth.instance;

  User? getUser(){
    log(_firebaseauth.currentUser as String);
    return _firebaseauth.currentUser;
  }

  Future<User?> signInWithGoogle() async{
  // Trigger the authentication flow
    final googleuser= await _googlesignin.signIn();
  // Obtain the auth details from the request
    final googleauth = await googleuser?.authentication;
  // Create a new credential
    final credential = GoogleAuthProvider.credential(
    accessToken: googleauth?.accessToken,
    idToken: googleauth?.idToken,
  );
  final UserCredential=await  _firebaseauth.signInWithCredential(credential);
  return UserCredential.user;
  }

  Future<void> logOutUser() async{
    await _firebaseauth.signOut();
    await _googlesignin.signOut();
  }
}