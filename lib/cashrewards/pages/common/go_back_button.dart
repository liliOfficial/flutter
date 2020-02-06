import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final backgroundColor;
  GoBackButton({this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: backgroundColor??Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back),
    );
  }
}
