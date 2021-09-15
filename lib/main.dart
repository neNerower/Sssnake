import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake/screens/game_screen/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'S-s-snake',
      home: GameScreen(),
    );
  }
}
