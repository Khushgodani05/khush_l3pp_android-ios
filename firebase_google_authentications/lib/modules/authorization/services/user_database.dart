import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_google_authentications/modules/authorization/model/user_model.dart';

class UserDatabase {
  final _client= FirebaseFirestore.instance;
  
Future<UserModel?> createUser(UserModel model)async {
  try {
  final ref=_client.collection('users').doc(model.id);
  await ref.set(model.toMap());
  return model;
} on Exception catch (e,s) {
  log('createUser', name: '$runtimeType', error: e, stackTrace: s);
      return null;
}
}
}