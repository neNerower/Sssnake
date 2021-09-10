import 'dart:math';
import 'package:snake/globals/globals.dart';
import 'direction.dart';

class SnakeModel {
  List<int> _body = [];
  late Direction _direction;

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

  Direction getDirection() {
    return this._direction;
  }
  void setDirection(Direction direction) {
    this._direction = direction;
  }
}
