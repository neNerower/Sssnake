import 'package:flutter/material.dart';
import 'package:snake/components/beveled_dialog_button.dart';
import 'package:snake/components/rounded_dialog.dart';

class BaseGameDialog extends StatelessWidget {
  final String title;
  final String imagePath;
  final int score;
  final String playTitle;
  final void Function() onHome;
  final void Function() onPlay;

  const BaseGameDialog({
    this.title = "",
    required this.imagePath,
    required this.score,
    required this.playTitle,
    required this.onHome,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedDialog(
      head: Image.asset(imagePath),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey[350],
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              score.toString(),
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
          Spacer(),
          Row(children: <Widget>[
            BeveledDialogButton(
              title: "Home",
              backgroundColor: Colors.red[900],
              onPressed: onHome,
            ),
            BeveledDialogButton(
              title: playTitle,
              backgroundColor: Colors.green[900],
              onPressed: onPlay,
            ),
          ])
        ],
      ),
    );
  }
}
