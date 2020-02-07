import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final IconData icon;
  final Function onPressed;
  ColorButton(
      {@required this.text, this.backgroundColor, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor ?? Theme.of(context).accentColor,
      onPressed: onPressed,
      textColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if ((icon ?? '') != '') Icon(icon),
              Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
