import 'package:firebase_google_authentications/modules/wallpaper/view/favourite_wallpaper_icon.dart';
import 'package:firebase_google_authentications/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key,
  });


  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {

  @override
  void initState(){
    super.initState();
    Future.microtask((){
      if(mounted) context.read<WallpaperViewModel>().isFavourite;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper'),
        actions:  [
          FavouriteWallpaperIcon(),
          const SizedBox(width: 24,),
          IconButton(
            onPressed: (){
              context.read<WallpaperViewModel>().addToFavouriteClickEvent();
            }, icon: const Icon(Icons.favorite_rounded)
            ),
        ],
      ),
    body: Container(
      color: Colors.white60,
      child: Center(
        child: Image(
          image: NetworkImage(context.read<WallpaperViewModel>().model.src.large),
          fit: BoxFit.contain,
          ),
          ),
    ),
    );

  }
}