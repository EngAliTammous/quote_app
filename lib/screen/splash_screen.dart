import 'package:flutter/material.dart';

import '../widgets/icon_text_container.dart';
import '../widgets/splash_image_positioned.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/splash2_screen');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(68, 68, 68, 1.0) ,
      body: Stack(
        children: [
            const IconTextContainerWidget(),
          // left screen
            const ImagePositionedWidget(
              bottom: -160,
              left: -50,
              // -160 -50
            ),
            ImagePositionedWidget(
              bottom: -148,
              left: -65,
              colorShadow: Colors.white.withOpacity(0.3),
              blendModeColor: BlendMode.modulate,
              // -160 -50
            ),
          // right screen
          const ImagePositionedWidget(
            bottom: -160,
            right: -65,
            // -160 -50
          ),
          ImagePositionedWidget(
            bottom: -152,
            right: -80,
            colorShadow: Colors.white.withOpacity(0.3),
            blendModeColor: BlendMode.modulate,
            // -160 -50
          ),
        ],
      ),
    );
  }
}
