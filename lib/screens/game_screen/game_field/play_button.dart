import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final void Function() toStart;
  const PlayButton({required this.toStart});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: toStart,
      label: Text(
        "New Game",
        style: TextStyle(color: Colors.white54, fontSize: 18),
      ),
      backgroundColor: Colors.grey[700],
    );
  }
}
