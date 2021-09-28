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
        if (snake.direction != Direction.down &&
            details.delta.dy < 0) {
          // Turn UP
          snake.direction = Direction.up;
        } else if (snake.direction != Direction.up &&
            details.delta.dy > 0) {
          // Turn DOWN
          snake.direction = Direction.down;
        }
      },
      onHorizontalDragUpdate: (details) {
        if (snake.direction != Direction.right &&
            details.delta.dx < 0) {
          // Turn LEFT
          snake.direction = Direction.left;
        } else if (snake.direction != Direction.left &&
            details.delta.dx > 0) {
          // Turn RIGHT
          snake.direction = Direction.right;
        }
      },
      child: child,
    );
  }
}
