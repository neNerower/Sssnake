import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/field/field_model.dart';
import 'package:snake/models/snake/direction.dart';
import 'package:snake/screens/game_screen/game_field/game_field.dart';
import 'package:snake/screens/game_screen/game_field/play_button.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final FieldModel _fieldModel = FieldModel();

  // Game running statis
  bool _isGameRunning = false;

  void playGame() {
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
            Expanded(
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (_fieldModel.getSnake().getDirection() != Direction.down &&
                      details.delta.dy < 0) {
                    // Turn UP
                    _fieldModel.getSnake().setDirection(Direction.up);
                  } else if (_fieldModel.getSnake().getDirection() != Direction.up &&
                      details.delta.dy > 0) {
                    // Turn DOWN
                    _fieldModel.getSnake().setDirection(Direction.down);
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (_fieldModel.getSnake().getDirection() != Direction.right &&
                      details.delta.dx < 0) {
                    // Turn LEFT
                    _fieldModel.getSnake().setDirection(Direction.left);
                  } else if (_fieldModel.getSnake().getDirection() != Direction.left &&
                      details.delta.dx > 0) {
                    // Turn RIGHT
                    _fieldModel.getSnake().setDirection(Direction.right);
                  }
                },
                child: GameField(fieldModel: _fieldModel),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !_isGameRunning
            ? PlayButton(
                toStart: playGame,
              )
            : null,
      ),
    );
  }
}
