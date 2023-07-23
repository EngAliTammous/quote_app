import 'package:flutter/material.dart';


class BottomSheetsWidget extends StatelessWidget {
  const BottomSheetsWidget({
    required this.widget,
    Key? key,
  }) : super(key: key);
final Widget widget ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ,
      height:101.0 ,
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(

          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),

        ),

      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
widget,
        ],

      ),

    );
  }
}

