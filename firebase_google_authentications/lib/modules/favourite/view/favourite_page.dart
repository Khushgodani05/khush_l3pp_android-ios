import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_google_authentications/modules/explore/view/widget/explore_wallpaper_gridview.dart';
import 'package:firebase_google_authentications/modules/favourite/view_model.dart/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  
  @override
  void initState(){
    super.initState();
    Future.microtask((){
      if(mounted){
        context.read<FavouriteViewModel>().fetchAllFavouriteWallpapers();
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<FavouriteViewModel,List<WallpaperModel>>(
      selector: (context,vm)=>vm.wallpapers,
      builder: (context,wallpapers,child){
        return RefreshIndicator(
          onRefresh: context.read<FavouriteViewModel>().fetchAllFavouriteWallpapers,
          child:ExploreWallpaperGridView(wallpapers: wallpapers),
          );
      }, 
      );
  }
}