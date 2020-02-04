import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';
import 'package:flutter_app/cashrewards/pages/linkcard/cardlist/card_background.dart';
import 'package:flutter_app/shared/circle_word_button.dart';

import 'card_list_card.dart';

class CardList extends StatelessWidget {
  static const routeName = '/cardlist';

  static const cardList = [
    {
      "addedDate": "2018-10-11T05:25:45.000Z",
      "cardId": "V254",
      "cardLastFour": "9835",
      "status": "Active",
      "type": "VISA"
    },
    {
      "addedDate": "2018-10-11T05:25:45.000Z",
      "cardId": "V259",
      "cardLastFour": "8888",
      "status": "Active",
      "type": "VISA"
    },
    {
      "addedDate": "2018-10-11T05:25:45.000Z",
      "cardId": "M259",
      "cardLastFour": "1234",
      "status": "Active",
      "type": "MASTER"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                            'Linked Cards',
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                        ),
                        Column(
                          children: cardList
                              .map((data) => CardListCard(data))
                              .toList(),
                        ),
                        CircleWordButton(
                          width: 110,
                          height: 110,
                          icon: Icons.add,
                          text: 'Link a card',
                          onTap: () {
                            Navigator.of(context).pushNamed('/cardadd');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        floatingActionButton: GoBackButton(),
      ),
    );
  }
}
