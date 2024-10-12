import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue[200],
        home: Scaffold(
          appBar:AppBar(
            title: const Text("My first ui"),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
             ),
          body: const Myfirstui(),
)
);
 }
}

  class Myfirstui extends StatelessWidget{
    const Myfirstui({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Hello world!!!"),
        const SizedBox(
              width: 20,
              height: 50,
            ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children : [
             Icon(Icons.ac_unit),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("king is back"),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: Icon(Icons.access_alarm_outlined),
                )
              ],
            )
          ]
        ),
        Padding(
        padding: const EdgeInsets.all(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration:BoxDecoration(
                color: Colors.blue,
                // border:Border.all(
                //   width: 1,
                // ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                 children: [
                 const Text("I am from decorated box",
                 style:TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                 ),
                 ),
                Padding(padding: const EdgeInsets.all(40),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:Column(
                    children: [
                        const Icon(Icons.favorite),
                        Image.network("https://assets.architecturaldigest.in/photos/63733ec2a2dd6ea6560eb6da/16:9/w_1615,h_908,c_limit/Ditas%20Interior%20Image%20-%201%20(8).png",
                        height: 50,
                        width: 100),
                        const SizedBox(
                        height: 50,
                        width: 100,
                      ),
                     const Text("i am from white decorated box"),
                     ]
                  )
                ),
                ),
                 ],
               ),
              ),
          ],
        ),
        ),
      ],//children
    );
  }
  }