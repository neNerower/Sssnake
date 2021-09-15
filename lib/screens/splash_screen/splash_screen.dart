import 'package:flutter/material.dart';
import 'package:snake/screens/game_screen/game_screen.dart';
import 'package:snake/screens/splash_screen/caption.dart';

import 'snake_logo.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  // Go to main screen after duration
  void _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            SnakeLogo(),
            Spacer(),
            Caption()
          ],
        ),
      ),
    );
  }
}
