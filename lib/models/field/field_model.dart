import 'dart:math';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/snake/snake_model.dart';

class FieldModel {
  SnakeModel _snake = SnakeModel(length: 0);
  int _apple = -1;
  int _score = 0;

  // Getting apple
  static var random = Random();
  void _generateNewApple() {
    _apple = random.nextInt(fieldWidth * fieldHeight);
  }

  void initStartState() {
    // Init game data
    _snake = SnakeModel();
    _generateNewApple();
  }

  // Update field state
  void update() {
    _snake.move();
    // Eating process
    if (_snake.getHead() == _apple) {
      _snake.eat();
      _score++;
      _generateNewApple();
    }
  }

  SnakeModel getSnake() {
    return _snake;
  }

  int getApple() {
    return _apple;
  }

  int getScore() {
    return _score;
  }
}
