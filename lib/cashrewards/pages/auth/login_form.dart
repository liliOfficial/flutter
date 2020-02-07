import 'package:flutter/material.dart';
import 'package:flutter_app/shared/color_button.dart';
import 'package:flutter_app/shared/line_button.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: <Widget>[
              ColorButton(
                text: 'Join now',
                onPressed: () {},
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('or',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    )),
              ),
              LineButton(
                text: 'Sign in',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
