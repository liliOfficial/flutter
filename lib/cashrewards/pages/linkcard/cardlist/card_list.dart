import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';
import 'package:flutter_app/cashrewards/pages/linkcard/cardlist/card_background.dart';
import 'package:flutter_app/cashrewards/providers/linked_card.dart';
import 'package:flutter_app/helpers/custom_route.dart';
import 'package:flutter_app/shared/circle_word_button.dart';
import 'package:provider/provider.dart';

import 'card_add.dart';
import 'card_list_card.dart';

class CardList extends StatelessWidget {
  static const routeName = '/cardlist';

  @override
  Widget build(BuildContext context) {
    final cardList =
        Provider.of<LinkedCardProvider>(context).linkedCardProvider;
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
                            // Navigator.of(context).pushNamed('/cardadd');
                            Navigator.of(context).pushReplacement(
                              CustomRoute(builder: (ctx)=> CardAdd(),)
                            );
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
        floatingActionButton: GoBackButton(
          icon: Icons.home,
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
      ),
    );
  }
}
