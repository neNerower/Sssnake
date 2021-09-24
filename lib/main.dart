import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake/screens/splash_screen/splash_screen.dart';

import 'screens/game_screen/game_screen.dart';

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
        '/game': (context) => GameScreen(),
      },
    );
  }
}
