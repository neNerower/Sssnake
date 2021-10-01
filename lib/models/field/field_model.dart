import 'dart:math';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/snake/snake_model.dart';

class FieldModel {
  SnakeModel _snake = SnakeModel(length: 0);
  int _apple = -1;

  // Getting apple
  static Random _random = Random();
  static int _size = 0;
  Set<int> _allPositions = {};
  List<int> _emptyPositions = [];

  void _generateNewFood() {
    _emptyPositions = List.of(_allPositions.difference(Set.of(_snake.body)));
    _apple = _emptyPositions[_random.nextInt(_emptyPositions.length)];
  }

  // Start game state
  void initStartState() {
    // For food generating
    _size = fieldWidth * fieldHeight;
    _allPositions = Set.of(List<int>.generate(_size, (i) => i));

    // Init game data
    _snake = SnakeModel();
    _generateNewFood();
  }

  // Update field state
  void update() {
    _snake.move();
    // Eating process
    if (_snake.head == _apple) {
      _snake.eat();
      _generateNewFood();
    }
  }

  SnakeModel get snake => _snake;

  // Apple position
  int get apple => _apple;

  // Game score
  int get score => _snake.body.length - 5;
}
