import 'package:flutter/material.dart';

class RoundedDialog extends StatelessWidget {
  final double _padding = 20;
  final double _imgRadius = 45;
  final Widget head;
  final Widget body;

  const RoundedDialog({required this.head, required this.body});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: _padding,
              top: _imgRadius + _padding,
              right: _padding,
              bottom: _padding,
            ),
            margin: EdgeInsets.only(top: _imgRadius),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(_padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.white70,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                )
              ],
            ),
            child: body,
          ),
          Positioned(
            left: _padding,
            right: _padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: _imgRadius,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(_imgRadius)),
                child: head,
              ),
            )
          )
        ],
      ),
    );
  }
}