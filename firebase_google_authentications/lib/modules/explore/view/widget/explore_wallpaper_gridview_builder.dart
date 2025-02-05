import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_google_authentications/modules/explore/view/widget/explore_wallpaper_gridview.dart';
import 'package:firebase_google_authentications/modules/explore/view_model/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreWallpaperGridviewBuilder extends StatefulWidget {
  const ExploreWallpaperGridviewBuilder({super.key});

  @override
  State<ExploreWallpaperGridviewBuilder> createState() => _ExploreWallpaperGridviewBuilderState();
}

class _ExploreWallpaperGridviewBuilderState extends State<ExploreWallpaperGridviewBuilder> {

  @override
  void initState(){
    super.initState();
    Future.microtask((){
      if(mounted) context.read<ExploreViewModel>().fetchWallpapers();
    }
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Selector<ExploreViewModel,List<WallpaperModel>>(
        selector: (context,vm)=>vm.wallpapers,
        builder: (context,wallpapers,child){
        return ExploreWallpaperGridView(wallpapers:wallpapers);
      }, 
      );
  }
}