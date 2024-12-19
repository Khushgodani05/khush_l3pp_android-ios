import 'package:flutter/material.dart';
import 'package:pixel_colour/view_model/pixel_art_view_model.dart';
import 'package:pixel_colour/widgets/pixel_art_grid_view_item.dart';
import 'package:provider/provider.dart';

class PixelArtGridView extends StatelessWidget {
  const PixelArtGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final list=context.watch<PixelArtViewModel>().list;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 24,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ), 
      itemCount: list.length,
      itemBuilder: (context,index){
        final pixel=list[index];
        return PixelArtGridViewItem(
          model: pixel, 
          onTap: (){
            context.read<PixelArtViewModel>().paintPixelEvent(index);
          },
          );
      },
      );
  }
}