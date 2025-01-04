import 'package:flutter/material.dart';

class Counterapp extends ChangeNotifier{
  int counter=0;
  int get count=>counter;

    void increment(){
      counter++;
      notifyListeners();
  }

  void decrement(){
      counter= counter>0 ? --counter : counter;
      notifyListeners();

  }

}