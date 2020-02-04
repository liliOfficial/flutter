import 'package:flutter/material.dart';

class CircleWordButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final String text;
  final Function onTap;
  final Color backgroundColor;

  CircleWordButton({
    this.width = 100,
    this.height = 100,
    this.backgroundColor,
    @required this.icon,
    @required this.text,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.20),
            blurRadius: 10, // has the effect of softening the shadow
            spreadRadius: 2, // has the effect of extending the shadow
            offset: Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(100),
      ),
      margin: EdgeInsets.all(15),
      child: SizedBox.fromSize(
        size: Size(width, height), // button width and height
        child: ClipOval(
          child: Material(
            color: backgroundColor??Theme.of(context).accentColor, // button color
            child: InkWell(
              splashColor: Colors.white, // splash color
              onTap: onTap, // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
