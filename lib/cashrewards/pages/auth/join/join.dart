import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';

import '../auth_background.dart';
import 'join_form.dart';

class JoinPage extends StatelessWidget {
  static const routeName = '/join';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AuthBackground(),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 30, bottom: 12, left: 10, right: 10),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Get rewarded with cash at over 1,200 of your favourite stores',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,                      
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Shop as normal… and get real cash paid into your bank account!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,                      
                        ),
                      ),
                    ),
                    JoinForm()
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: GoBackButton(backgroundColor: Theme.of(context).accentColor),
    );
  }
}
