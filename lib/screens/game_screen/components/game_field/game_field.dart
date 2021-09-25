import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/field/field_model.dart';

import 'cell.dart';
import 'snake_gesturer.dart';

class GameField extends StatelessWidget {
  final FieldModel fieldModel;
  final double indent;

  const GameField({
    required this.fieldModel,
    this.indent = 0,
  });

  @override
  Widget build(BuildContext context) {
    fieldHeight = fieldWidth ~/ MediaQuery.of(context).size.aspectRatio - indent.ceil();

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
