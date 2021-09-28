import 'package:flutter/material.dart';

import 'base_game_dialog.dart';

class GameOverDialog extends StatelessWidget {
  final int resultScore;
  final void Function() onRestart;

  const GameOverDialog({
    required this.resultScore,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return BaseGameDialog(
      imagePath: "assets/img/scull.jpeg",
      title: "Game over",
      playTitle: "Restart",
      score: resultScore,
      onPlay: onRestart,
    );
  }
}
