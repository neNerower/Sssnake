import 'package:flutter/material.dart';

import 'base_game_dialog.dart';

class GameOverDialog extends StatelessWidget {
  final int resultScore;
  final void Function() onHome;
  final void Function() onPlay;

  const GameOverDialog({
    required this.resultScore,
    required this.onHome,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return BaseGameDialog(
      imagePath: "assets/img/scull.jpeg",
      title: "Game over",
      playTitle: "Restart",
      score: resultScore,
      onHome: onHome,
      onPlay: onPlay,
    );
  }
}
