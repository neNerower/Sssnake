import 'package:flutter/material.dart';

import 'base_game_dialog.dart';

class PauseDialog extends StatelessWidget {
  final int score;
  final void Function() onResume;

  const PauseDialog({
    required this.score,
    required this.onResume,
  });

  @override
  Widget build(BuildContext context) {
    return BaseGameDialog(
      imagePath: "assets/img/apple.jpg",
      title: "Pause",
      playTitle: "Resume",
      score: score,
      onPlay: onResume,
    );
  }
}