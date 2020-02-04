import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 100,
      child: Container(
        width: double.infinity,
        height: 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(1, 0),
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFF3023AE),
              Color(0xFF8700D7),
            ],
          ),
        ),
      ),
    );
  }
}
