import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_google_authentications/modules/wallpaper/service/wallpaper_database_service.dart';
import 'package:flutter/material.dart';

class WallpaperViewModel extends ChangeNotifier{
  WallpaperViewModel({
    required this.model,
  });

  final WallpaperModel model;

  bool? isFavourite;
  final _service=WallpaperDatabaseService();

  void checkIsFavourite()async{
   isFavourite=await _service.checkIsFavourite(model);
   notifyListeners();
  }

  void addToFavouriteClickEvent() async{
    if(isFavourite==true){
      await _service.removeFromFavourite(model);
      isFavourite=false;
    }else{
      await _service.addToFavourite(model);
      isFavourite=true;
    }
    notifyListeners();

  }
}