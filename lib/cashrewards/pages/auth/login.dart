import 'package:flutter/material.dart';

import 'login_form.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';

  final background = Transform.scale(
    scale: 12,
    child: Container(
      width: double.infinity,
      height: 85,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          background,
          SafeArea(
            child: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 30, bottom: 12, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 25,bottom: 10),
                          child: Image.asset(
                            'assets/images/logo_white.png',
                            width: 280,
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Welcome to Cashrewards',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Text(
                        'Get rewarded with cash at over 1,200 of your favourite stores',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top:10),
                        child: Text(
                          'Shop as normal… and get real cash paid into your bank account!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                LoginForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
