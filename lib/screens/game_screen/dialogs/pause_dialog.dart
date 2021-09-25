import 'package:flutter/material.dart';

import 'base_game_dialog.dart';

class PauseDialog extends StatelessWidget {
  final int score;
  final void Function() onHome;
  final void Function() onPlay;

  const PauseDialog({
    required this.score,
    required this.onHome,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return BaseGameDialog(
      imagePath: "assets/img/apple.jpg",
      title: "Pause",
      playTitle: "Resume",
      score: score,
      onHome: onHome,
      onPlay: onPlay,
    );
  }
}