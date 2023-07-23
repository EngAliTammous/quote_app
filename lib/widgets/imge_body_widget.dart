
import 'package:flutter/material.dart';

class ImageBodyWidget extends StatefulWidget {
  const ImageBodyWidget({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String imageUrl ;

  @override
  State<ImageBodyWidget> createState() => _ImageBodyWidgetState();
}

class _ImageBodyWidgetState extends State<ImageBodyWidget> {



  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      //alignment: Alignment.center,
      padding:const EdgeInsets.all(8.0),
      height:500,
      decoration:  const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),

        ),
        //backgroundBlendMode: BlendMode.exclusion,
      ),
      child: Center(child:Image.network(widget.imageUrl,fit: BoxFit.cover,height: double.maxFinite,width: double.maxFinite,),),
    );
  }
}
