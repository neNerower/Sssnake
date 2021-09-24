import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/field/field_model.dart';
import 'package:snake/screens/game_screen/components/game_app_bar.dart';

import 'components/game_field/game_field.dart';
import 'dialogs/game_over_dialog.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final FieldModel _fieldModel = FieldModel();
  late Timer _gameTimer;
  // Game running statis
  bool _isGameRunning = false;

  // Sterting game
  void startGame() {
    // Get random start field state
    _fieldModel.initStartState();
    _play();
  }

  // Pause game
  void _pauseGame() {
    _gameTimer.cancel();
    _isGameRunning = false;

    // TODO: show dialog to end / continue game
  }

  // Play the game from current state
  void _play() {
    // Change game running status
    _isGameRunning = true;
    // Start updating timer
    var duration = Duration(milliseconds: (400 - speedLvl.index * 100));
    _gameTimer = Timer.periodic(duration, (Timer timer) {
      setState(() => _fieldModel.update());

      // Game over
      if (!_fieldModel.getSnake().isAlive()) {
        _gameOver();
      }
    });
  }

  // Game over
  void _gameOver() {
    _gameTimer.cancel();
    _isGameRunning = false;
    
    showDialog(context: context, builder: (BuildContext context) {
      return GameOverDialog(resultScore: _fieldModel.getScore(), onHome: () {}, onPlay: startGame);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: GameAppBar(
          score: _fieldModel.getScore(),
          isGameRunning: _isGameRunning,
          onPaused: _pauseGame,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          GameField(fieldModel: _fieldModel),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: !_isGameRunning
      //     ? PlayButton(
      //         toStart: startGame,
      //       )
      //     : null,
    );
  }
}
