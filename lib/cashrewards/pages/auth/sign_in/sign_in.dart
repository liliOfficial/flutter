import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/auth/sign_in/sign_in_form.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';

import '../auth_background.dart';

class SignIn extends StatelessWidget {
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            AuthBackground(),
            SafeArea(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 12, left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 25, bottom: 10),
                            child: Image.asset(
                              'assets/images/logo_white.png',
                              width: 280,
                            )),
                        Text(
                          'Get rewarded with cash at over 1,200 of your favourite stores',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Shop as normal… and get real cash paid into your bank account!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SingInForm(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton:
            GoBackButton(backgroundColor: Theme.of(context).accentColor),
      ),
    );
  }
}
