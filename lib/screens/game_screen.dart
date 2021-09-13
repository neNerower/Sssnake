import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/game_field/game_field.dart';
import 'package:snake/models/snake/direction.dart';
import 'package:snake/screens/components/play_button.dart';

import 'components/cell.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameField field = GameField();

  // Game running statis
  bool _isGameRunning = false;

  void runGame() {
    // Change game running status
    _isGameRunning = true;

    // Get random start field state
    field.initStartState();

    // Start updating timer
    var duration = Duration(milliseconds: (400 - speedLvl.index * 100));
    Timer.periodic(duration, (Timer timer) {
      setState(() => field.update());

      // If snake is dead
      if (!field.getSnake().isAlive()) {
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
              // Detector to handle screen swipes
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (field.getSnake().getDirection() != Direction.down &&
                      details.delta.dy < 0) {
                    // Turn UP
                    field.getSnake().setDirection(Direction.up);
                  } else if (field.getSnake().getDirection() != Direction.up &&
                      details.delta.dy > 0) {
                    // Turn DOWN
                    field.getSnake().setDirection(Direction.down);
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (field.getSnake().getDirection() != Direction.right &&
                      details.delta.dx < 0) {
                    // Turn LEFT
                    field.getSnake().setDirection(Direction.left);
                  } else if (field.getSnake().getDirection() != Direction.left &&
                      details.delta.dx > 0) {
                    // Turn RIGHT
                    field.getSnake().setDirection(Direction.right);
                  }
                },
                // Creating field veiw
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: fieldHeight * fieldWidth,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: fieldWidth,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (field.getSnake().getBody().contains(index)) {
                      return Cell(color: Colors.white);
                    } else if (field.getApple() == index) {
                      return Cell(color: Colors.green);
                    } else {
                      return Cell(color: Colors.grey[900]);
                    }
                  },
                ),
              ),
            ),
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
