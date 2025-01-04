import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData theme = ThemeData.dark();


  toggleTheme(){
    if(theme==ThemeData.dark()){
      theme=ThemeData.light();
    }
    else{
      theme==ThemeData.dark();
    }
    notifyListeners();
  }
}