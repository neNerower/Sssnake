import 'package:flutter/material.dart';

class GameAppBar extends StatelessWidget {
  final int score;
  final bool isGameRunning;
  final void Function() onPaused;
  
  const GameAppBar({
    required this.score,
    required this.isGameRunning,
    required this.onPaused,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "${score > 0 ? score : 0}",
        style: TextStyle(
          color: Colors.grey[350],
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.grey[350]),
      actions: <Widget>[
        Center(
          child: isGameRunning
              ? IconButton(
                  onPressed: onPaused,
                  iconSize: 32,
                  icon: Icon(Icons.pause),
                )
              : null,
        ),
      ],
    );
  }
}
