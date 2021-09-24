import 'package:flutter/material.dart';
import 'package:snake/models/snake/direction.dart';
import 'package:snake/models/snake/snake_model.dart';

class SnakeGesturer extends StatelessWidget {
  final SnakeModel snake;
  final GridView child;

  const SnakeGesturer({required this.snake, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: child,
    );
  }
}
