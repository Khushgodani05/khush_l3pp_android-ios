import 'package:firebase_google_authentications/modules/explore/model/wallpaper_url_model.dart';

class WallpaperModel {

  const WallpaperModel({
    required this.id,
    required this.height,
    required this.width,
    required this.url,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColour,
    required this.src,
    required this.alt,
  });
  
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographerUrl;
  final int photographerId;
  final String avgColour;
  final WallpaperUrlModel src;
 final String alt;

 factory WallpaperModel.fromMap(Map<String,dynamic> map){
  return WallpaperModel(
  id: map['id'] as int, 
  height: map['height'] as int, 
  width: map['width'] as int, 
  url: map['url'] as String, 
  photographerUrl: map['photographer_url'] as String, 
  photographerId: map['photographer_id'] as int, 
  avgColour: map['avg_color'] as String, 
  src: WallpaperUrlModel.fromMap(map['src'] as Map<String,dynamic>), 
  alt: map['alt'] as String,
  );
 }

 Map<String,dynamic>toMap(){
    return{
      'id':id,
      'width':width,
      'height':height,
      'url':url,
      'photographerUrl':photographerUrl,
      'photographerId':photographerId,
      'avgColour':avgColour,
      'src':src,
      'alt':alt,
    };
 }
}