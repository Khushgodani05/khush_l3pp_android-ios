import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_google_authentications/modules/authorization/services/auth_service.dart';
import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';

class FavouriteDatabseService {
  final _service=AuthService();
  final _client=FirebaseFirestore.instance;

  Future<List<WallpaperModel>?> getAllFavourites()async{
    final currentUser=_service.getUser();
    if(currentUser==null) return null;
    final ref= _client.collection('users').doc(currentUser.uid).collection('favourites');
    final snapshot=await ref.get();
    return snapshot.docs.map((doc)=>WallpaperModel.fromMap(doc.data())).toList();
  }
}