import 'package:firebase_google_authentications/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_google_authentications/modules/wallpaper/view/wallpaper_screen_provider.dart';
import 'package:flutter/material.dart';

class ExploreGridViewItemBuilder extends StatelessWidget {
  const ExploreGridViewItemBuilder({super.key,
  required this.wallpaper});

  final WallpaperModel wallpaper;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)=>WallpaperScreenProvider(wallpaper: wallpaper,),
          ),
      );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                wallpaper.src.large2x,
              ),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white60,
                        size: 12,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        wallpaper.photographerUrl,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white60
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                         ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    wallpaper.alt,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}