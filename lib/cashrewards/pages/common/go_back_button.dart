import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back),
    );
  }
}
