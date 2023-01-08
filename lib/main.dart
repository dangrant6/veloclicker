import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'clicker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('imgs/baseballP.png'),
        nextScreen: VeloPage(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.deepPurple,
        //pageTransitionType: pageTransitionType.scale,
        //home: LoginPage(),
      ),
    );
  }
}
