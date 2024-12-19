import 'package:flutter/material.dart';
import 'package:pixel_colour/model/pixel_model.dart';

class PixelArtGridViewItem extends StatelessWidget {
  const PixelArtGridViewItem({super.key,
  required this.model,
  required this.onTap,
  });

  final VoidCallback onTap;
  final PixelModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 10,
        height: 10,
        color: getColor(),
      ),
    );
  }


  Color? getColor(){
    if(model.colour==null)
    {
      return Colors.black;
    }
    return model.colour;
  }
}