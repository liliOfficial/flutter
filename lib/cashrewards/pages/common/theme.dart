import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/custom_route.dart';

final appTheme = ThemeData(
  // primarySwatch: Colors.deepPurple,
  primaryColor: Color.fromRGBO(135, 0, 215, 1),
  accentColor: Color.fromRGBO(241, 124, 33, 1),
  fontFamily: 'Montserrat',
  // pageTransitionsTheme: PageTransitionsTheme(builders: {
  //   TargetPlatform.iOS: CustomPageTransitionBuilder()
  // }),
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
