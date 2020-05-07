import 'package:flutter/material.dart';

final appTheme = ThemeData(
  // primarySwatch: Colors.deepPurple,
  primaryColor: Color.fromRGBO(135, 0, 215, 1),
  accentColor: Color.fromRGBO(241, 124, 33, 1),
  fontFamily: 'Montserrat',
  textTheme: ThemeData.light().textTheme.copyWith(
      body1: TextStyle(
        color: Colors.grey[900],
      ),
      body2: TextStyle(
        color: Colors.grey[900],
      ),
      title: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.grey[900]),
    textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            color: Colors.grey[900],
            fontFamily: 'Montserrat',
            fontSize: 24,
          ),
        ),
  ),
);
