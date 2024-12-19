import 'package:flutter/material.dart';
import 'package:pixel_colour/widgets/pixel_art_grid_view_builder.dart';

class PixelArtScreen extends StatelessWidget {
  const PixelArtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pixel Art"),
        actions: [
          Icon(Icons.color_lens_rounded)
        ],
      ),
      body: PixelArtGridView(),
    );
  }
}