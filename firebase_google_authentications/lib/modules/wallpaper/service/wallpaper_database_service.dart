import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_google_authentications/modules/authorization/services/auth_service.dart';
import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';

class WallpaperDatabaseService {

  final _client =FirebaseFirestore.instance;
  final _authService=AuthService();

 DocumentReference<Map<String, dynamic>>? wallpaperRef(WallpaperModel model){
    final currentUser=_authService.getUser();
    if(currentUser == null) return null;
    return _client
    .collection('users')
    .doc(currentUser.uid)
    .collection('favourites')
    .doc(model.id.toString());
  }

 Future<bool?> checkIsFavourite(WallpaperModel model) async{
   final ref=wallpaperRef(model);
   if(ref ==null) return null;
   return await ref.get().then((value)=>value.exists);
 }

 Future<void> addToFavourite(WallpaperModel model)async{
  final ref=wallpaperRef(model);
  if(ref==null) return;
  await ref.set(model.toMap());
 }

Future<void> removeFromFavourite(WallpaperModel model)async {
   final ref=wallpaperRef(model);
   if(ref==null) return;
   await ref.delete();
 }



}