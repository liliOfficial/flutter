import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';

import 'card_add_form.dart';
import 'card_background.dart';

class CardAddInfo extends StatelessWidget {
  static const routeName = '/cardaddInfo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CardBackground(),
          ListView(
            children: <Widget>[
              Align(
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Link your Mastercard',
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 10),
                            child: CardAddForm(),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: GoBackButton(),
    );
  }
}
