
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.color,
    this.iconButtonLeading,
    required this.iconButtonAction ,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final IconButton? iconButtonLeading ;
  final Widget iconButtonAction  ;
  final Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return AppBar(

      centerTitle: true,
      elevation: 0,
      backgroundColor:color ,
      leading: iconButtonLeading,
      actions: [
        iconButtonAction,
      ],
      title: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_text.png',width: 23.0,height: 27.0,),
            const SizedBox(width: 5,),
            const Text('Q',style: TextStyle(color: Color(0xFF40B2E1),fontSize: 20.0,),),
            const Text('uote Maker',style: TextStyle(color: Colors.white,fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size(double.infinity, 50);
}
