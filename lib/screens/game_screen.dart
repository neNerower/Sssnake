import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/field/field_model.dart';
import 'package:snake/screens/components/game_field/game_field.dart';
import 'package:snake/screens/components/play_button.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final FieldModel _fieldModel = FieldModel();

  // Game running statis
  bool _isGameRunning = false;

  void runGame() {
    // Change game running status
    _isGameRunning = true;

    // Get random start field state
    _fieldModel.initStartState();

    // Start updating timer
    var duration = Duration(milliseconds: (400 - speedLvl.index * 100));
    Timer.periodic(duration, (Timer timer) {
      setState(() => _fieldModel.update());

      // If snake is dead
      if (!_fieldModel.getSnake().isAlive()) {
        timer.cancel();
        _isGameRunning = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            GameField(fieldModel: _fieldModel),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !_isGameRunning
            ? StartButton(
                toStart: runGame,
              )
            : null,
      ),
    );
  }
}
