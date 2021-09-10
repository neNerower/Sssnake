import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Color? color;
  const Cell({required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(color: color),
        ),
      ),
    );
  }
}
