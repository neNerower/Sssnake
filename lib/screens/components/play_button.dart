import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final Function toStart;
  const StartButton({required this.toStart});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      onPressed: () => toStart,
      child: const Text('New Game'),
    );
  }
}
