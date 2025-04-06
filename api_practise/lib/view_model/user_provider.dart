import 'dart:developer';

import 'package:api_practise/model/uer_model.dart';
import 'package:api_practise/services/api_services.dart';
import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier{
  List<User> _users=[];
  final _api=ApiServices();
  bool _isloading=false;
  bool get isloading=>_isloading;
  List<User> get users=>_users;

  void fetchUser() async{
     _isloading=true;
     notifyListeners();
     try{
      _users= await _api.fetchUser();
      log("$_users");
     }
     catch(e){
      log("error in fetching users : $e");
     }
     finally{
      _isloading=false;
      notifyListeners();
     }

  }


}