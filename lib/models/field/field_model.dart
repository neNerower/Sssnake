import 'dart:math';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/snake/snake_model.dart';

class FieldModel {
  SnakeModel _snake = SnakeModel(length: 0);
  int _apple = -1;

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
    if (_snake.head == _apple) {
      _snake.eat();
      _generateNewApple();
    }
  }

  SnakeModel get snake => _snake;
  
  // Apple position
  int get apple => _apple;

  // Game score
  int get score => _snake.body.length - 5;
}
