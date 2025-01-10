import 'dart:convert';

import 'package:apifetch/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url= "https://randomuser.me/api";

  fetchUsers() async {
    final result= await http.get(Uri.parse("$url?result=10"));
    
    if(result.statusCode==200){
       List<dynamic> response= json.decode(result.body)['results'];
       return response.map((json) =>User.fromJson(json)).toList();
    }
    else{
      throw Exception("Failed to loading Users");
    }
  }
}