import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';

import 'user_info.dart';
import 'user_transaction.dart';

class UserPage extends StatelessWidget {
  static const routeName = '/user';

  final background = Transform.scale(
    scale: 10,
    child: Container(
      width: double.infinity,
      height: 82,
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
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  background,
                  UserInfo(),
                ],
              ),
              UserTransaction(),
            ],
          ),
        ],
      ),
      floatingActionButton: GoBackButton(),
    );
  }
}
