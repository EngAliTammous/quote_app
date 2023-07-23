import 'package:flutter/material.dart';
import 'package:quote_app/screen/final_screen.dart';
import 'package:quote_app/screen/home_screen.dart';
import 'package:quote_app/screen/splash2_screen.dart';
import 'package:quote_app/screen/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/splash2_screen': (context) => const Splash2Screen(),
        '/home_screen':(context)=>const HomeScreen(),
        '/final_screen':(context)=>   FinalScreen(content: '',imageUrl: ''),
      },
    );
  }
}
