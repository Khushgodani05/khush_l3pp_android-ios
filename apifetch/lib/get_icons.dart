import 'package:flutter/material.dart';

class GetIcons {
  static logo(String icon){
    switch(icon){
      case 'name':
      return Icon(Icons.person,
      size: 25,);

      case 'email':
      return Icon(Icons.email,
      size: 25,);

      case 'phone':
      return Icon(Icons.phone,
      size: 25,);

      case 'coordinates':
      return Icon(Icons.place,
      size: 25,);

      case 'country':
      return Icon(Icons.location_city,
      size: 25,);

      case 'male':
      return Icon(Icons.male,
      size: 25,);

      case 'female':
      return Icon(Icons.female,
      size: 25,);

      default:
      return null;
    }
  }
}