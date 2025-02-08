import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_google_authentications/modules/favourite/service/favourite_databse_service.dart';
import 'package:flutter/foundation.dart';

class FavouriteViewModel extends ChangeNotifier{
  final _service=FavouriteDatabseService();
  List<WallpaperModel> wallpapers=[];

  Future<void> fetchAllFavouriteWallpapers() async{
    final favWallpapers= await _service.getAllFavourites();
    wallpapers =favWallpapers ?? [];
    notifyListeners();
  }
}