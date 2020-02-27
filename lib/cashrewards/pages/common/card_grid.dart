import 'package:flutter/material.dart';

import 'merchant_card.dart';

class CardGrid extends StatelessWidget {
  final String title;
  final List data;
  CardGrid({this.data, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (title != '')
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(title, style: TextStyle(fontSize: 20)),
          ),
        Container(
          height: 8 / (MediaQuery.of(context).size.width / 240) * 220,
          child: GridView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(5),
            children: data
                .map((data) => CardItem(
                      data.id,
                      data.name,
                      data.backgroundImageUrl,
                      data.logoImageUrl,
                      data.commissionString,
                      data.cardLinkedSpecialTerms,
                      'instore',
                    ))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 240,
              childAspectRatio: 0.85,
            ),
          ),
        ),
      ],
    );
  }
}
