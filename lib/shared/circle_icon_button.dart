import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Color wordColor;
  final Color backgroundColor;
  final IconData icon;
  final Function onPressed;

  CircleIconButton(
      {this.wordColor, this.backgroundColor, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: backgroundColor??Theme.of(context).accentColor,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: wordColor,
        onPressed: onPressed,
      ),
    );
  }
}
