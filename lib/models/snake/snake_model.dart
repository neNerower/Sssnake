import 'dart:math';
import 'package:snake/globals/globals.dart';
import 'direction.dart';

class SnakeModel {
  List<int> _body = [];
  late Direction _direction;
  bool _isEating = false;

  SnakeModel({int length = 5}) {
    Random random = new Random();

    // Get random direction to start moving
    int index = random.nextInt(Direction.values.length);
    this._direction = Direction.values[index];

    // Get random start head position
    int hCoeff = length + random.nextInt(fieldWidth - 2 * length);
    int vCoeff = length + random.nextInt(fieldHeight - 2 * length);
    int tailPosition = hCoeff * vCoeff;

    // Fill snake body
    int bodyCoeff = _getBodyCoeff(this._direction);
    this._body = List.generate(length, (int i) => tailPosition + i * bodyCoeff);
  }

  // Count coefficient to fill snake body list
  int _getBodyCoeff(Direction direction) {
    switch (direction) {
      case Direction.up:
        return -fieldWidth;
      case Direction.down:
        return fieldWidth;
      case Direction.left:
        return -1;
      case Direction.right:
        return 1;
    }
  }

  // Snake moves every game tick
  void move() {
    switch (_direction) {
      // Going up
      case Direction.up:
        if (head <= fieldWidth) {
          // Go throuth up wall to down
          _body.add(head + fieldWidth * (fieldHeight - 1));
        } else {
          _body.add(head - fieldWidth);
        }
        break;

      // Going down
      case Direction.down:
        if (head >= fieldWidth * (fieldHeight -1)) {
          // Go throuth down wall to up
          _body.add(head - fieldWidth * (fieldHeight - 1));
        } else {
          _body.add(head + fieldWidth);
        }        
        break;

      // Going left
      case Direction.left:
        if (head % fieldWidth == 0) {
          // Go throuth left wall to right
          _body.add(head + fieldWidth - 1);
        } else {
          _body.add(head - 1);
        }
        break;

      // Going right
      case Direction.right:
          // Go throuth right wall to left
        if (head % fieldWidth == fieldWidth - 1) {
          _body.add(head - fieldWidth + 1);
        } else {
          _body.add(head + 1);
        }
        break;
    }

    // If is eating now
    if (_isEating) {
      _isEating = false;
      return;
    }

    // Snake leave the last field
    _body.removeAt(0);
  }

  // When snake find apple
  void eat() {
    _isEating = true;
  }
  
  // Check the head does not cross the body
  bool get isAlive => 
    _body.indexOf(head) == _body.length -1;

  // Snake head position
  int get head => _body.last;

  // Snake`s body
  List<int> get body => _body;

  // Moving direction
  Direction get direction => _direction;
  set direction(Direction direction) => _direction = direction;

}
