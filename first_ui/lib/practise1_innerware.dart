import 'package:flutter/material.dart';

Padding innerware() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 236, 229, 229),
          ),
          child:Row(
            children: [
              Padding(padding: const EdgeInsets.all(10),
              child: Container(
                height: 20,
                width: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: const Center(
                  child: Text("Innerware",
                style: TextStyle(
                fontSize: 15,
                ),
                ),
                ) ,
               )
              )
            ],
          ),
          ),
        );
  }
