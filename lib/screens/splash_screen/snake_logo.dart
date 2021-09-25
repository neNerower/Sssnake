import 'package:flutter/material.dart';

class SnakeLogo extends StatelessWidget {
  final double side;
  SnakeLogo({this.side = 100});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/logo.jpg',
          height: side,
          width: side,
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
