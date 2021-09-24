import 'package:flutter/material.dart';
import 'package:snake/components/rounded_dialog.dart';
import 'package:snake/components/rounded_dialog_button.dart';

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
    return RoundedDialog(
      head: Image.asset("assets/img/scull.jpeg"),
      body: Column(children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            resultScore.toString(),
            style: TextStyle(
              color: Colors.grey[350],
              fontSize: 40,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.white70,
                  offset: Offset(0, -5),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
        Row(children: <Widget>[
          BeveledDialogButton(
            title: "Home",
            backgroundColor: Colors.red[900],
            onPressed: onHome,
          ),
          BeveledDialogButton(
            title: "Restart",
            backgroundColor: Colors.green[900],
            onPressed: onPlay,
          ),
        ])
      ]),
    );
  }
}
