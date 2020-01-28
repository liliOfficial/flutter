import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  static const routeName = '/user';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(500, 30),
            bottomRight: Radius.elliptical(500, 30),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFF3023AE),
              Color(0xFF8700D7),
            ],
          ),
        ),
        child: Center(
          child: Text(
            'user name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
