import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/snake/direction.dart';
import 'package:snake/models/snake/snake_model.dart';
import 'package:snake/models/speed.dart';
import 'package:snake/screens/components/play_button.dart';

import 'components/cell.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  SnakeModel snake = SnakeModel(length: 0);
  int apple = 0;

  // Getting apple
  static var random = Random();
  void _generateNewApple() {
    apple = random.nextInt(fieldWidth * fieldHeight);
  }

  // Starting game process
  void startGame({Speed speed = Speed.normal}) {
    // Init game data
    SnakeModel snake = SnakeModel();
    _generateNewApple();

    // Start updating timer
    var duration = Duration(milliseconds: (400 - speed.index * 100));
    Timer.periodic(duration, (Timer timer) {
      _updateField();

      // If snake is dead
      if (!snake.isAlive()) {
        timer.cancel();
      }
    });
  }

  // Update field state
  void _updateField() {
    setState(() {
      snake.move();
      // Eating process
      if (snake.getHead() == apple) {
        snake.eat();
        _generateNewApple();
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
                  if (snake.getDirection() != Direction.down &&
                      details.delta.dy < 0) {
                    // Turn UP
                    snake.setDirection(Direction.up);
                  } else if (snake.getDirection() != Direction.up &&
                      details.delta.dy > 0) {
                    // Turn DOWN
                    snake.setDirection(Direction.down);
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (snake.getDirection() != Direction.right &&
                      details.delta.dx < 0) {
                    // Turn LEFT
                    snake.setDirection(Direction.left);
                  } else if (snake.getDirection() != Direction.left &&
                      details.delta.dx > 0) {
                    // Turn RIGHT
                    snake.setDirection(Direction.right);
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
                    if (snake.getBody().contains(index)) {
                      return Cell(color: Colors.white);
                    } else if (apple == index) {
                      return Cell(color: Colors.green);
                    } else {
                      return Cell(color: Colors.grey[850]);
                    }
                  },
                ),
              ),
            ),
            // Control bar
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StartButton(toStart: () => startGame()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
