import 'package:flutter/material.dart';

void main()
{
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Harshi Jogani",
    textDirection: TextDirection.ltr,
    style: TextStyle(
      color: Colors.black,
      fontSize: 25,
      backgroundColor:Colors.white,
      letterSpacing: 1,
      // height: 1,
      wordSpacing: 5,
    )));
  }

  

}