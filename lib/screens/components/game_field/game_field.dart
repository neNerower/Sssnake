import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/field/field_model.dart';
import 'package:snake/models/snake/direction.dart';

import 'cell.dart';

class GameField extends StatelessWidget {
  final FieldModel fieldModel;
  const GameField({required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Detector to handle screen swipes
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (fieldModel.getSnake().getDirection() != Direction.down &&
              details.delta.dy < 0) {
            // Turn UP
            fieldModel.getSnake().setDirection(Direction.up);
          } else if (fieldModel.getSnake().getDirection() != Direction.up &&
              details.delta.dy > 0) {
            // Turn DOWN
            fieldModel.getSnake().setDirection(Direction.down);
          }
        },
        onHorizontalDragUpdate: (details) {
          if (fieldModel.getSnake().getDirection() != Direction.right &&
              details.delta.dx < 0) {
            // Turn LEFT
            fieldModel.getSnake().setDirection(Direction.left);
          } else if (fieldModel.getSnake().getDirection() != Direction.left &&
              details.delta.dx > 0) {
            // Turn RIGHT
            fieldModel.getSnake().setDirection(Direction.right);
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
            if (fieldModel.getSnake().getBody().contains(index)) {
              return Cell(color: Colors.white);
            } else if (fieldModel.getApple() == index) {
              return Cell(color: Colors.green);
            } else {
              return Cell(color: Colors.grey[900]);
            }
          },
        ),
      ),
    );
  }
}
