import 'package:flutter/material.dart';
import 'package:snake/screens/game_screen/game_field/cell.dart';

class SnakeLogo extends StatelessWidget {
  final int side;
  SnakeLogo({this.side = 100});

  final List<int> _snake = [
    8,
    9,
    10,
    11,
    12,
    15,
    19,
    22,
    25,
    26,
    29,
    36,
    37,
    38,
    39,
    40
  ];
  final int _apple = 24;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
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
                return Cell(color: Colors.grey[850]);
              }
            },
          ),
        ),
        Text(
          "S-s-snake",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
