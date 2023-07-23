import 'package:flutter/material.dart';



class ImagePositionedWidget extends StatelessWidget {
  const ImagePositionedWidget({
    this.bottom,
    this.left,
    this.right,
    this.top,
    this.colorShadow,
    this.blendModeColor,

  });

 final double? bottom ;
  final double? left ;
  final double? right ;
  final double? top ;
final Color? colorShadow ;
final BlendMode? blendModeColor ;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      top: top,
      child: Image.asset('assets/images/icon_farza.png',color:colorShadow ,colorBlendMode:blendModeColor ,),



    );
  }
}