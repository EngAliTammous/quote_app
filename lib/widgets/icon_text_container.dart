import 'package:flutter/material.dart';


class IconTextContainerWidget extends StatelessWidget {
  const IconTextContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/icon_text.png'),
        const SizedBox(width: 15,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children:const [
                Text('Q',style: TextStyle(
                  color: Color(0xFF40B2E1),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),),
                Text('uote Maker',style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
            const SizedBox(height: 5.0,),
            Row(
              children:const [
                Text('Generating random quotes',style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFF3F3F3),


                ),)
              ],
            ),
          ],
        ),
      ],
    );
  }
}


