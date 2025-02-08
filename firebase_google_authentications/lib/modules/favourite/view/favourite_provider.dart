import 'package:firebase_google_authentications/modules/favourite/view/favourite_page.dart';
import 'package:firebase_google_authentications/modules/favourite/view_model.dart/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteProvider extends StatelessWidget {
  const FavouriteProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>FavouriteViewModel(),
      child:  FavouritePage(),
      );
  }
}