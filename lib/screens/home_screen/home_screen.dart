import 'package:flutter/material.dart';
import 'package:snake/screens/home_screen/play_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Go to game screen
  void _startPlaying(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/game');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: PlayButton(
          toStart: () => _startPlaying(context),
        ),
      ),
    );
  }
}
