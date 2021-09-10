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
    int hCoeff = length + random.nextInt(fieldWidth - length);
    int vCoeff = length + random.nextInt(fieldHeight - length);
    int headPosition = hCoeff * vCoeff;

    // Fill snake body
    int bodyCoeff = _getBodyCoeff(this._direction);
    this._body = List.generate(length, (int i) => headPosition + i * bodyCoeff);
  }

  // Count coefficient to fill snake body list
  int _getBodyCoeff(Direction direction) {
    switch (direction) {
      case Direction.up:
        return fieldWidth;
      case Direction.down:
        return -fieldWidth;
      case Direction.left:
        return 1;
      case Direction.right:
        return -1;
    }
  }

  // Snake moves every game tick
  void move() {
    switch (_direction) {
      // Going up
      case Direction.up:
        if (getHead() > fieldWidth * (fieldWidth -1)) {
          // Go throuth up wall to down
          _body.add(getHead() - fieldWidth * (fieldWidth - 1));
        } else {
          _body.add(getHead() + fieldWidth);
        }
        break;

      // Going down
      case Direction.down:
        if (getHead() < fieldWidth) {
          // Go throuth down wall to up
          _body.add(getHead() + fieldWidth * (fieldWidth - 1));
        } else {
          _body.add(getHead() - fieldWidth);
        }        
        break;

      // Going left
      case Direction.left:
        if (getHead() % fieldWidth == 0) {
          // Go throuth left wall to right
          _body.add(getHead() + fieldWidth - 1);
        } else {
          _body.add(getHead() - 1);
        }
        break;

      // Going right
      case Direction.right:
          // Go throuth right wall to left
        if (getHead() % fieldWidth == fieldWidth - 1) {
          _body.add(getHead() - fieldWidth + 1);
        } else {
          _body.add(getHead() + 1);
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

  // Is snake alive
  bool isAlive() {
    // Check the head does not cross the body
    return _body.indexOf(getHead()) == _body.length -1;
  }

  // Get snake head position
  int getHead() {
    return _body.last;
  }
  // Get snake`s body
  List<int> getBody() {
    return _body;
  }

  Direction getDirection() {
    return this._direction;
  }
  void setDirection(Direction direction) {
    this._direction = direction;
  }
}
