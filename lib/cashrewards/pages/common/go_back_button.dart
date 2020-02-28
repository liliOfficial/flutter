import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Function onPressed;
  GoBackButton({this.backgroundColor, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      onPressed: this.onPressed ?? () => Navigator.pop(context),
      child: Icon(icon ?? Icons.arrow_back),
    );
  }
}
