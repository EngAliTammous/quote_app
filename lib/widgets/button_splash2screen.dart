import 'package:flutter/material.dart';

class ButtonSplash2ScreenWidget extends StatelessWidget {
  const ButtonSplash2ScreenWidget({

    this.colorButton = const Color(0xFF00BBFF),
    required this.textButton,
     this.onPressed,
this.border,
    Key? key}) : super(key: key);
final Color colorButton  ;
final String textButton ;
final BoxBorder? border ;
final Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
        onPressed: onPressed,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 54.0,
          width: 204.0,
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius:const BorderRadius.only(
              topLeft:Radius.circular(20.0) ,
              bottomRight:Radius.circular(20.0) ,
            ),

            border: border,

          ),
   child: Center(
         child: Text(textButton,style:const TextStyle(
           fontSize: 16.0,
           color: Colors.white,
         ),),
   ),

        ),
      ),
    );
  }
}
