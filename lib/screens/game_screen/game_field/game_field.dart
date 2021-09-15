import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/field/field_model.dart';
import 'package:snake/screens/game_screen/game_field/snake_gesturer.dart';

import 'cell.dart';

class GameField extends StatelessWidget {
  final FieldModel fieldModel;
  const GameField({required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    fieldHeight = fieldWidth ~/ MediaQuery.of(context).size.aspectRatio;

    return Expanded(
      child: SnakeGesturer(
        snake: fieldModel.getSnake(),
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
