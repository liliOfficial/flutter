import 'package:flutter/material.dart';

class LineButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Function onPressed;

  LineButton({@required this.text, this.color, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color defaultColor = Colors.grey;
    return OutlineButton(
      padding: EdgeInsets.symmetric(vertical: 11),
      borderSide: BorderSide(
        color: color ?? defaultColor,
        width: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if ((icon ?? '') != '') Icon(icon),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: color ?? defaultColor,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
