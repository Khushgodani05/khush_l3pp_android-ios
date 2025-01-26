import 'package:firebase_google_authentications/modules/Home/model/home_bottom_navbar.dart';
import 'package:firebase_google_authentications/modules/explore/view/explore_page.dart';
import 'package:firebase_google_authentications/modules/favourite/view/favourite_page.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{

  final navigationItem=const [
    HomeBottomNavbar(name: "Explore", icon: Icon(Icons.search),page: ExplorePage()),
    HomeBottomNavbar(name: "Favourite", icon: Icon(Icons.favorite), page:  FavouritePage())
  ];
  int selectedIndex=0;

  void changeSelectedIndexEvent(int index){
    selectedIndex=index;
    notifyListeners();
  }

  Widget get selectedPage=>navigationItem[selectedIndex].page;
}