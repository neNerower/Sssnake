import 'package:flutter/material.dart';

class RoundedDialogButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final void Function() onPressed;

  const RoundedDialogButton({
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: backgroundColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[350],
          fontSize: 20,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        onPressed();
      },
    );
  }
}
