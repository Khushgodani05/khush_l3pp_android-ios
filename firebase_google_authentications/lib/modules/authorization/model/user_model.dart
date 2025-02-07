import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

const UserModel({
  this.displayName,
  this.email,
  this.photoURL,
  this.phoneNumber,
  required this.id,
});

  final String id;
  final String? displayName;
  final String? email;
  final String? photoURL;
  final String? phoneNumber;

  factory UserModel.fromMap(Map <String,dynamic> map){
    return UserModel(
      displayName: map['displayName'] as String?, 
      email: map['email'] as String?, 
      photoURL: map['photoURL'] as String?, 
      phoneNumber: map['phoneNumber'] as String?,
      id:map['id'] as String,
      );
  }

    factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      displayName: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userName": displayName,
      "email": email,
      "phoneNumber": phoneNumber,
      "photoURL": photoURL,
    };
  }
  
}