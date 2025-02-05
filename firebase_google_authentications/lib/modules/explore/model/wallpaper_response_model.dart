import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';

class WallpaperResponseModel {
    const WallpaperResponseModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });
  final int page;
  final int perPage;
  final int totalResults;
  final List<WallpaperModel> photos;

  factory WallpaperResponseModel.fromMap(Map<String,dynamic> map){
    return WallpaperResponseModel(
        page: map['page'] as int, 
        perPage: map['per_page'] as int, 
        totalResults: map['total_results'] as int,
        photos: (map['photos'] as List).map((ele)=>WallpaperModel.fromMap(ele)).toList(),
    );
  }
}