import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_google_authentications/modules/explore/view/widget/explore_grid_view_item_builder.dart';
import 'package:flutter/material.dart';

class ExploreWallpaperGridView extends StatelessWidget {
  const ExploreWallpaperGridView({super.key,
  required this.wallpapers });

  final List<WallpaperModel> wallpapers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 12,
        crossAxisSpacing: 15,
        childAspectRatio: 1/1.4,
        ), 
      itemCount: wallpapers.length,
      itemBuilder: (context,index){
        final wallpaper=wallpapers[index];
        return ExploreGridViewItemBuilder(wallpaper: wallpaper);
      },
      controller:ScrollController(
        initialScrollOffset: 2
      ) ,
      );
  }
}