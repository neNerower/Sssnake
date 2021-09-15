import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  final Color color;
  const Caption({this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        children: <Widget>[
          Text(
            "Made by",
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w300),
          ),
          Text(
            "NEROWER",
            style: TextStyle(
                color: color, fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
