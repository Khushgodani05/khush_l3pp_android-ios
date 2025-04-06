import 'package:api_practise/model/uer_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.selectedUser});

  final User selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedUser.name,
          style: TextStyle(
            fontSize: 15,
          ),
          ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child:Image(
              image: NetworkImage(selectedUser.picture),
              fit: BoxFit.cover,
              ),
          ),
          Padding(
            padding: EdgeInsets.only(top:16.0),
          ),
          Row(
            children: [
              Icon(Icons.email),
              Text(selectedUser.email),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone),
              Text(selectedUser.phone),
            ],
          ),
          Row(
            children: [
              Icon(Icons.person),
              Text(selectedUser.gender),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              Text(selectedUser.country),
            ],
          ),
          // Row(
          //   children: [
          //     Icon(Icons.location_city_rounded),
          //     Text("${selectedUser.postcode}"),
          //   ],
          // ),
       ],
      ),
    );
  }
}