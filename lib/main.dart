import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/game_screen/game_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'S-s-snake',
      // debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/game': (context) => GameScreen(),
      },
    );
  }
}
