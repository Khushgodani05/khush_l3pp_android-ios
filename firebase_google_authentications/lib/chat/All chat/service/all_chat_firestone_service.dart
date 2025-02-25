import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_google_authentications/modules/authorization/model/user_model.dart';
import 'package:firebase_google_authentications/modules/authorization/services/auth_service.dart';

class AllChatFirestoneService {
  final _authService=AuthService();
  final _client=FirebaseFirestore.instance;

  // Future<List<UserModel>> searchUsersQuery(String query) async{
  //   final response= await _client.collection("users").where("userName",isLessThanOrEqualTo: query.trim().toLowerCase()).get();
  // }

}