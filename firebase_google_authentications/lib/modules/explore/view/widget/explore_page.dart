import 'package:firebase_google_authentications/modules/explore/view/widget/explore_wallpaper_gridview_builder.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const ExploreWallpaperGridviewBuilder(),
      ), 
      onRefresh: ()async{}
      );
 
  }
}