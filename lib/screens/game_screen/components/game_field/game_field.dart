import 'package:flutter/material.dart';
import 'package:snake/globals/globals.dart';
import 'package:snake/models/field/field_model.dart';

import 'cell.dart';
import 'snake_gesturer.dart';

class GameField extends StatefulWidget {
  final FieldModel fieldModel;
  
  const GameField({
    required this.fieldModel,
  });

  @override
  _GameFieldState createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SnakeGesturer(
        snake: widget.fieldModel.snake,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: fieldHeight * fieldWidth,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: fieldWidth,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (widget.fieldModel.snake.body.contains(index)) {
              return Cell(color: Colors.white);
            } else if (widget.fieldModel.apple == index) {
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
