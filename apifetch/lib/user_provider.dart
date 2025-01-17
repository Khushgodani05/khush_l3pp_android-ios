import 'dart:developer';
import 'package:apifetch/model/user_model.dart';
import 'package:apifetch/services/api_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final ApiService _api = ApiService();
  bool _isLoading=false;
  bool get loadingUser=> _isLoading;
  List<User> _users=[];
  List<User> get userList=> _users;
  List<User> _filteredUser =[];
  List<User> get filteredUser=>_filteredUser;
  List<User> alluser=[];

  Future<void> fetchUser() async{
    _isLoading=true;
    notifyListeners();
    try{
      _users= await _api.fetchUsers();
      alluser=_users; 
      log("Fetching users");
    }catch(e){
      log("Error fetching users :$e ");
    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }

void getFilteredUser(String gender){
    if(gender== "male"){
      _filteredUser= alluser.where((user)=>user.gender=="male").toList();
      _users=_filteredUser;
    }else if(gender=="female"){
      _filteredUser=alluser.where((user)=>user.gender=="female").toList();
      _users=_filteredUser;
    }else{
      _users=alluser;
    }
    notifyListeners();
  }
}