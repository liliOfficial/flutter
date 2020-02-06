import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';

import 'card_background.dart';

class CardAdd extends StatelessWidget {
  static const routeName = '/cardadd';

  @override
  Widget build(BuildContext context) {
    final cardType = [
      {'logo': 'assets/images/visa.png', 'type': 'Visa'},
      {'logo': 'assets/images/mastercard.png', 'type': 'Mastercard'},
    ];
    final size = [
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height
    ].reduce(min);
    return ClipRRect(
      child: Scaffold(
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
                            'Link New Card',
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                        ),
                        Text(
                          'Please select your card',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: cardType
                                .map(
                                  (data) => Container(
                                    padding: EdgeInsets.all(size * 0.08),
                                    margin: EdgeInsets.all(size * 0.03),
                                    width: size * 0.38,
                                    height: size * 0.38,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor,
                                            width: 1)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            '/cardaddInfo',
                                            arguments: {'type': data['type']});
                                      },
                                      child: Image.asset(
                                        data['logo'],
                                        height: 26,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        floatingActionButton: GoBackButton(backgroundColor: Theme.of(context).accentColor),
      ),
    );
  }
}
