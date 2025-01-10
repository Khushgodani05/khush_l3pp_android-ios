import 'dart:developer';

import 'package:apifetch/api_service.dart';
import 'package:apifetch/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final ApiService _api = ApiService();
  bool _isLoading=false;
  bool get loadingUser=> _isLoading;
  List<User> _users=[];
  List<User> get userList=> _users;

  Future<void> fetchUser() async{
    _isLoading=true;
    notifyListeners();
    try{
      _users= await _api.fetchUsers(); 
      log("Fetching users");
    }catch(e){
      log("Error fetching users :$e ");
    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }
}