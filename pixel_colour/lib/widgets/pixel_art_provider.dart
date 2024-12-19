import 'package:flutter/material.dart';
import 'package:pixel_colour/view_model/pixel_art_view_model.dart';
import 'package:pixel_colour/widgets/pixel_art_screen.dart';
import 'package:provider/provider.dart';

class PixelArtProvider extends StatelessWidget {
  const PixelArtProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (content)=>PixelArtViewModel(),
      child: const PixelArtScreen(),
      );
  }
}