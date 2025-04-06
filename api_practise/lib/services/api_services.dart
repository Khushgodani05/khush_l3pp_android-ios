import 'dart:convert';

import 'package:api_practise/model/uer_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  
  final String url="https://randomuser.me/api";

  Future<List<User>> fetchUser() async{
    final result= await http.get(Uri.parse("$url?results=50"));
    if(result.statusCode ==200){
      List<dynamic> response=json.decode(result.body)['results'];
      return response.map((json)=>User.fromJson(json)).toList();
    }
    else{
      throw Exception("Failed to Load the Users");
    }
  }
}