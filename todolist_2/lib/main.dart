import 'package:flutter/material.dart';
import 'package:todolist_2/application.dart';
import 'package:todolist_2/core/database/local_database.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await LocalDatabase.instance.createDatabase();
  
  runApp(const Application());
}