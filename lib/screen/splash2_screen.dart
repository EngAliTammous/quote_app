import 'package:flutter/material.dart';
import 'package:quote_app/widgets/button_splash2screen.dart';

import '../widgets/icon_text_container.dart';
import '../widgets/splash_image_positioned.dart';



class Splash2Screen extends StatelessWidget {
  const Splash2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 68, 68, 1.0),
      body: Stack(
        children: [


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

               Center(

            child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                 ButtonSplash2ScreenWidget(textButton: 'Open App',onPressed: (){
                  Navigator.pushNamed(context, '/home_screen');
                },),
                ButtonSplash2ScreenWidget(textButton: 'Share App',
                  colorButton: Colors.transparent,
                  border: Border.all(color:Colors.white ,width: 2.0 ),
                ),
                ButtonSplash2ScreenWidget(textButton: 'Rate App',
                  border: Border.all(color:Colors.white ,width: 2.0 ),
                  colorButton: Colors.transparent,
                ),
                ButtonSplash2ScreenWidget(textButton: 'More App',
                  border: Border.all(color:Colors.white ,width: 2.0 ),
                  colorButton: Colors.transparent,
                ),


              ],
            ),
          ),

               const Positioned(
               right: 50,
               left: 50,
               top: 150,

               child:IconTextContainerWidget(), ) ,












            ],

      ),
    );
  }
}

