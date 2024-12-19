import 'package:flutter/material.dart';
import 'package:pixel_colour/widgets/pixel_art_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PixelArtProvider(),
    );
  }
}