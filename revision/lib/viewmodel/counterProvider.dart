import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {

  int count=0;
  int get countValue=> count;

  void increase(){
    count= count+1;
    notifyListeners();
  }

  void decrease(){
    count = count>0 ? count=count-1 : count;
    notifyListeners();
  }
  
}