import 'package:first_ui/practise1_all.dart';
import 'package:first_ui/practise1_bottomwear.dart';
import 'package:first_ui/practise1_firstlist.dart';
import 'package:first_ui/practise1_innerware.dart';
import 'package:first_ui/practise1_outerwear.dart';
import 'package:first_ui/practise1_top.dart';
import 'package:flutter/material.dart';

void main(){
  runApp( const Myshopping());
}

class Myshopping extends StatelessWidget{
  const Myshopping({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("My shopping store",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),)),
          backgroundColor: Colors.blue,
          toolbarHeight: 90,
        ),
        body:const MyApp(),
        ) 
       
      );
    
  }

}

 class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SingleChildScrollView(scrollDirection: Axis.horizontal,
         child: Row(
            mainAxisSize: MainAxisSize.max,
      children: [
        all(),

        top(),

        bottomwear(),

        innerware(),

        outwear(),
       ],//children
     ),
        ),

     Column(
       children: [
        
       tshirtRow(),
       tshirtRow(),
       
     ],
       ),
    ],
    );
   
  }

 


  

  
  
  Row tshirtRow() {
    return Row(
        children: [
          firstlist(),
          firstlist(),
          ],
          );
  }

 }




