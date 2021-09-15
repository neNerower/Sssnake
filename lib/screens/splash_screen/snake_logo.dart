import 'package:flutter/material.dart';
import 'package:snake/screens/game_screen/game_field/cell.dart';

class SnakeLogo extends StatelessWidget {
  final int side;
  SnakeLogo({this.side = 100});

  final List<int> _snake = [
    9, 10, 11, 12, 13,
    16, 20,
    23, 26, 27,
    30,
    37, 38, 39, 40, 41, 42
  ];
  final int _apple = 24;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (_snake.contains(index)) {
            return Cell(color: Colors.white);
          } else if (index == _apple) {
            return Cell(color: Colors.green);
          } else {
            return Cell(color: Colors.grey[900]);
          }
        },
      ),
    );
  }
}
