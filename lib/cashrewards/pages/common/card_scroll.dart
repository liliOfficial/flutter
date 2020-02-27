import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_card.dart';

class CardScroll extends StatelessWidget {
  final String title;
  final List data;

  CardScroll(this.title, this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text(title, style: TextStyle(fontSize: 20)),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 5, right: 5),
          height: 240.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: data
                .map(
                  (data) => Container(
                    width: 195.0,
                    child: CardItem(
                      data.id,
                      data.name,
                      data.backgroundImageUrl,
                      data.logoImageUrl,
                      data.commissionString,
                      data.cardLinkedSpecialTerms,
                      '',
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
