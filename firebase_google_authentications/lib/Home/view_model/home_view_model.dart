import 'package:firebase_google_authentications/Home/model/home_bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{

  final navigationItem=const [
    HomeBottomNavbar(name: "Explore", icon: Icon(Icons.search),page: Placeholder()),
    HomeBottomNavbar(name: "Favourite", icon: Icon(Icons.favorite), page:  Placeholder())
  ];
}