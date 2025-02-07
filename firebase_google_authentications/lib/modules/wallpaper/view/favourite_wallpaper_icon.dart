import 'package:firebase_google_authentications/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteWallpaperIcon extends StatelessWidget {
  const FavouriteWallpaperIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WallpaperViewModel,bool?>(
      selector: (context,vm)=> vm.isFavourite,
      builder: (context,isFavourite,child){
       if(isFavourite== null) return const SizedBox();
       return IconButton(
        onPressed: (){
          context.read<WallpaperViewModel>().addToFavouriteClickEvent();
        }, 
        icon: Icon(
          isFavourite ?
          Icons.favorite_rounded :
          Icons.favorite_outline_rounded,
          color: Colors.black45,
        )
        );
      }, 
      );
  }
}