import 'package:flutter/material.dart';

Padding firstlist() {
    return Padding(
        padding:const EdgeInsets.all(12),
        child: Container(
          height: 160,
          width: 152,
          decoration:  const BoxDecoration(
            color:  Color.fromARGB(255, 225, 223, 223),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
          height:100,
          width: 152,
          decoration:  const BoxDecoration(
            color:Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage("https://media.gettyimages.com/id/483960103/photo/blank-black-t-shirt-front-with-clipping-path.jpg?s=1024x1024&w=gi&k=20&c=xrphzaD2pDGUOHCF5JSvTK8TSVPKGYG_pHj6etMJCHs="),
            ),
          ),
          const Padding(
            padding:EdgeInsetsDirectional.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("T-shirt",
                style: TextStyle(
                  fontSize:17,
                ),
                ),
                Text("Rs450",
                style: TextStyle(
                  fontSize:17,
                ),
                ),
              ],
            ),
          )
          ],
          ),
         ),
        );
  }
  
 