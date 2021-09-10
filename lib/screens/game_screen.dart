import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/snake/direction.dart';
import 'package:snake/models/snake/snake_model.dart';
import 'package:snake/models/speed.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Getting snake
  final SnakeModel snake = SnakeModel();

  // Getting apple
  static var random = Random();
  int apple = random.nextInt(fieldWidth * fieldHeight);
  void _generateNewApple() {
    apple = random.nextInt(fieldWidth * fieldHeight);
  }

  // Runnig game process
  void rumGame({Speed speed = Speed.normal}) {
    var duration = Duration(milliseconds: (400 - speed.index * 100));
    Timer.periodic(duration, (Timer timer) {
      _updateField();

      // If snake is dead then cansel game
      if (!snake.isAlive()) {
        timer.cancel();
        // _showGameOverScreen();
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
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (snake.getDirection() != Direction.down && details.delta.dy > 0) {
                    // Turn UP
                    snake.setDirection(Direction.up);
                  } else if (snake.getDirection() != Direction.up && details.delta.dy < 0) {
                    // Turn DOWN
                    snake.setDirection(Direction.down);
                  }
                },
                onHorizontalDragUpdate: (details) {
                   if (snake.getDirection() != Direction.right && details.delta.dx < 0) {
                    // Turn LEFT
                    snake.setDirection(Direction.left);
                  } else if (snake.getDirection() != Direction.left && details.delta.dx > 0) {
                    // Turn RIGHT
                    snake.setDirection(Direction.right);
                  }
                },
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: fieldHeight * fieldWidth,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: fieldWidth,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                        
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
