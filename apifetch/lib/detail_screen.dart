import 'package:apifetch/get_icons.dart';
import 'package:apifetch/model/user_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.selecteduser});

   final User selecteduser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Detail Screen",
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
      ),
     ),
     body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            child: Center(
              child: Image(image: NetworkImage(selecteduser.picture),
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              ),
              ),
            ),
        ),
          SizedBox(height: 50),
          SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                GetIcons.logo("name"),
                Text(": ${selecteduser.name}",
                style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 37, 124, 196),
                ),
                ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                GetIcons.logo("email"),
                Text(": ${selecteduser.email}",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 37, 124, 196),
              ),
              ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
              Row(
                children: [
                  selecteduser.gender=='male'? 
                  GetIcons.logo("male"):
                  GetIcons.logo("female"),
                  Text(": ${selecteduser.gender}",
                  style: TextStyle(
                fontSize: 25,
                color: const Color.fromARGB(255, 37, 124, 196),
              ),
                  )
                ],
              ),
              ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                GetIcons.logo("country"),
                Text(": ${selecteduser.country}",
              style: TextStyle(
                fontSize: 25,
                color: const Color.fromARGB(255, 37, 124, 196),
              ),
              ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                GetIcons.logo("phone"),
               Text(": ${selecteduser.phone}",
              style: TextStyle(
                fontSize: 25,
                color: const Color.fromARGB(255, 37, 124, 196),
              ),
              ),
                ]
              ),
               Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              GetIcons.logo("coordinates"),
              Text(": ${selecteduser.coordinates}",
              style: TextStyle(
                fontSize: 25,
                color: const Color.fromARGB(255, 37, 124, 196),
              ),
              ),
                ]
              ),
            ],
          ),
        )
      ],
     ),
    );
  }
}