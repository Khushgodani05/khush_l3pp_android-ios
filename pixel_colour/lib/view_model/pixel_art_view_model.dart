import 'package:flutter/material.dart';
import 'package:pixel_colour/model/pixel_model.dart';

const size=24;

class PixelArtViewModel extends ChangeNotifier {
  
   List<PixelModel> list=List.generate(size*size,
    (index){
      return PixelModel();
    }
    );

    Color selectedColor=Colors.red;

    void paintPixelEvent(int index){
      list[index]=PixelModel(colour:selectedColor);
      notifyListeners();
    }

    void changeSelectedColourEvent(Color? picked){
      if(picked==null) return;
      selectedColor=picked;
      notifyListeners();
    }
  }
