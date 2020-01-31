import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';

import 'card_list_card.dart';

class CardList extends StatelessWidget {
  static const routeName = '/cardlist';

  final background = Transform.scale(
    scale: 80,
    child: Container(
      width: double.infinity,
      height: 8,
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
    return ClipRRect(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                background,
                Align(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Linked Cards',
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                      Column(
                        children: [0, 1, 2]
                            .map((data) => CardListCard())
                            .toList(),
                      )
                    ],
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
