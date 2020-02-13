import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final int size;
  final IconData icon;
  final Color color;
  final Function onTap;
  CircleIcon({this.size, @required this.icon, this.color, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(60.0)),
      color: color ?? Colors.red[600],
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        radius: 25,
        onTap: onTap,
        // highlightColor: Colors.red,
        child: Container(
          width: size ?? 36,
          height: size ?? 36,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}