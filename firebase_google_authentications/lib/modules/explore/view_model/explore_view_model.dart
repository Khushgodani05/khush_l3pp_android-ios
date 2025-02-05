import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_google_authentications/modules/explore/service/explore_remote_service.dart';
import 'package:flutter/material.dart';

class ExploreViewModel extends ChangeNotifier{
  List<WallpaperModel> wallpapers=[];
  final _service=ExploreRemoteService();

  void fetchWallpapers()async{
    final response= await _service.getWallpapers();
    response.fold(
    (ifLeft){},
    //ifright 
    (r){
      wallpapers= r.photos;
      notifyListeners();
    },
    );
  }
}