import 'package:flutter/material.dart';

void main()
{
  runApp(const Demoapp());
}

class Demoapp extends StatelessWidget{
  const Demoapp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title: const Text("My Info Screen"),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 9, 106, 186),
        ),
        body: const Myinfoscreen(),
      ),
      );
  }
  
}

class Myinfoscreen extends StatelessWidget{
   const Myinfoscreen({super.key});
   
     @override
     Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          width: 500,
          child: Image.asset("assets/images/image.png"),
    
        ),
         const SizedBox(
              height: 20,
            ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.person),
          Text(
            "Khush godani",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              letterSpacing: 1,
            ),
            ),
        ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.favorite),
          Text(
            "Eat,play,code,repeat",
             style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              letterSpacing: 1,
              wordSpacing:5, 
            ),
            ),

        ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.mail),
          Text(
            "khushcgodani@gmail.com",
             style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              letterSpacing: 1,
              wordSpacing:5, 

            ),
            ),

        ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.phone),
          Text(
            "9594888876",
             style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              letterSpacing: 1,
              wordSpacing:5, 

            ),
            ),

        ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month),
            Text(
            "15/12/2004",
             style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              letterSpacing: 1,
              wordSpacing:5, 

            ),
            ),
          ],
        )
      ],
    );
  }
   
}